package com.zhbit.Domain;

import java.util.HashSet;
import java.util.Set;

public class OrderItem {
	private int orderItemId;
	private int quantity;
	private String isDeal;// 订单状态
	private Book book;
	private Order order;
	private Seller seller;
	
	public String getIsDeal() {
		return isDeal;
	}

	public void setIsDeal(String isDeal) {
		this.isDeal = isDeal;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
