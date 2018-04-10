/**
 * This file is generated with Kurento-maven-plugin.
 * Please don't edit.
 */
package org.kurento.module.recorderbymovement;

import org.kurento.client.*;

/**
 *
 * RecorderByMovement interface. Documentation about the module
 *
 **/
@org.kurento.client.internal.RemoteClass
public interface RecorderByMovement extends OpenCVFilter {



/**
 *
 * Pass the config file path and load it.
 *
 * @param file
 *       ...
 *
 **/
  void loadConfig(@org.kurento.client.internal.server.Param("file") String file);

/**
 *
 * Asynchronous version of loadConfig:
 * {@link Continuation#onSuccess} is called when the action is
 * done. If an error occurs, {@link Continuation#onError} is called.
 * @see RecorderByMovement#loadConfig
 *
 * @param file
 *       ...
 *
 **/
    void loadConfig(@org.kurento.client.internal.server.Param("file") String file, Continuation<Void> cont);

/**
 *
 * Pass the config file path and load it.
 *
 * @param file
 *       ...
 *
 **/
    void loadConfig(Transaction tx, @org.kurento.client.internal.server.Param("file") String file);

    



    public class Builder extends AbstractBuilder<RecorderByMovement> {

/**
 *
 * Creates a Builder for RecorderByMovement
 *
 **/
    public Builder(org.kurento.client.MediaPipeline mediaPipeline){

      super(RecorderByMovement.class,mediaPipeline);

      props.add("mediaPipeline",mediaPipeline);
    }

	public Builder withProperties(Properties properties) {
    	return (Builder)super.withProperties(properties);
  	}

	public Builder with(String name, Object value) {
		return (Builder)super.with(name, value);
	}
	
    }


}