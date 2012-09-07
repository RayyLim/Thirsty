package com.thirsty.view;

import orbotix.robot.app.StartupActivity;
import orbotix.robot.base.RGBLEDOutputCommand;
import orbotix.robot.base.Robot;
import orbotix.robot.base.RobotProvider;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Menu;
import android.view.MotionEvent;
import android.view.View;

import com.thirsty.R;
import com.thirsty.controller.Controller;

public class SplashActivity extends Activity {

	private final static String TAG = "SplashActivity";
	
    /**
     * ID for launching the StartupActivity for result to connect to the robot
     */
    private final static int STARTUP_ACTIVITY = 0;
	
	private Controller _application;
    
    protected boolean _active = true;
    protected int _splashTime = 5000; // time to display the splash screen in ms
    
    private boolean exitApplication = true;

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_view);
        
        this._application = (Controller)getApplication();
        
        // thread for displaying the SplashScreen
        Thread splashTread = new Thread() {
            @Override
            public void run() {
                try {
                    int waited = 0;
                    while(_active && (waited < _splashTime)) {
                        sleep(100);
                        if(_active) {
                            waited += 100;
                        }
                    }
                } catch(InterruptedException e) {
                    // do nothing
                } finally {

                	if(_active)
                	{
                	launchActivityToConnectToSphero();
                	// _application.nextActivityFromSplashActivity(SplashActivity.this);
                	}
                    _active = false;
                }
            }
        };
        splashTread.start();
    }
	
	@Override
	public void onStart(){
		Log.i(TAG, "onStart()");
    	super.onStart();

    	exitApplication = true;
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
            
            exitApplication = false;
            _application.nextActivityFromSplashActivity(this);

            
        }
    }
	
	   
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {
        	launchActivityToConnectToSphero();
            _active = false;
        }
        return true;
    }
    
    
    @Override
    public void onStop() 
    {        
    	super.onStop();

    
    	if(exitApplication)
    	{
    		this._application.disconnectRobot();
    	}
    }
}
