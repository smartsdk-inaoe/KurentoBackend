/*
 * (C) Copyright 2015 Kurento (http://kurento.org/)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.kurento.tutorial.player;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;


import org.kurento.client.EndOfStreamEvent;
import org.kurento.client.ErrorEvent;
import org.kurento.client.EventListener;
import org.kurento.client.IceCandidate;
import org.kurento.client.IceCandidateFoundEvent;
import org.kurento.client.KurentoClient;
import org.kurento.client.MediaPipeline;
import org.kurento.client.MediaState;
import org.kurento.client.MediaStateChangedEvent;
import org.kurento.client.PlayerEndpoint;
import org.kurento.client.VideoInfo;
import org.kurento.client.WebRtcEndpoint;
import org.kurento.commons.exception.KurentoException;
import org.kurento.jsonrpc.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

/**
 * Protocol handler for camera/video player through WebRTC.
 *
 * @author Boni Garcia (bgarcia@gsyc.es)
 * @author David Fernandez (dfernandezlop@gmail.com)
 * @author Ivan Gracia (igracia@kurento.org)
 * @since 6.1.1
 */
public class PlayerHandler extends TextWebSocketHandler {

  @Autowired
  private KurentoClient kurento;

  private final Logger log = LoggerFactory.getLogger(PlayerHandler.class);
  private final Gson gson = new GsonBuilder().create();
  private final ConcurrentHashMap<String, UserSession> users = new ConcurrentHashMap<>();

  final PlayerHelper ph;

  /**
   * Constructor which receives a reference to the background processing object
   */
  public PlayerHandler(PlayerHelper helper){
    ph=helper;
  }

  /**
   * Receive and manage the messages of the websocket connection with the browser from the user
   */
  @Override
  public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    JsonObject jsonMessage = gson.fromJson(message.getPayload(), JsonObject.class);
    String sessionId = session.getId();
    log.debug("Incoming message {} from sessionId", jsonMessage, sessionId);

