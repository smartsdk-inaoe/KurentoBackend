/**
 * This file is generated with Kurento-maven-plugin.
 * Please don't edit.
 */
package org.kurento.module.outdoorpeopledetector;

import org.kurento.client.*;

/**
 *
 * OutdoorPeopleDetector interface. Documentation about the module
 *
 **/
@org.kurento.client.internal.RemoteClass
public interface OutdoorPeopleDetector extends OpenCVFilter {



/**
 *
 * Set the database to be loaded.
 *
 * @param db
 *       ..
 *
 **/
  void setDB(@org.kurento.client.internal.server.Param("db") String db);

/**
 *
 * Asynchronous version of setDB:
 * {@link Continuation#onSuccess} is called when the action is
 * done. If an error occurs, {@link Continuation#onError} is called.
 * @see OutdoorPeopleDetector#setDB
 *
 * @param db
 *       ..
 *
 **/
    void setDB(@org.kurento.client.internal.server.Param("db") String db, Continuation<Void> cont);

/**
 *
 * Set the database to be loaded.
 *
 * @param db
 *       ..
 *
 **/
    void setDB(Transaction tx, @org.kurento.client.internal.server.Param("db") String db);


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
 * @see OutdoorPeopleDetector#setConfiguration
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

    



    public class Builder extends AbstractBuilder<OutdoorPeopleDetector> {

/**
 *
 * Creates a Builder for OutdoorPeopleDetector
 *
 **/
    public Builder(org.kurento.client.MediaPipeline mediaPipeline){

      super(OutdoorPeopleDetector.class,mediaPipeline);

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