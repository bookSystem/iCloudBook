package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Order;


public interface OrderService {

	void orderAdd(String address);

	List<Order> myOrderList(int userId);

	Order oneOrder(int orderId);

	void updateOrder(Order order);

	void addPay(String addr);



}
