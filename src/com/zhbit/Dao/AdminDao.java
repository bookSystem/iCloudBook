package com.zhbit.Dao;

import java.util.List;
@SuppressWarnings("all")
public interface AdminDao {

	int getCount();

	List showUser(int begin, int pageSize);

	List deleteUser(int userId);

	List showSeller(int begin, int pageSize);

	List deleteSeller(int sellerId);

}
