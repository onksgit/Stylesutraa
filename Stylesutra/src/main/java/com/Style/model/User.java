package com.Style.model;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "t_stylesutra_user")
public class User {

	@Id
	@SequenceGenerator(name = "t_stylesutra_user_seq", sequenceName = "t_stylesutra_user_pkid_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "t_stylesutra_user_seq")
	@Column(name = "user_id")
	private int user_id;
	@Column(name = "user_firstname")
	private String user_firstname;
	@Column(name = "user_lastname")
	private String user_lastname;
	@Column(name = "user_email", unique = true)
	private String user_email;
	@Column(name = "user_mobile")
	private String user_mobile;
	@Column(name = "user_password")
	private String user_password;
	@Column(name = "user_type")
	private String user_type;

	@Column(name = "is_varified")
	private boolean is_varified;

	@Column(name = "access_token")
	private String access_token;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_logged_in")
	private Date last_logged_in;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int user_id, String user_firstname, String user_lastname, String user_email, String user_mobile,
			String user_password, String user_type, boolean is_varified, String access_token, Date last_logged_in) {
		super();
		this.user_id = user_id;
		this.user_firstname = user_firstname;
		this.user_lastname = user_lastname;
		this.user_email = user_email;
		this.user_mobile = user_mobile;
		this.user_password = user_password;
		this.user_type = user_type;
		this.is_varified = is_varified;
		this.access_token = access_token;
		this.last_logged_in = last_logged_in;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_firstname() {
		return user_firstname;
	}

	public void setUser_firstname(String user_firstname) {
		this.user_firstname = user_firstname;
	}

	public String getUser_lastname() {
		return user_lastname;
	}

	public void setUser_lastname(String user_lastname) {
		this.user_lastname = user_lastname;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public boolean isIs_varified() {
		return is_varified;
	}

	public void setIs_varified(boolean is_varified) {
		this.is_varified = is_varified;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	
	

	public Date getLast_logged_in() {
		return last_logged_in;
	}

	public void setLast_logged_in(Date last_logged_in) {
		this.last_logged_in = last_logged_in;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_firstname=" + user_firstname + ", user_lastname=" + user_lastname
				+ ", user_email=" + user_email + ", user_mobile=" + user_mobile + ", user_password=" + user_password
				+ ", user_type=" + user_type + ", is_varified=" + is_varified + ", access_token=" + access_token
				+ ", last_logged_in=" + last_logged_in + "]";
	}

}
