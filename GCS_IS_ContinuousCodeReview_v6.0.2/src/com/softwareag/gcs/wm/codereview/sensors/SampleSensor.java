/**
 * 
 */
package com.softwareag.gcs.wm.codereview.sensors;

/**
 * @author ukDXP
 *
 */
public class SampleSensor extends Sensor
{

    /* (non-Javadoc)
     * @see com.softwareag.gcs.wm.codereview.sensors.Sensor#listen()
     */
    @Override
    protected void listen()
    {
	// TODO Auto-generated method stub
	this.saveMeasure("pi", "SampleSensor", "3.142");
    }

}
