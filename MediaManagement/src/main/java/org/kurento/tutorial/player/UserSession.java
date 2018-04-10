/*
 * (C) Copyright 2016 Kurento (http://kurento.org/)
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

import org.kurento.client.IceCandidate;
import org.kurento.client.MediaPipeline;
import org.kurento.client.PlayerEndpoint;
import org.kurento.client.WebRtcEndpoint;

/**
 * Class for the storage of webRtcEndpoints for each user/session
 */
public class UserSession {

  private WebRtcEndpoint webRtcEndpoint;
  private MediaPipeline mediaPipeline;
  private PlayerEndpoint playerEndpoint;

  /**
   * Empty constructor
   */
  public UserSession() {
  }

  /**
   * WebRtcEndpoint getter
   */
  public WebRtcEndpoint getWebRtcEndpoint() {
    return webRtcEndpoint;
  }

  /**
   * WebRtcEndpoint setter
   */
  public void setWebRtcEndpoint(WebRtcEndpoint webRtcEndpoint) {
    this.webRtcEndpoint = webRtcEndpoint;
  }

  /**
   * MediaPipeline getter (not used)
   */
  public MediaPipeline getMediaPipeline() {
    return mediaPipeline;
  }

  /**
   * MediaPipeline setter (not used)
   */
  public void setMediaPipeline(MediaPipeline mediaPipeline) {
    this.mediaPipeline = mediaPipeline;
  }

  /**
   * Add candidate to the webRtcEndpoint
   */
  public void addCandidate(IceCandidate candidate) {
    webRtcEndpoint.addIceCandidate(candidate);
  }

  /**
   * PlayerEndpoint getter (not used)
   */
  public PlayerEndpoint getPlayerEndpoint() {
    return playerEndpoint;
  }

  /**
   * PlayerEndpoint setter (not used)
   */
  public void setPlayerEndpoint(PlayerEndpoint playerEndpoint) {
    this.playerEndpoint = playerEndpoint;
  }

  /**
   * Delete the stored webRtcEndpoint
   */
  public void release() {
    if (this.webRtcEndpoint != null) {
      this.webRtcEndpoint.release();
    }
    if (this.playerEndpoint != null) {
      this.playerEndpoint.stop();
    }
    if (this.mediaPipeline != null) {
      this.mediaPipeline.release();
    }
  }
}
