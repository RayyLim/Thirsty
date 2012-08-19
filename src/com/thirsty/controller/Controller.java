package com.thirsty.controller;

import orbotix.robot.base.RGBLEDOutputCommand;
import orbotix.robot.base.Robot;
import orbotix.robot.base.RobotProvider;

import com.thirsty.view.ConnectActivity;
import com.thirsty.view.ResultActivity;
import com.thirsty.view.RollingActivity;
import com.thirsty.view.SetupActivity;
import com.thirsty.view.SplashActivity;
import com.thirsty.view.ShakeActivity;

import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Handler;
import android.util.Log;

public class Controller extends Application {
	  
	private final static String  TAG = "Application";
    /**
     * The Sphero Robot
     */
    public Robot mRobot;
	private ComponentName _runningService;
    
	@Override
    public void onCreate()    
    {        
    	Log.i(TAG, "onCreate()");                  
    }
    
    public void disconnectRobot() {
    	Log.i(TAG, "disconnectRobot()");


        mRobot = null;

        //Disconnect Robot
        RobotProvider.getDefaultProvider().removeAllControls();
    }
    
    /**
     * Causes the robot to blink once every second.
     * @param lit
     */
    public void blink(final boolean lit){
        
        if(mRobot != null){
            
            //If not lit, send command to show blue light, or else, send command to show no light
            if(lit){
                RGBLEDOutputCommand.sendCommand(mRobot, 0, 0, 0);
            }else{
                RGBLEDOutputCommand.sendCommand(mRobot, 0, 0, 255);
            }
            
            //Send delayed message on a handler to run blink again
            final Handler handler = new Handler();
            handler.postDelayed(new Runnable() {
                public void run() {
                    blink(!lit);
                }
            }, 1000);
        }
    }

	public void nextActivityFromSetupActivity(SetupActivity activity) 
	{

    	Intent intent = new Intent(activity, RollingActivity.class); 
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void  nextActivityFromSplashActivity(SplashActivity activity)
	{
    	Intent intent = new Intent(activity, ConnectActivity.class); 
        activity.startActivity(intent);
        activity.finish();		
	}
	
	public void nextActivityFromShakeActivity(ShakeActivity activity) 
	{
		Log.i(TAG, "nextActivityFromShakeActivity()");
    	Intent intent = new Intent(activity, SetupActivity.class); 
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromRollingActivity(RollingActivity activity) 
	{
    	Intent intent = new Intent(activity, ResultActivity.class); 
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromResultActivity(ResultActivity activity) 
	{
    	Intent intent = new Intent(activity, RollingActivity.class); 
    	activity.startActivity(intent); 
        activity.finish();		
	}

	public void nextActivityFromConnectActivity(ConnectActivity activity) {
    	Intent intent = new Intent(activity, ShakeActivity.class); 
        activity.startActivity(intent);
        activity.finish();
		
	}
}
