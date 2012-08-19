package com.thirsty.view;

import java.util.List;

import orbotix.robot.app.StartupActivity;
import orbotix.robot.base.ConfigureCollisionDetectionCommand;
import orbotix.robot.base.DeviceAsyncData;
import orbotix.robot.base.DeviceMessenger;
import orbotix.robot.base.DeviceSensorsAsyncData;
import orbotix.robot.base.Robot;
import orbotix.robot.base.RobotProvider;
import orbotix.robot.base.SetDataStreamingCommand;
import orbotix.robot.base.StabilizationCommand;
import orbotix.robot.sensor.AccelerometerData;
import orbotix.robot.sensor.AttitudeData;
import orbotix.robot.sensor.DeviceSensorsData;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.content.Intent;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

@SuppressWarnings("deprecation")
public class ShakeActivity extends Activity {
	
	private final static String TAG = "ShakeActivity";
    private Controller _application;
	private Robot mRobot;
	private boolean ballInHand = false;
    
	
    /**
     * Data Streaming Packet Counts
     */
    private final static int TOTAL_PACKET_COUNT = 200;
    private final static int PACKET_COUNT_THRESHOLD = 50;
    private final static int STARTING_SPEED = 250;
    private final static int SHAKE_THRESHOLD = 4;
    private final static double BALL_STILL_THRESHOLD = 0.93;
    private int mPacketCounter;
    private float mAccelCurrent;

    
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	Log.i(TAG, "onCreate()");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.shake_view);
        
        this._application = (Controller)getApplication();
        this.mRobot = this._application.mRobot;
        
        requestDataStreaming();
        
        //Set the AsyncDataListener that will process each response.
        DeviceMessenger.getInstance().addAsyncDataListener(mRobot, mDataListener);
        
        

        StabilizationCommand.sendCommand(mRobot, false);
    }


    
    protected void onPause() {
    	super.onPause();
        }

    private void requestDataStreaming() {

        if(mRobot != null){
        	
            // Set up a bitmask containing the sensor information we want to stream
            final long mask = SetDataStreamingCommand.DATA_STREAMING_MASK_ACCELEROMETER_FILTERED_ALL |
            				  SetDataStreamingCommand.DATA_STREAMING_MASK_IMU_ANGLES_FILTERED_ALL;

            // Specify a divisor. The frequency of responses that will be sent is 400hz divided by this divisor.
            final int divisor = 50;

            // Specify the number of frames that will be in each response. You can use a higher number to "save up" responses
            // and send them at once with a lower frequency, but more packets per response.
            final int packet_frames = 1;

            // Reset finite packet counter
            mPacketCounter = 0;
            
            // Count is the number of async data packets Sphero will send you before
            // it stops.  You want to register for a finite count and then send the command
            // again once you approach the limit.  Otherwise data streaming may be left
            // on when your app crashes, putting Sphero in a bad state 
            final int response_count = TOTAL_PACKET_COUNT;

            //Send this command to Sphero to start streaming
            SetDataStreamingCommand.sendCommand(mRobot, divisor, packet_frames, mask, response_count);
        }
    }
    
    /**
     * AsyncDataListener that will be assigned to the DeviceMessager, listen for streaming data, and then do the
     */
    private DeviceMessenger.AsyncDataListener mDataListener = new DeviceMessenger.AsyncDataListener() {
        @Override
        public void onDataReceived(DeviceAsyncData data) {
            if(data instanceof DeviceSensorsAsyncData){

            	// If we are getting close to packet limit, request more
            	mPacketCounter++;
            	if( mPacketCounter > (TOTAL_PACKET_COUNT - PACKET_COUNT_THRESHOLD) ) {
            		requestDataStreaming();
            	}
            	
                //get the frames in the response
                List<DeviceSensorsData> data_list = ((DeviceSensorsAsyncData)data).getAsyncData();
                if(data_list != null){

                    //Iterate over each frame
                    for(DeviceSensorsData datum : data_list){

                        //Show attitude data
                        AttitudeData attitude = datum.getAttitudeData();

                        //Show accelerometer data
                        AccelerometerData accel = datum.getAccelerometerData();
                        if(attitude != null){
                      	  double x = accel.getFilteredAcceleration().x;
                      	  double y = accel.getFilteredAcceleration().y;
                      	  double z = accel.getFilteredAcceleration().z;
                      	  
                      	  mAccelCurrent = (float) Math.sqrt((double) (x*x + y*y + z*z));
                      	  if(mAccelCurrent > SHAKE_THRESHOLD)
                      	  {
                      		  ballInHand = true;
                      		  Log.i("mathu", "SHAKE DETECTED");
                      		  actionWhenShakeDetected();
                      		  
                      		  try{
                          		  Thread.sleep(1000);
                      		  }catch(Exception e){}
                      	  }
                        }
                    }
                }
            }
        }

		private void actionWhenShakeDetected() {
			Log.i(TAG, "actionWhenShakeDetected()");
			_application.nextActivityFromShakeActivity(ShakeActivity.this);
			DeviceMessenger.getInstance().removeAsyncDataListener(mRobot, mDataListener);			
		}
    };
	
	public void onAccuracyChanged(int arg0, int arg1) {
		// TODO Auto-generated method stub
		
	}

    public void onBackPressed() 
    {        
    	this._application.disconnectRobot();        
    	super.onBackPressed();    
    }

}
