package com.thirsty.view;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

public class SetupActivity extends Activity {
    private Controller _application;
    
	private final static String TAG = "SetupActivity";
    
    protected boolean _active = true;
    protected int _splashTime = 2000; // time to display the splash screen in ms
    
    private boolean exitApplication = true;


	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.setup_view);
        
        this._application = (Controller)getApplication();
        
		TextView ruleTextView = (TextView) this.findViewById(R.id.game_instruction_text);
		Typeface tf = Typeface.createFromAsset(getAssets(),"fonts/itc-lubalin-graph-lt-demi.ttf");             
		ruleTextView.setTypeface(tf);
        

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

                	exitApplication = false;
                	_application.nextActivityFromSetupActivity(SetupActivity.this);
                    _active = false;
                }
            }
        };
        splashTread.start();
    }
	
    @Override
    public void onStart()
    {
    	Log.i(TAG, "onStart()");
    	
    	super.onStart();
    	
        exitApplication = true;
    }
    
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {
            _active = false;
        }
        return true;
    }
    
    
    public void toNextActivity(View view)
    {
    	this._application.nextActivityFromSetupActivity(SetupActivity.this);
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
