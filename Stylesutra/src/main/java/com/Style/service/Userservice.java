package com.Style.service;

import com.Style.model.User;

public interface Userservice {

	User getUserByEmail(String user_email);

	int saveUser(String user_firstname, String user_lastname, String user_email, String user_password, String accessToken);

	User getUserByAccessToken(String accessToken);

	boolean validateUser(User user, String user_password);
	
}
