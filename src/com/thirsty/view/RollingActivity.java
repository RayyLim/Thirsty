package com.thirsty.view;

import orbotix.macro.MacroObject;
import orbotix.robot.base.DriveControl;
import orbotix.robot.base.FrontLEDOutputCommand;
import orbotix.robot.base.RGBLEDOutputCommand;
import orbotix.robot.base.RawMotorCommand;
import orbotix.robot.base.Robot;
import orbotix.robot.base.StabilizationCommand;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

public class RollingActivity extends Activity {
	
	private static final int FRAMEPERIOD = 41;

	private static int lastColor = 0;
	
	private final static String TAG = "RollingActivity";
    private final static int STARTING_SPEED = 250;

    
    private Controller _application;
	private Robot mRobot;
	
    private boolean _active = true;
    
    private int framePosition = 0;
    private int frameCount = 0;
    
    private boolean exitApplication = true;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	Log.i(TAG, "onCreate");
    	
        super.onCreate(savedInstanceState);
        setContentView(R.layout.rolling_view);
        
        this._application = (Controller)getApplication();
        this.mRobot = this._application.mRobot;
        
        final ImageView drunkAnimation = (ImageView)this.findViewById(R.id.drunk_animation);
        frameCount = this._application.tippsyAnimation.length;
        framePosition = 0;
        

        
        // thread for displaying the SplashScreen
        Thread splashTread = new Thread() {


			@Override
            public void run() {
                try {
                    while(_active) {

                    	runOnUiThread(new Runnable() { 
                    	    public void run() { 
                    	    	drunkAnimation.setImageResource(_application.tippsyAnimation[framePosition]);
                                framePosition = (framePosition + 1)%frameCount;
                                
                    	    } 
                    	}); 

                    	sleep(FRAMEPERIOD);
                        
                    }
                } catch(InterruptedException e) {
                    // do nothing
                } finally {
                    _active = false;
                }
            }
        };
        splashTread.start();
    }
    
    @Override
    public void onPause()
    {
    	super.onPause();
    	_active = false;
    }
    
    @Override
    public void onStart()
    {
    	super.onStart();
    	
    	exitApplication = true;
    	
    	// thread for displaying the SplashScreen
        Thread spinTread = new Thread() {
            @Override
            public void run() {
                StabilizationCommand.sendCommand(mRobot, false);
                spin(STARTING_SPEED);
            }
        };
        spinTread.start();

    }
    
    public void toNextActivity(View view)
    {
    	Log.i(TAG, "toNextActivity");
    	exitApplication = false;
    	this._application.nextActivityFromRollingActivity(RollingActivity.this);

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
    
    public void spin(final int speed)
    {
    
    	Log.i(TAG, "spin");
  	  if(speed < 50)
  		  return;

  	  
  	  for(int i = speed; i > 100; i--)
  	  {
  		  
  		  RawMotorCommand.sendCommand(mRobot, RawMotorCommand.MOTOR_MODE_FORWARD, i, RawMotorCommand.MOTOR_MODE_REVERSE, i);
  		  chooseNewColor();
  		  try{
  			  
  		  Thread.sleep(20);
  		  }catch(Exception e){}
  	  }

  	  
  	  RawMotorCommand.sendCommand(mRobot, RawMotorCommand.MOTOR_MODE_FORWARD, 0, RawMotorCommand.MOTOR_MODE_REVERSE, 0);

    	exitApplication = false;
  	this._application.nextActivityFromRollingActivity(RollingActivity.this);

  	  
    }
    
    private void chooseNewColor()
    {
    	Log.i(TAG, "chooseNewColor");
    	
    	
		try {

    	if(mRobot != null)
    	{
        	int random = (int)(Math.random()*this._application.tippsyRuleList.length);
    		int randomColor = this._application.tippsyRuleList[random].get_color(); 		
        	

    		RGBLEDOutputCommand.sendCommand(mRobot, 
    				Color.red(randomColor), 
    				Color.green(randomColor), 
    				Color.blue(randomColor));
    		
    		this._application.colorNumber = random;
    		
    	}
    	else
    	{

				throw new Exception("mRobot is null");

    	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
    

}
