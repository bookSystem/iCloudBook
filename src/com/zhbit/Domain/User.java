package com.zhbit.Domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	private int userId;
	private String name;
	private String password;
	/*private String repassword;*/
	private String email;
	private String telnum;
	private String address;
    private String person;
    private Set<Order> setOrder = new HashSet<Order>();
    
	public Set<Order> getSetOrder() {
		return setOrder;
	}
	public void setSetOrder(Set<Order> setOrder) {
		this.setOrder = setOrder;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/*public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}*/
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
}
