package com.Style.dao;

import com.Style.model.User;

public interface Userdao {

	User getUserByEmail(String user_email);

	int saveUser(String user_firstname, String user_lastname, String user_email, String user_password,String accessToken);

	User getUserByAccessToken(String accessToken);

	void updateUser(User user);
	
	
	
	

}
