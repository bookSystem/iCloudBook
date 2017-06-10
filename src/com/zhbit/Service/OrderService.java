package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;


public interface OrderService {

	void orderAdd(String address);

	List<Order> myOrderList(int userId);

	OrderItem oneOrder(int orderItemId);

	void updateOrder(OrderItem orderItem);

	void addPay(String addr);

	Order findOrder(int orderId);

	void deleteOrder(Order order);



}
