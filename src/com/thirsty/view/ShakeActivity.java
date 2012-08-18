package com.thirsty.view;

import com.thirsty.R;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class ShakeActivity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_view);
    }
    
    public void toNextActivity(View view)
    {
    	Intent intent = new Intent(ShakeActivity.this, RollingActivity.class); 
        startActivity(intent); 
        finish();
    }

}
