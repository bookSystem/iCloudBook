package com.zhbit.Domain;

import java.util.HashSet;
import java.util.Set;

public class OrderItem {
	private int orderItemId;
	private int quantity;
	private Book book;
	private Order order;
	private Seller seller;
	/*private Set<Seller> setSeller = new HashSet<Seller>();
	
	public Set<Seller> getSetSeller() {
		return setSeller;
	}

	public void setSetSeller(Set<Seller> setSeller) {
		this.setSeller = setSeller;
	}*/

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
