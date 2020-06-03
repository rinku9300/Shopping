package com.app.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.app.mycart.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// get user by email and password
	public User gerUserByEmailAndPassword(String email,String password ) {
		User user=null;
		try {
			String query="from User where userEmail=: e and userPassword=: p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user=(User) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
		
	}
}
