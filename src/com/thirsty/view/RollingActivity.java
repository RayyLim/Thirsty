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

public class RollingActivity extends Activity {
	
	private static int lastColor = 0;
	
	private final static String TAG = "RollingActivity";
    private final static int STARTING_SPEED = 250;

    
    private Controller _application;
	private Robot mRobot;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	Log.i(TAG, "onCreate");
    	
        super.onCreate(savedInstanceState);
        setContentView(R.layout.rolling_view);
        
        this._application = (Controller)getApplication();
        this.mRobot = this._application.mRobot;
        

    }
    
    @Override
    public void onStart()
    {
    	super.onStart();
    	
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
    	this._application.nextActivityFromRollingActivity(RollingActivity.this);
    }

    public void onBackPressed() 
    {        
    	Log.i(TAG, "onBackPressed");
    	this._application.disconnectRobot();        
    	super.onBackPressed();    
    }
    
    public void spin(final int speed)
    {
    
    	Log.i(TAG, "spin");
  	  if(speed < 50)
  		  return;
//  	  FrontLEDOutputCommand.sendCommand(mRobot, 1.0f);
  //	  final Handler handler = new Handler();
  	  //RawMotorCommand.sendCommand(mRobot, RawMotorCommand.MOTOR_MODE_FORWARD, 180, RawMotorCommand.MOTOR_MODE_REVERSE, 180);
//  	  MacroObject macro = new MacroObject();
//  	  macro.setRobot(mRobot);
//  	  macro.setMode(MacroObject.MacroObjectMode.Normal);
  	  
      /*  MacroObject fadeMacro = new MacroObject();
        macro.addCommand(new LoopStart(1500));
        macro.addCommand(new Fade(0, 0, 0, 500));
        macro.addCommand(new Fade(0, 0, 255, 500));
        macro.addCommand(new Fade(0, 255, 0, 500));
        macro.addCommand(new LoopEnd());
        macro.playMacro();*/
  	  
  	  for(int i = speed; i > 100; i--)
  	  {
  		/*  AbortMacroCommand.sendCommand(mRobot);
  		  macro.addCommand(new RGB(255, (int)(Math.random() * 255),
  				  (int)(Math.random() * 255),
  				  (int)(Math.random() * 255)));
  		  macro.playMacro();*/
  		  
  		  RawMotorCommand.sendCommand(mRobot, RawMotorCommand.MOTOR_MODE_FORWARD, i, RawMotorCommand.MOTOR_MODE_REVERSE, i);
  		  chooseNewColor();
  		  try{
  			  
  		  Thread.sleep(20);
  		  }catch(Exception e){}
  	  }

  	  
  	  RawMotorCommand.sendCommand(mRobot, RawMotorCommand.MOTOR_MODE_FORWARD, 0, RawMotorCommand.MOTOR_MODE_REVERSE, 0);
  	  // chooseNewColor();

  	this._application.nextActivityFromRollingActivity(RollingActivity.this);

  	  
    }
    
    private void chooseNewColor()
    {
    	Log.i(TAG, "chooseNewColor");
    	
    	
		try {

    	if(mRobot != null)
    	{
        	int random = (int)(Math.random()*this._application.gameColors.length);
    		int randomColor = this._application.gameColors[random]; 		
        	

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
