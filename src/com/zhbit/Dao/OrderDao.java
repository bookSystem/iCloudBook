package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.Seller;

public interface OrderDao {

	int orderAdd(Order order);

	OrderItem findOrder(int orderItemId);
	Order OrderOne(int orderId);

	void orderItemAdd(OrderItem orderItem);

	List<Order> myOrderList(int userId);

	void updateOrder(OrderItem orderItem);

	void deleteOrder(Order order);



}
