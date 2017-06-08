package com.zhbit.Service;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.UserDao;
import com.zhbit.Domain.Admin;
import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;

@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public User regist(User user) {
		// TODO Auto-generated method stub
		
		return userDao.regist(user);
	}

	@Override
	public Boolean ifUserRegist(String username) {
		// TODO Auto-generated method stub
		return userDao.ifUserRegist(username);
	}

	@Override
	public Boolean ifSellerRegist(String name) {
		// TODO Auto-generated method stub
		return userDao.ifSellerRegist(name);
	}

	@Override
	public Seller regist(Seller seller) {
		// TODO Auto-generated method stub
		return userDao.regist(seller);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	@Override
	public void updatePwd(User user, String newpassword) {
		// TODO Auto-generated method stub
		
		userDao.updatePwd(user,newpassword);
	}

	@Override
	public Seller login(Seller seller) {
		// TODO Auto-generated method stub
		return userDao.login(seller);
	}

	@Override
	public User forgetPwd(User user) {
		// TODO Auto-generated method stub
		return userDao.forgetPwd(user);
	}

	@Override
	public Seller findSeller(int sellerId) {
		return userDao.findSeller(sellerId);
	}

	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return userDao.login(admin);
	}

}
