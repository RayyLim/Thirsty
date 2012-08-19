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
  

	public void nextActivityFromSetupActivity(SetupActivity activity) 
	{

		Log.i(TAG, "nextActivityFromSetupActivity()");
    	Intent intent = new Intent(activity, RollingActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void  nextActivityFromSplashActivity(SplashActivity activity)
	{
		Log.i(TAG, "nextActivityFromSplashActivity()");
    	Intent intent = new Intent(activity, ConnectActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        activity.startActivity(intent);
        activity.finish();		
	}
	
	public void nextActivityFromShakeActivity(ShakeActivity activity) 
	{
		Log.i(TAG, "nextActivityFromShakeActivity()");
    	Intent intent = new Intent(activity, SetupActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromRollingActivity(RollingActivity activity) 
	{
		Log.i(TAG, "nextActivityFromRollingActivity()");
    	Intent intent = new Intent(activity, ResultActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
    	activity.startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromResultActivity(ResultActivity activity) 
	{
		Log.i(TAG, "nextActivityFromResultActivity()");
    	Intent intent = new Intent(activity, RollingActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
    	activity.startActivity(intent); 
        activity.finish();		
	}

	public void nextActivityFromConnectActivity(ConnectActivity activity) {
		Log.i(TAG, "nextActivityFromConnectActivity()");
    	Intent intent = new Intent(activity, ShakeActivity.class); 
    	intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        activity.startActivity(intent);
        activity.finish();
		
	}
}
