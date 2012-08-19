package com.thirsty.view;

import com.thirsty.R;
import com.thirsty.controller.Controller;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class SetupActivity extends Activity {
    private Controller _application;

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.setup_view);
        
        this._application = (Controller)getApplication();
    }
    
    public void toNextActivity(View view)
    {
    	this._application.nextActivityFromSetupActivity(SetupActivity.this);
    }

    public void onBackPressed() 
    {        
    	this._application.disconnectRobot();        
    	super.onBackPressed();    
    }
}
