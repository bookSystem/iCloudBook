package com.zhbit.Dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

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
	public void regist(Seller seller) {
		// TODO Auto-generated method stub
		
		this.getHibernateTemplate().save(seller);
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
		// TODO Auto-generated method stub
		List<Seller> list = this.getHibernateTemplate().find("from Seller where name=?and password=?",seller.getName(),seller.getPassword());
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

	
	
}
