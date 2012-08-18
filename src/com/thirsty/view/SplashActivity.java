package com.thirsty.view;

import com.thirsty.R;
import com.thirsty.R.layout;
import com.thirsty.R.menu;
import com.thirsty.controller.Controller;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;

public class SplashActivity extends Activity {

    private Controller _application;

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_view);
        
        this._application = (Controller)getApplication();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.splash_view, menu);
        return true;
    }
    
    public void toNextActivity(View view)
    {
    	this._application.nextActivityFromSplashActivity(SplashActivity.this);
//    	Intent intent = new Intent(SplashActivity.this, SetupActivity.class); 
//        startActivity(intent); 
//        finish();
    }
}
