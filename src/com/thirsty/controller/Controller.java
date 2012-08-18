package com.thirsty.controller;

import com.thirsty.view.ResultActivity;
import com.thirsty.view.RollingActivity;
import com.thirsty.view.SetupActivity;
import com.thirsty.view.SplashActivity;
import com.thirsty.view.ShakeActivity;

import android.app.Application;
import android.content.Intent;

public class Controller extends Application {

	public void nextActivityFromSetupActivity(SetupActivity activity) 
	{
    	Intent intent = new Intent(activity, ShakeActivity.class); 
        startActivity(intent); 
        activity.finish();		
	}
	
	public void  nextActivityFromSplashActivity(SplashActivity activity)
	{
    	Intent intent = new Intent(activity, SetupActivity.class); 
        startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromShakeActivity(ShakeActivity activity) 
	{
    	Intent intent = new Intent(activity, RollingActivity.class); 
        startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromRollingActivity(RollingActivity activity) 
	{
    	Intent intent = new Intent(activity, SetupActivity.class); 
        startActivity(intent); 
        activity.finish();		
	}
	
	public void nextActivityFromResultActivityActivity(ResultActivity activity) 
	{
    	Intent intent = new Intent(activity, RollingActivity.class); 
        startActivity(intent); 
        activity.finish();		
	}
}
