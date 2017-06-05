package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Order;

public interface SellerOrderDao {

	@SuppressWarnings("all")
	List getOrder();

	Order findOrder(int orderId);

	void dealOrder(Order order);

}
