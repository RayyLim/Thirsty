package com.thirsty.view;

import orbotix.robot.app.StartupActivity;
import orbotix.robot.base.RGBLEDOutputCommand;
import orbotix.robot.base.Robot;
import orbotix.robot.base.RobotProvider;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;

public class ConnectActivity extends Activity 
{
	public final static String TAG = "ConnectActivity";
    /**
     * ID for launching the StartupActivity for result to connect to the robot
     */
    private final static int STARTUP_ACTIVITY = 0;
    
	private Controller _application;
	
    protected boolean _active = true;
    protected int _splashTime = 5000; // time to display the splash screen in ms


	@Override
    public void onCreate(Bundle savedInstanceState) {
		Log.i(TAG, "onCreate()");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.connect_view);
        
        this._application = (Controller)getApplication();
    }
	
	@Override
	public void onStart(){
		Log.i(TAG, "onCreate()");
    	super.onStart();
    	
    	launchActivityToConnectToSphero();
	}

	private void launchActivityToConnectToSphero() {
		Log.i(TAG, "launchActivityToConnectToSphero()");
		
		if(this._application.mRobot == null)
		{
			//Launch the StartupActivity to connect to the robot
			Intent i = new Intent(this, StartupActivity.class);  
			startActivityForResult(i, STARTUP_ACTIVITY);
		}
	}
	
	@Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.i(TAG, "onActivityResult()");
        super.onActivityResult(requestCode, resultCode, data);
        
        if(requestCode == STARTUP_ACTIVITY && resultCode == RESULT_OK){

            //Get the connected Robot
            final String robot_id = data.getStringExtra(StartupActivity.EXTRA_ROBOT_ID);
            if(robot_id != null && !robot_id.equals("")){
                this._application.mRobot = RobotProvider.getDefaultProvider().findRobot(robot_id);
            }
            
            _application.nextActivityFromConnectActivity(ConnectActivity.this);
            
        }
    }
	
    public void onBackPressed() 
    {        
    	Log.i(TAG, "onCreate()");
    	this._application.disconnectRobot();        
    	super.onBackPressed();    
    }
    


}
