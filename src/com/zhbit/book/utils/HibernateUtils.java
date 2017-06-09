package com.zhbit.book.utils;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
//	static Configuration cfg = null;
//	static SessionFactory session = null;
//	static{
//		cfg = new Configuration();
//		cfg.configure();
//		session = cfg.buildSessionFactory();
//	}
//	public static SessionFactory geSessionFactory(){
//		return session;
//	}
	
	
	
	
	private static SessionFactory sessionFactory;
	static{
		try {
			Configuration cfg = new Configuration().configure();
			sessionFactory = cfg.buildSessionFactory();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public static Session getSession(){
		return sessionFactory.openSession();
	}
	
	public static void closeSession(Session session){
		if(session != null){
			if(session.isOpen()){
				session.close();
			}
		}
	}

}
