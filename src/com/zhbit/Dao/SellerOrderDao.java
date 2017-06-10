package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;

public interface SellerOrderDao {

	@SuppressWarnings("all")
	List getOrder(int begin, int pageSize,int sellerId);

	OrderItem findOrder(int orderId);

	void dealOrder(OrderItem order);

	int getCount();

}
