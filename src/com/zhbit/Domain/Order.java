package com.zhbit.Domain;

import java.util.HashSet;
import java.util.Set;

public class Order {
	private int orderId;
	private String orderNumber;// 订单编号
	private String orderTime;// 下单时间
	private double total;// 总计
	private String isDeal;// 订单状态
	private String address;// 收货地址
	private User user;// 订单的所有者
	private Seller seller;// 订单的所有者
	private Set<OrderItem> setOrderItems = new HashSet<OrderItem>();

	public Set<OrderItem> getSetOrderItems() {
		return setOrderItems;
	}

	public void setSetOrderItems(Set<OrderItem> setOrderItems) {
		this.setOrderItems = setOrderItems;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	
	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getIsDeal() {
		return isDeal;
	}

	public void setIsDeal(String isDeal) {
		this.isDeal = isDeal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	
}
