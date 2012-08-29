package com.thirsty.controller;

import android.content.res.Resources;

import com.thirsty.R;

public class TippsyRule {

	private int _message;
	private int _color;
	private int _messagebg;
	private int _colorImage;
	private String _ruleTitle;
	private String _ruleDescription;

	public TippsyRule(int message, int messagebg, int colorImage, int color, String ruleTitle, String ruleDescription) {
		this.set_message(message);
		this.set_messagebg(messagebg);
		this.set_color(color);
		this.set_colorImage(colorImage);
		this.set_ruleTitle(ruleTitle);
		this.set_ruleDescription(ruleDescription);
	}

	public int get_message() {
		return _message;
	}

	private void set_message(int _message) {
		this._message = _message;
	}

	public int get_color() {
		return _color;
	}

	private void set_color(int _color) {
		this._color = _color;
	}

	public int get_messagebg() {
		return _messagebg;
	}

	private void set_messagebg(int _messagebg) {
		this._messagebg = _messagebg;
	}

	public int get_colorImage() {
		return _colorImage;
	}

	private void set_colorImage(int _colorImage) {
		this._colorImage = _colorImage;
	}

	public String get_ruleTitle() {
		return _ruleTitle;
	}

	private void set_ruleTitle(String _ruleText) {
		this._ruleTitle = _ruleText;
	}

	public String get_ruleDescription() {
		return _ruleDescription;
	}

	private void set_ruleDescription(String _ruleDescription) {
		this._ruleDescription = _ruleDescription;
	}
	
	public boolean get_hasInfo()
	{
		return this._ruleDescription.trim().length() > 1;
	}

}
