package com.Style.dao.impl;

import java.util.Calendar;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Style.dao.Userdao;
import com.Style.model.Categories;
import com.Style.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Repository
public class Userdaoimpl implements Userdao{
	
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Autowired
	@PersistenceContext
	private EntityManager entityManager;
	
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	
	
	@Override
	public User getUserByEmail(String user_email) {			
		User user=null;
		try {
			  String sql = "SELECT * FROM t_stylesutra_user WHERE user_email = :email";
		        Query query = entityManager.createNativeQuery(sql, User.class);
		        query.setParameter("email", user_email);
		         user = (User) query.getSingleResult();
			
			System.out.println(user);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int saveUser(String user_firstname, String user_lastname, String user_email, String user_password,String accessToken) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		User user=new User();
		int userid=0;
		try {
			user.setUser_firstname(user_firstname);
			user.setUser_lastname(user_lastname);
			user.setUser_email(user_email);
			user.setUser_password(user_password);
			user.setUser_type("customer");
			user.setIs_varified(false);
			user.setAccess_token(accessToken);
			
		 userid=(int) session.save(user);
			transaction.commit();
			System.out.println("saved");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userid;
	}

	@Override
	public User getUserByAccessToken(String accessToken) {
		User user=null;
		try {
			String sql = "SELECT * FROM t_stylesutra_user WHERE access_token = :accesstoken";
	        Query query = entityManager.createNativeQuery(sql, User.class);
	        query.setParameter("accesstoken", accessToken);
	         user = (User) query.getSingleResult();
		
			System.out.println(user);

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return user;
	}



	@Override
	public void updateUser(User user) {
		Session session=sessionFactory.openSession();	
		Transaction transaction=session.beginTransaction();
		try {
			Date currentDate=new Date(Calendar.getInstance().getTimeInMillis());
			user.setAccess_token(null);
			user.setLast_logged_in(currentDate);
			session.update(user);
			transaction.commit();	
		} catch (Exception e) {
		e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	

}
