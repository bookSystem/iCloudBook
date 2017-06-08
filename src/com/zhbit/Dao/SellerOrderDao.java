package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Order;

public interface SellerOrderDao {

	@SuppressWarnings("all")
	List getOrder(int begin, int pageSize);

	Order findOrder(int orderId);

	void dealOrder(Order order);

	int getCount();

}
