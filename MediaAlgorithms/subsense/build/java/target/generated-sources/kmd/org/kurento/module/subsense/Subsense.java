/**
 * This file is generated with Kurento-maven-plugin.
 * Please don't edit.
 */
package org.kurento.module.subsense;

import org.kurento.client.*;

/**
 *
 * Subsense interface. Documentation about the module
 *
 **/
@org.kurento.client.internal.RemoteClass
public interface Subsense extends OpenCVFilter {


    



    public class Builder extends AbstractBuilder<Subsense> {

/**
 *
 * Creates a Builder for Subsense
 *
 **/
    public Builder(org.kurento.client.MediaPipeline mediaPipeline){

      super(Subsense.class,mediaPipeline);

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