    try {
      switch (jsonMessage.get("id").getAsString()) {
        case "start":
          start(session, jsonMessage);
          break;
        case "play":
          startVideo(session, jsonMessage);
          break;
        case "stop":
          stop(sessionId);
          break;
        case "pause":
          pause(sessionId);
          break;
        case "resume":
          resume(session);
          break;
        case "doSeek":
          doSeek(session, jsonMessage);
          break;
        case "getPosition":
          getPosition(session);
          break;
        case "onIceCandidate":
          onIceCandidate(sessionId, jsonMessage);
          break;
        case "restartCameras":
          ph.stop();
          ph.start();
          break;
        case "updateLabels":
          ph.loadConfig();
          break;
        default:
          sendError(session, "Invalid message with id " + jsonMessage.get("id").getAsString());
          break;
      }
    } catch (Throwable t) {
      log.error("Exception handling message {} in sessionId {}", jsonMessage, sessionId, t);
      sendError(session, t.getMessage());
    }
  }

  /**
   * Create a session for each websocket, and use the pipeline of the background processing object to build 
   * the WebRtcEndpoint.
   *
   * Select the camera feed corresponding to the requested camera and then connect the output of the filter to the webRtcEndpoint
   *
   * Then, start the ice candidate gathering
   */
  private void start(final WebSocketSession session, JsonObject jsonMessage) {
    // 1. Media pipeline
    final UserSession user = new UserSession();

    WebRtcEndpoint webRtcEndpoint;// = new WebRtcEndpoint.Builder(pipeline).build();
    //user.setWebRtcEndpoint(webRtcEndpoint);
    String videourl = jsonMessage.get("videourl").getAsString();
    JsonObject response = new JsonObject();
    response.addProperty("id", "streamStatus");
    switch(videourl){
      case "1":
        webRtcEndpoint = new WebRtcEndpoint.Builder(ph.pipeline).build();
	ph.idf.connect(webRtcEndpoint);
        //ph.vi.connect(webRtcEndpoint);
        response.addProperty("status", ph.PEstream1);
        break;
      case "2":
        webRtcEndpoint = new WebRtcEndpoint.Builder(ph.pipeline2).build();
        ph.odf.connect(webRtcEndpoint);
        //ph.idf2.connect(webRtcEndpoint);
        //ph.vi2.connect(webRtcEndpoint);
        response.addProperty("status", ph.PEstream2);
        break;
      case "3":
        webRtcEndpoint = new WebRtcEndpoint.Builder(ph.pipeline3).build();
        //ph.detectorfilter3.connect(webRtcEndpoint);
        ph.idf3.connect(webRtcEndpoint);
        response.addProperty("status", ph.PEstream3);
        break;
      case "4":
        webRtcEndpoint = new WebRtcEndpoint.Builder(ph.pipeline4).build();
        ph.vis4.connect(webRtcEndpoint);
        response.addProperty("status", ph.PEstream4);
        break;
      default:
        webRtcEndpoint = new WebRtcEndpoint.Builder(ph.pipeline5).build();
        ph.idf5.connect(webRtcEndpoint);
        response.addProperty("status", ph.PEstream5);
        break;
    }
    sendMessage(session, response.toString());
    user.setWebRtcEndpoint(webRtcEndpoint);
    users.put(session.getId(), user);

    // 2. WebRtcEndpoint
    // ICE candidates
    webRtcEndpoint.addIceCandidateFoundListener(new EventListener<IceCandidateFoundEvent>() {

      @Override
      public void onEvent(IceCandidateFoundEvent event) {
        JsonObject response = new JsonObject();
        response.addProperty("id", "iceCandidate");
        response.add("candidate", JsonUtils.toJsonObject(event.getCandidate()));
        try {
          synchronized (session) {
            session.sendMessage(new TextMessage(response.toString()));
          }
        } catch (IOException e) {
          log.error(e.getMessage());
        }
      }
    });

    String sdpOffer = jsonMessage.get("sdpOffer").getAsString();
    String sdpAnswer = webRtcEndpoint.processOffer(sdpOffer);

    response = new JsonObject();
    response.addProperty("id", "startResponse");
    response.addProperty("sdpAnswer", sdpAnswer);
    sendMessage(session, response.toString());

    webRtcEndpoint.addMediaStateChangedListener(new EventListener<MediaStateChangedEvent>() {
      @Override
      public void onEvent(MediaStateChangedEvent event) {
        if (event.getNewState() == MediaState.CONNECTED) {
          JsonObject response = new JsonObject();
          response.addProperty("id", "videoInfo");
          sendMessage(session, response.toString());
        }
      }
    });
    webRtcEndpoint.gatherCandidates();
  }

  /**
   * Play the selected video and connect the stream to the browser
   */
  private void startVideo(final WebSocketSession session, JsonObject jsonMessage) {final UserSession user = new UserSession();
    MediaPipeline pipeline = kurento.createMediaPipeline();
    user.setMediaPipeline(pipeline);
    WebRtcEndpoint webRtcEndpoint = new WebRtcEndpoint.Builder(pipeline).build();
    user.setWebRtcEndpoint(webRtcEndpoint);
    String videourl = jsonMessage.get("videourl").getAsString();
    log.debug("videourl: "+ph.videoPath+"/"+videourl);
    final PlayerEndpoint playerEndpoint = new PlayerEndpoint.Builder(pipeline, "file://"+ph.videoPath+"/"+videourl).build();
    user.setPlayerEndpoint(playerEndpoint);
    users.put(session.getId(), user);

    playerEndpoint.connect(webRtcEndpoint);

    // 2. WebRtcEndpoint
    // ICE candidates
    webRtcEndpoint.addIceCandidateFoundListener(new EventListener<IceCandidateFoundEvent>() {

      @Override
      public void onEvent(IceCandidateFoundEvent event) {
        JsonObject response = new JsonObject();
        response.addProperty("id", "iceCandidate");
        response.add("candidate", JsonUtils.toJsonObject(event.getCandidate()));
        try {
          synchronized (session) {
            session.sendMessage(new TextMessage(response.toString()));
          }
        } catch (IOException e) {
          log.error(e.getMessage());
        }
      }
    });

    String sdpOffer = jsonMessage.get("sdpOffer").getAsString();
    String sdpAnswer = webRtcEndpoint.processOffer(sdpOffer);

    JsonObject response = new JsonObject();
    response.addProperty("id", "startResponse");
    response.addProperty("sdpAnswer", sdpAnswer);
    sendMessage(session, response.toString());

    webRtcEndpoint.addMediaStateChangedListener(new EventListener<MediaStateChangedEvent>() {
      @Override
      public void onEvent(MediaStateChangedEvent event) {
        if (event.getNewState() == MediaState.CONNECTED) {
          log.info("VideoInfo avalable");
          VideoInfo videoInfo = playerEndpoint.getVideoInfo();
          JsonObject response = new JsonObject();
          response.addProperty("id", "videoInfo");
          response.addProperty("isSeekable", videoInfo.getIsSeekable());
          response.addProperty("initSeekable", videoInfo.getSeekableInit());
          response.addProperty("endSeekable", videoInfo.getSeekableEnd());
          response.addProperty("videoDuration", videoInfo.getDuration());
          sendMessage(session, response.toString());
        }
      }
    });
    webRtcEndpoint.gatherCandidates();
    
    // 3. PlayEndpoint
    playerEndpoint.addErrorListener(new EventListener<ErrorEvent>() {
      @Override
      public void onEvent(ErrorEvent event) {
        log.error("VideoErrorEvent: {}", event.getDescription());
        sendPlayEnd(session);
      }
    });

    playerEndpoint.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
      @Override
      public void onEvent(EndOfStreamEvent event) {
        log.info("EndOfVideoStreamEvent: {}", event.getTimestamp());
        sendPlayEnd(session);
      }
    });
    
    playerEndpoint.play();
    log.debug("PlayerEndpoint playing video");
    
  }

  /**
   * Delete the session and release the webRTCEndpoint
   */
  private void stop(String sessionId) {
    UserSession user = users.remove(sessionId);

    if (user != null) {
      user.release();
    }
  }

  /**
   * Pause the video
   */
  private void pause(String sessionId) {
    UserSession user = users.get(sessionId);

    if (user != null) {
      user.getPlayerEndpoint().pause();
    }
  }

  /**
   * Continue playing the video in the current position
   */
  private void resume(final WebSocketSession session) {
    UserSession user = users.get(session.getId());

    if (user != null) {
      user.getPlayerEndpoint().play();
      VideoInfo videoInfo = user.getPlayerEndpoint().getVideoInfo();

      JsonObject response = new JsonObject();
      response.addProperty("id", "videoInfo");
      response.addProperty("isSeekable", videoInfo.getIsSeekable());
      response.addProperty("initSeekable", videoInfo.getSeekableInit());
      response.addProperty("endSeekable", videoInfo.getSeekableEnd());
      response.addProperty("videoDuration", videoInfo.getDuration());
      sendMessage(session, response.toString());
    }
  }

  /**
   * Use the value sent from the browser to jump the playing of the video to the specified position
   */
  private void doSeek(final WebSocketSession session, JsonObject jsonMessage) {
    UserSession user = users.get(session.getId());

    if (user != null) {
      try {
        user.getPlayerEndpoint().setPosition(jsonMessage.get("position").getAsLong());
      } catch (KurentoException e) {
        log.debug("The seek cannot be performed");
        JsonObject response = new JsonObject();
        response.addProperty("id", "seek");
        response.addProperty("message", "Seek failed");
        sendMessage(session, response.toString());
      }
    }
  }

  /**
   * Get the current position of the video and send it to the browser
   */
  private void getPosition(final WebSocketSession session) {
    UserSession user = users.get(session.getId());

    if (user != null) {
      long position = user.getPlayerEndpoint().getPosition();

      JsonObject response = new JsonObject();
      response.addProperty("id", "position");
      response.addProperty("position", position);
      sendMessage(session, response.toString());
    }
  }

  /**
   * Receive the ice candidates from the browser to stablish the webrtc connection
   */
  private void onIceCandidate(String sessionId, JsonObject jsonMessage) {
    UserSession user = users.get(sessionId);
    if (user != null) {
      JsonObject jsonCandidate = jsonMessage.get("candidate").getAsJsonObject();
      IceCandidate candidate =
          new IceCandidate(jsonCandidate.get("candidate").getAsString(), jsonCandidate
              .get("sdpMid").getAsString(), jsonCandidate.get("sdpMLineIndex").getAsInt());
      log.debug("Session "+sessionId+"-> add "+jsonCandidate.get("candidate").getAsString());
      user.getWebRtcEndpoint().addIceCandidate(candidate);
    }
  }

  /**
   * If the camera feed is interrupted or cancelled, inform the browser to close the video playing
   */
  public void sendPlayEnd(WebSocketSession session) {
    if (users.containsKey(session.getId())) {
      JsonObject response = new JsonObject();
      response.addProperty("id", "playEnd");
      sendMessage(session, response.toString());
    }
  }

  /**
   * Inform the browser of errors in the system
   */
  private void sendError(WebSocketSession session, String message) {
    if (users.containsKey(session.getId())) {
      JsonObject response = new JsonObject();
      response.addProperty("id", "error");
      response.addProperty("message", message);
      sendMessage(session, response.toString());
    }
  }

  /**
   * Send a message to the browser through the websocket specified in the session
   */
  private synchronized void sendMessage(WebSocketSession session, String message) {
    try {
      session.sendMessage(new TextMessage(message));
    } catch (IOException e) {
      log.error("Exception sending message", e);
    }
  }

  /**
   * If the browser is closed or the communication is interrupted close the session
   */
  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    stop(session.getId());
  }
}
