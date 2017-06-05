package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Order;

public interface SellerOrderService {

	@SuppressWarnings("all")
	List getOrder();

	Order findOrder(int orderId);

	void dealOrder(Order order);

}
