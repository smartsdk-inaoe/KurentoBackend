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

/**
 * @package org.kurento.tutorial.player
 * Documentation of the java client for kurento
 * 
 * Contains the code to run the springboot app and initializes the background processing
 */

package org.kurento.tutorial.player;

import java.io.IOException;

import javax.annotation.PreDestroy;
import org.kurento.client.KurentoClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * Play of an ip camera through WebRTC (main).
 * 
 * @author Boni Garcia (bgarcia@gsyc.es)
 * @since 6.1.1
 */
@EnableWebSocket
@SpringBootApplication
public class PlayerApp implements WebSocketConfigurer {
  final static String DEFAULT_KMS_WS_URI = "wss://localhost:8433/kurento";

  /**
   * @var PlayerHelper ph
   * @brief Object for background processing of ip cameras
   */
  static PlayerHelper ph;

  /**
   * Create the instance that will answer the requests of camera connections
   */
  @Bean
  public PlayerHandler handler() {
    return new PlayerHandler(ph);
  }

  /**
   * Initialize the kurento client to exchange messages with kurento server
   */
  @Bean
  public KurentoClient kurentoClient() {
    return KurentoClient.create();
  }

  /**
   * Stablish the webfolder that will provide the websocket connections
   */
  @Override
  public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    registry.addHandler(handler(), "/player").setAllowedOrigins("*");
  }

  /**
   * Stop the background processing when the server is shutdown
   */
  @PreDestroy
  public void myClose() throws IOException {
    ph.stop();
  }

  /**
   * Initialize the class that process the ip camera feeds in the background
   */
  public static void main(String[] args) throws Exception {
    ph = new PlayerHelper();
    new SpringApplication(PlayerApp.class).run(args);
  }
}
