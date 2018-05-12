

package org.kurento.tutorial.player;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.io.File;
import java.util.*;
import java.io.*;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import org.kurento.module.visualizer.Visualizer;
import org.kurento.module.recorderbymovement.RecorderByMovement;
import org.kurento.module.subsense.Subsense;
import org.kurento.module.indoorpeopledetector.IndoorPeopleDetector;
import org.kurento.module.outdoorpeopledetector.OutdoorPeopleDetector;
import org.kurento.client.EndOfStreamEvent;
import org.kurento.client.ErrorEvent;
import org.kurento.client.EventListener;
import org.kurento.client.KurentoClient;
import org.kurento.client.MediaPipeline;
import org.kurento.client.MediaState;
import org.kurento.client.MediaStateChangedEvent;
import org.kurento.client.PlayerEndpoint;
import org.kurento.client.VideoInfo;
import org.kurento.commons.exception.KurentoException;
import org.kurento.jsonrpc.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.kurento.client.RecorderEndpoint;
import org.kurento.client.MediaProfileSpecType;
import org.kurento.client.MediaType;

/**
 * Class for background processing of the ip cameras. Based in PlayerHandler.java
 *
 * @author Marlon Garcia. 
 */
public class PlayerHelper
{

  @Autowired
  private final KurentoClient kurento = KurentoClient.create();

  private final Logger log = LoggerFactory.getLogger(PlayerHelper.class);

  String videoPath;
  String filterPath;
  /**
   * Create Media pipeline and build PlayerEndpoint, SubsenseFilter and DetectorFilter
   */
  // 1. Media pipeline

  //CC department hallway
  //Create Pipeline (media transmission)
  final MediaPipeline pipeline = kurento.createMediaPipeline();
  //Initialize a receiver/player for the camera stream using the pipeline and the url of the camera
  PlayerEndpoint playerEndpoint;
  //Initialize a Subsense filter (Movement detection)
  final Subsense subsensefilter1 = new Subsense.Builder(pipeline).build();
  //Initialize filter for people classification
  final IndoorPeopleDetector idf = new IndoorPeopleDetector.Builder(pipeline).build();
  //Initialize filter that triggers a context broker message and recording based on movement
  final RecorderByMovement rec1 = new RecorderByMovement.Builder(pipeline).build();

  //Dinning Entrance
  final MediaPipeline pipeline2 = kurento.createMediaPipeline();
  PlayerEndpoint playerEndpoint2;
  final Subsense subsensefilter2 = new Subsense.Builder(pipeline2).build();
  final OutdoorPeopleDetector odf = new OutdoorPeopleDetector.Builder(pipeline2).build();
  final IndoorPeopleDetector idf2 = new IndoorPeopleDetector.Builder(pipeline2).build();
  final RecorderByMovement rec2 = new RecorderByMovement.Builder(pipeline2).build();

  //INAOE's main entrance
  final MediaPipeline pipeline3 = kurento.createMediaPipeline();
  PlayerEndpoint playerEndpoint3;
  final Subsense subsensefilter3 = new Subsense.Builder(pipeline3).build();
  final RecorderByMovement rec3 = new RecorderByMovement.Builder(pipeline3).build();

  final IndoorPeopleDetector idf3= new IndoorPeopleDetector.Builder(pipeline3).build();

  //INAOE's parking lot
  final MediaPipeline pipeline4 = kurento.createMediaPipeline();
  PlayerEndpoint playerEndpoint4;
  final Subsense subsensefilter4 = new Subsense.Builder(pipeline4).build();
  final Visualizer vis4 = new Visualizer.Builder(pipeline4).build();
  final RecorderByMovement rec4 = new RecorderByMovement.Builder(pipeline4).build();
  String PEstream4 = "false";
  
  //Hallway 3
  final MediaPipeline pipeline5 = kurento.createMediaPipeline();
  PlayerEndpoint playerEndpoint5;
  final Subsense subsensefilter5 = new Subsense.Builder(pipeline5).build();
  final IndoorPeopleDetector idf5 = new IndoorPeopleDetector.Builder(pipeline5).build();
  final RecorderByMovement rec5 = new RecorderByMovement.Builder(pipeline5).build();


