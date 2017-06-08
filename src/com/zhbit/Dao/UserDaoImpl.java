package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Admin;
import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	@Resource
	private SessionFactory session;
	
	@Override
	public User regist(User user) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(user);
		
		return user;
	}

	@SuppressWarnings("all")
	@Override
	public Boolean ifUserRegist(String name) {
		// TODO Auto-generated method stub
		List<User> list = this.getHibernateTemplate().find("from User where name=?", name);
		if(list!=null&&list.size()>0){
			
			return false;
		}
		
		return true;
	}

	@SuppressWarnings("all")
	@Override
	public Boolean ifSellerRegist(String name) {
		// TODO Auto-generated method stub
		
		List<Seller> list = this.getHibernateTemplate().find("from Seller where name=?", name);
		
		if(list!=null&list.size()>0){
			return false;
		}
		return true;
	}

	@Override
	public Seller regist(Seller seller) {
		// TODO Auto-generated method stub
		
		this.getHibernateTemplate().save(seller);
		return seller;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		List<User> list = this.getHibernateTemplate().find("from User where name=?and password=?",user.getName(),user.getPassword());
		if(list != null && list.size()>0){
			User u = list.get(0);
			return u;
		}
		return null;
	}

	@Override
	public void updatePwd(User user, String newpassword) {
		// TODO Auto-generated method stub
		user.setPassword(newpassword);
		this.getHibernateTemplate().update(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Seller login(Seller seller) {
		List<Seller> list = null;
		Query query = session.getCurrentSession().createQuery("from Seller s where s.name=? and s.password=?");
		query.setString(0, seller.getName());
		query.setString(1, seller.getPassword());
		list = query.list();
		if(list != null && list.size()>0){
			Seller seller2 = list.get(0);
			return seller2;
		}
		return null;
	}

	@SuppressWarnings("all")
	@Override
	public User forgetPwd(User user) {
		// TODO Auto-generated method stub
		List<User> list = this.getHibernateTemplate().find("from User where name=?and telnum=?", user.getName(),user.getTelnum());
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Seller findSeller(int sellerId) {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Seller> list = this.getHibernateTemplate().find("from Seller where sellerId=?",sellerId);
		Seller s = list.get(0);
		return s;
	}

	@Override
	public Admin login(Admin admin) {
		List<Admin> list = null;
		Query query = session.getCurrentSession().createQuery("from Admin a where a.name=? and a.password=?");
		query.setString(0, admin.getName());
		query.setString(1, admin.getPassword());
		list = query.list();
		if(list != null && list.size()>0){
			Admin ad = list.get(0);
			return ad;
		}
		return null;
	}

}
