package com.Style.utils;

import java.util.ResourceBundle;

public class Message {
	public static String getMessage(String messageKey) {
		final ResourceBundle MESSAGES = ResourceBundle.getBundle("com.Style.properties.Message");
		return MESSAGES.getString(messageKey);
	}
}