package com.zhbit.Dao;

import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;

public interface UserDao {

	User regist(User user);

	Boolean ifUserRegist(String username);

	Boolean ifSellerRegist(String name);

	Seller regist(Seller seller);

	User login(User user);

	void updatePwd(User user, String newpassword);

	Seller login(Seller seller);

	User forgetPwd(User user);

	Seller findSeller(int sellerId);

}
