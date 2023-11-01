package com.Style.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Style.dao.Admindao;
import com.Style.dao.Userdao;
import com.Style.model.User;
import com.Style.service.Userservice;

@Service
public class Userserviceimpl implements Userservice {

	@Autowired
	private Userdao Userdao;

	public void setUserdao(Userdao userdao) {
		Userdao = userdao;
	}

	@Override
	public User getUserByEmail(String user_email) {
		return Userdao.getUserByEmail(user_email);
	}

	@Override
	public int saveUser(String user_firstname, String user_lastname, String user_email, String user_password,
			String accessToken) {
		return Userdao.saveUser(user_firstname, user_lastname, user_email, user_password, accessToken);
	}

	@Override
	public User getUserByAccessToken(String accessToken) {
		return Userdao.getUserByAccessToken(accessToken);
	}

	@Override
	public boolean validateUser(User user, String user_password) {
		boolean isverified = false;
		try {
			if( user.isIs_varified() == true) {
				Userdao.updateUser(user);
				isverified = true;
			} else {
				isverified = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			isverified = false;
		}
		return isverified;

	}

}
