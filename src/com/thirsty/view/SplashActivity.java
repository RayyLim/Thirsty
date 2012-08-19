package com.thirsty.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MotionEvent;
import android.view.View;
import com.thirsty.R;
import com.thirsty.controller.Controller;

public class SplashActivity extends Activity {

    private Controller _application;
    
    protected boolean _active = true;
    protected int _splashTime = 5000; // time to display the splash screen in ms

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
                    finish();
                    _application.nextActivityFromSplashActivity(SplashActivity.this);
                    _active = false;
                }
            }
        };
        splashTread.start();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.splash_view, menu);
        return true;
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
    	this._application.nextActivityFromSplashActivity(SplashActivity.this);
    }
}
