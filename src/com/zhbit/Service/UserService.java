package com.zhbit.Service;

import com.zhbit.Domain.Seller;
import com.zhbit.Domain.User;

public interface UserService {

	User regist(User user);

	Boolean ifUserRegist(String name);

	Boolean ifSellerRegist(String name);

	Seller regist(Seller seller);

	User login(User user);

	void updatePwd(User user, String newpassword);

	Seller login(Seller seller);

	User forgetPwd(User user);

	Seller findSeller(int sellerId);

}
