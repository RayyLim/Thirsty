package com.thirsty.view;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.content.Intent;
import android.hardware.SensorListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.view.View;

@SuppressWarnings("deprecation")
public class ShakeActivity extends Activity implements SensorListener  {
    private Controller _application;
    
    // For shake motion detection.
    private SensorManager sensorMgr;
    private long lastUpdate = -1;
    private float x, y, z;
    private float last_x, last_y, last_z;
    private static final int SHAKE_THRESHOLD = 800;

    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.shake_view);
        
        this._application = (Controller)getApplication();
        
        startMotionDetection();
    }


    
    protected void onPause() {
    	stopMotionDetection();
    	super.onPause();
        }


    
    public void toNextActivity(View view)
    {
    	this._application.nextActivityFromShakeActivity(ShakeActivity.this);
    }

	private void startMotionDetection() {
		// start motion detection
    	sensorMgr = (SensorManager) getSystemService(SENSOR_SERVICE);
    	boolean accelSupported = sensorMgr.registerListener(this,
    		SensorManager.SENSOR_ACCELEROMETER,
    		SensorManager.SENSOR_DELAY_GAME);
     
    	if (!accelSupported) {
    	    // on accelerometer on this device
    	    sensorMgr.unregisterListener(this,
                    SensorManager.SENSOR_ACCELEROMETER);
    	}
	}
	
	private void stopMotionDetection() {
		if (sensorMgr != null) {
    	    sensorMgr.unregisterListener(this,
                    SensorManager.SENSOR_ACCELEROMETER);
    	    sensorMgr = null;
            }
	}

	public void onAccuracyChanged(int arg0, int arg1) {
		// TODO Auto-generated method stub
		
	}

	public void onSensorChanged(int sensor, float[] values) {
		if (sensor == SensorManager.SENSOR_ACCELEROMETER) {
		    long curTime = System.currentTimeMillis();
		    // only allow one update every 100ms.
		    if ((curTime - lastUpdate) > 100) {
			long diffTime = (curTime - lastUpdate);
			lastUpdate = curTime;
	 
			x = values[SensorManager.DATA_X];
			y = values[SensorManager.DATA_Y];
			z = values[SensorManager.DATA_Z];
	 
			float speed = Math.abs(x+y+z - last_x - last_y - last_z)
	                              / diffTime * 10000;
			if (speed > SHAKE_THRESHOLD) {
			    shakeAction();
			}
			last_x = x;
			last_y = y;
			last_z = z;
		    }
		}	
	}

	private void shakeAction() 
	{
		this._application.nextActivityFromShakeActivity(ShakeActivity.this);
	}
	
    public void onBackPressed() 
    {        
    	this._application.disconnectRobot();        
    	super.onBackPressed();    
    }

}
