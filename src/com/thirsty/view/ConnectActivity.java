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

public class ConnectActivity extends Activity 
{
	private Controller _application;
	
    /**
     * ID for launching the StartupActivity for result to connect to the robot
     */
    private final static int STARTUP_ACTIVITY = 0;
    
    /**
     * The Sphero Robot
     */
    private Robot mRobot;

    
    protected boolean _active = true;
    protected int _splashTime = 5000; // time to display the splash screen in ms


	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.connect_view);
        
        this._application = (Controller)getApplication();
    }
	
	@Override
	public void onStart(){
    	super.onStart();
    	
    	launchActivityToConnectToSphero();
	}

	private void launchActivityToConnectToSphero() {
		//Launch the StartupActivity to connect to the robot
		Intent i = new Intent(this, StartupActivity.class);  
		startActivityForResult(i, STARTUP_ACTIVITY);
	}
	
	@Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        
        if(requestCode == STARTUP_ACTIVITY && resultCode == RESULT_OK){

            //Get the connected Robot
            final String robot_id = data.getStringExtra(StartupActivity.EXTRA_ROBOT_ID);
            if(robot_id != null && !robot_id.equals("")){
                mRobot = RobotProvider.getDefaultProvider().findRobot(robot_id);
            }
            
            //Start blinking
            blink(false);
            
            _application.nextActivityFromConnectActivity(ConnectActivity.this);
            
        }
    }
	
    @Override
    protected void onStop() {
        super.onStop();

        mRobot = null;

        //Disconnect Robot
        RobotProvider.getDefaultProvider().removeAllControls();
    }
    
    /**
     * Causes the robot to blink once every second.
     * @param lit
     */
    private void blink(final boolean lit){
        
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

}
