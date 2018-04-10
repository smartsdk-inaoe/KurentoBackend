/**
 * This file is generated with Kurento-maven-plugin.
 * Please don't edit.
 */
package org.kurento.module.visualizer;

import org.kurento.client.*;

/**
 *
 * Visualizer interface. Documentation about the module
 *
 **/
@org.kurento.client.internal.RemoteClass
public interface Visualizer extends OpenCVFilter {



/**
 *
 * Read the parameters for drawing.
 *
 * @param file
 *       ..
 *
 **/
  void setConfiguration(@org.kurento.client.internal.server.Param("file") String file);

/**
 *
 * Asynchronous version of setConfiguration:
 * {@link Continuation#onSuccess} is called when the action is
 * done. If an error occurs, {@link Continuation#onError} is called.
 * @see Visualizer#setConfiguration
 *
 * @param file
 *       ..
 *
 **/
    void setConfiguration(@org.kurento.client.internal.server.Param("file") String file, Continuation<Void> cont);

/**
 *
 * Read the parameters for drawing.
 *
 * @param file
 *       ..
 *
 **/
    void setConfiguration(Transaction tx, @org.kurento.client.internal.server.Param("file") String file);

    



    public class Builder extends AbstractBuilder<Visualizer> {

/**
 *
 * Creates a Builder for Visualizer
 *
 **/
    public Builder(org.kurento.client.MediaPipeline mediaPipeline){

      super(Visualizer.class,mediaPipeline);

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