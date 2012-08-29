package com.thirsty.controller;

import android.content.res.Resources;

import com.thirsty.R;

public class TippsyRule {

	private int _message;
	private int _color;
	private int _messagebg;
	private int _colorImage;
	private String _ruleText;

	public TippsyRule(int message, int messagebg, int colorImage, int color, String ruleText) {
		this.set_message(message);
		this.set_messagebg(messagebg);
		this.set_color(color);
		this.set_colorImage(colorImage);
		this.set_ruleText(ruleText);
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

	public String get_ruleText() {
		return _ruleText;
	}

	private void set_ruleText(String _ruleText) {
		this._ruleText = _ruleText;
	}

}
