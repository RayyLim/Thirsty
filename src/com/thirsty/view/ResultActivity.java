package com.thirsty.view;

import com.thirsty.R;
import com.thirsty.controller.Controller;
import com.thirsty.controller.OnShakeListener;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class ResultActivity extends Activity {
	private static final String TAG = "ResultActivity";
	private Controller _application;
	private int resultColorNumber;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.result_view);

		this._application = (Controller)getApplication();


		this._application.setOnShakeListener(shakeListener);    
		this._application.startListeningForShake();

		resultColorNumber = this._application.colorNumber;


		TextView ruleTextView = (TextView) this.findViewById(R.id.rule_text);
		Typeface tf = Typeface.createFromAsset(getAssets(),"fonts/Skranji-Regular.ttf");             
		ruleTextView.setTypeface(tf);
		ruleTextView.setText(this._application.tippsyRuleList[resultColorNumber].get_ruleText());

		ImageView colorImage = (ImageView) this.findViewById(R.id.color_image);
		ImageView ruleImage = (ImageView) this.findViewById(R.id.rule_image);
		ImageView messagebgImage = (ImageView) this.findViewById(R.id.messagebg_image);

		colorImage.setImageResource(this._application.tippsyRuleList[resultColorNumber].get_colorImage());
		ruleImage.setImageResource(this._application.tippsyRuleList[resultColorNumber].get_message());
		messagebgImage.setImageResource(this._application.tippsyRuleList[resultColorNumber].get_messagebg());

	}


	OnShakeListener shakeListener = new OnShakeListener()
	{
		@Override
		public void onShake() {
			_application.stopListeningForShake();
			_application.nextActivityFromResultActivity(ResultActivity.this);		
		}        	
	};

	@Override
	public void onPause()
	{
		super.onPause();    	
		this._application.removeOnShakeListener(shakeListener);
	}


	public void onBackPressed() 
	{        
		this._application.disconnectRobot();        
		super.onBackPressed();    
	}
}
