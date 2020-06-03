package com.app.mycart.helper;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactroyProvider {
	
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		if(factory==null) {
			try {
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();		
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return factory;
	}

}
