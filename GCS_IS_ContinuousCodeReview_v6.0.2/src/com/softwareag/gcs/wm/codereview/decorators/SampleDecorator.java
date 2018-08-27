package com.softwareag.gcs.wm.codereview.decorators;

import java.util.List;
import com.softwareag.gcs.wm.codereview.configuration.bindings.ResultsType;

public class SampleDecorator extends Decorator
{

    /**
     * Decorate the sensor readings
     */
    public void decorate()
    {
	//Get sensor results
	List<ResultsType> results = this.getResults();
	
	//save mesaure as per the sensor
	this.saveMeasure("pi", "SampleDecorator", "3.142");
	
    }

}