  public PlayerHelper(){
  /**
   * Connect playerEndpoint -> subsenseFilter -> detectorFilter
   *
   * Then, start playing the playerEndpoints
   */
    //Set the database files for people and vehicle detection
    idf.setDB(filterPath+"/ExternalDependencies/VPDetector/peopledb.dat");
    idf2.setDB(filterPath+"/ExternalDependencies/VPDetector/peopledb.dat");
    idf3.setDB(filterPath+"/ExternalDependencies/VPDetector/peopledb.dat");
    odf.setDB(filterPath+"/ExternalDependencies/VPDetector/cardb.dat");
    idf5.setDB(filterPath+"/ExternalDependencies/VPDetector/peopledb.dat");

    loadConfig();

    //Pipeline logic connections

    //con clasificador
    subsensefilter1.connect(idf);
    //subsensefilter1.connect(vi);
    //Load configuration file that includes: 
    // - Name of python file
    // - Name of function to send message
    // - Name of json file with the data model
    // - Others...
    rec1.loadConfig(filterPath+"/recorder-by-movement/config/config1.xml");
    subsensefilter1.connect(rec1);

    //con clasificador
    subsensefilter2.connect(odf);
    //subsensefilter2.connect(idf2);
    rec2.loadConfig(filterPath+"/recorder-by-movement/config/config2.xml");
    subsensefilter2.connect(rec2);

    subsensefilter3.connect(idf3);
    rec3.loadConfig(filterPath+"/recorder-by-movement/config/config3.xml");
    subsensefilter3.connect(rec3);

    subsensefilter4.connect(vis4);
    rec4.loadConfig(filterPath+"/recorder-by-movement/config/config4.xml");
    subsensefilter4.connect(rec4);

    subsensefilter5.connect(idf5);
    rec5.loadConfig(filterPath+"/recorder-by-movement/config/config5.xml");
    subsensefilter5.connect(rec5);

    log.debug("Pipeline connections ready");
    start();
  }

  /**
   * Load the configuration file
   */
  public void loadConfig()
  {
    String configFile = "/path/to/kurento/label_config.xml";
    idf.setConfiguration(configFile);
    odf.setConfiguration(configFile);
    idf3.setConfiguration(configFile);
    vis4.setConfiguration(configFile);
    idf5.setConfiguration(configFile);
  }

