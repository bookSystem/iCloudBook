package com.zhbit.Domain;

import java.util.HashSet;
import java.util.Set;

public class Book {
	private int bookId;
	private String bookName;
	private String author;
	private double bookPrice;
	private int bookNum;
	private String publishName;
	private String image;
	private String bookNo;//书本编号
	private String type;
	private String descripe;
	private Seller seller;
	private Set<OrderItem> setOrderItem = new HashSet<OrderItem>();
	public Set<OrderItem> getSetOrderItem() {
		return setOrderItem;
	}
	public void setSetOrderItem(Set<OrderItem> setOrderItem) {
		this.setOrderItem = setOrderItem;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(double bookPrice) {
		this.bookPrice = bookPrice;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public String getPublishName() {
		return publishName;
	}
	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	/*public String getChild_type() {
		return child_type;
	}
	public void setChild_type(String child_type) {
		this.child_type = child_type;
	}*/
	public String getDescripe() {
		return descripe;
	}
	public void setDescripe(String descripe) {
		this.descripe = descripe;
	}
	
}