  /**
   * Start the camera streams
   */
  public void start()
  {
    String videourl = "";
    String videourl2 = "";
    String videourl3 = "";
    String videourl4 = "";
    String videourl5 = "";
    SAXBuilder builder = new SAXBuilder();
    File xmlFile = new File("/path/to/kurento/config.xml");
    try {
      Document document = (Document) builder.build(xmlFile);
      Element rootNode = document.getRootElement();
      videoPath = rootNode.getChildText("VideoPath");
      filterPath = rootNode.getChildText("FilterPath");
      videourl = rootNode.getChildText("CameraURL1");
      videourl2 = rootNode.getChildText("CameraURL2");
      videourl3 = rootNode.getChildText("CameraURL3");
      videourl4 = rootNode.getChildText("CameraURL4");
      videourl5 = rootNode.getChildText("CameraURL5");
    } catch (IOException io) {
      log.error("IOException: "+io.getMessage());
    } catch (JDOMException jdomex) {
      log.error("JDOMException: "+jdomex.getMessage());
    }
    log.debug("Configuration file loaded");

    playerEndpoint = new PlayerEndpoint.Builder(pipeline, videourl).build();
    playerEndpoint2 = new PlayerEndpoint.Builder(pipeline2, videourl2).build();
    playerEndpoint3 = new PlayerEndpoint.Builder(pipeline3, videourl3).build();
    playerEndpoint4 = new PlayerEndpoint.Builder(pipeline4, videourl4).build();
    playerEndpoint5 = new PlayerEndpoint.Builder(pipeline5, videourl5).build();
    log.debug("PlayerEndpoints builded");


    playerEndpoint.connect(subsensefilter1);
    subsensefilter1.connect(idf);
    //subsensefilter1.connect(vi);
    //Load configuration file that includes: 
    // - Name of python file
    // - Name of function to send message
    // - Name of json file with the data model
    // - Others...
    rec1.loadConfig(filterPath+"/recorder-by-movement/config/config1.xml");
    subsensefilter1.connect(rec1);

    //con clasificador
    playerEndpoint.connect(subsensefilter1);
    playerEndpoint2.connect(subsensefilter2);
    playerEndpoint3.connect(subsensefilter3);
    playerEndpoint4.connect(subsensefilter4);
    playerEndpoint5.connect(subsensefilter5);

    // 3. PlayEndpoint
    playerEndpoint.addErrorListener(new EventListener<ErrorEvent>() {
        @Override
        public void onEvent(ErrorEvent event) {
          log.error("ErrorEvent: {}", event.getDescription());
        }
    });

    playerEndpoint.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
        @Override
        public void onEvent(EndOfStreamEvent event) {
          log.error("EndOfCameraStreamEvent: {}", event.getTimestamp());
        }
    });

    playerEndpoint.play();
    log.debug("PlayerEndpoint playing");

    // Second camera
    playerEndpoint2.addErrorListener(new EventListener<ErrorEvent>() {
        @Override
        public void onEvent(ErrorEvent event) {
          log.error("ErrorEvent2: {}", event.getDescription());
        }
    });

    playerEndpoint2.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
        @Override
        public void onEvent(EndOfStreamEvent event) {
          log.error("EndOfCameraStreamEvent2: {}", event.getTimestamp());
        }
    });

    playerEndpoint2.play();
    log.debug("PlayerEndpoint2 playing");

    // Third camera
    playerEndpoint3.addErrorListener(new EventListener<ErrorEvent>() {
        @Override
        public void onEvent(ErrorEvent event) {
          log.error("ErrorEvent3: {}", event.getDescription());
        }
    });

    playerEndpoint3.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
        @Override
        public void onEvent(EndOfStreamEvent event) {
          log.error("EndOfCameraStreamEvent3: {}", event.getTimestamp());
        }
    });

    playerEndpoint3.play();
    log.debug("PlayerEndpoint3 playing");

    // fourth camera
    playerEndpoint4.addErrorListener(new EventListener<ErrorEvent>() {
        @Override
        public void onEvent(ErrorEvent event) {
          log.error("ErrorEvent4: {}", event.getDescription());
          PEstream4 = "true";
        }
    });

    playerEndpoint4.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
        @Override
        public void onEvent(EndOfStreamEvent event) {
          log.error("EndOfCameraStreamEvent4: {}", event.getTimestamp());
        }
    });

    playerEndpoint4.play();
    log.debug("PlayerEndpoint4 playing");

  // fifth camera
    playerEndpoint5.addErrorListener(new EventListener<ErrorEvent>() {
        @Override
        public void onEvent(ErrorEvent event) {
          log.error("ErrorEvent5: {}", event.getDescription());
        }
    });

    playerEndpoint5.addEndOfStreamListener(new EventListener<EndOfStreamEvent>() {
        @Override
        public void onEvent(EndOfStreamEvent event) {
          log.error("EndOfCameraStreamEvent5: {}", event.getTimestamp());
        }
    });

    playerEndpoint5.play();
    log.debug("PlayerEndpoint5 playing");
}

  /**
   * Stop the playerEndpoints
   */
  public void stop() throws IOException 
  {
    playerEndpoint.stop();
    playerEndpoint2.stop();
    playerEndpoint3.stop();
    playerEndpoint4.stop();
    playerEndpoint5.stop();
  }
 
  /**
   * Release the media pipeline
   */
  public void close() throws IOException 
  {
    pipeline.release();
    pipeline2.release();
    pipeline3.release();
    pipeline4.release();
    pipeline5.release();
  }

}

