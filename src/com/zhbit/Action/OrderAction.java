package com.zhbit.Action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.User;
import com.zhbit.Service.OrderService;


public class OrderAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private OrderService orderService;
	
	/*
	 * 1、生成订单
	 */
	private String address;
	private String user_address;
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String orderAdd() {
		String addr = null;
		if(!address.equals("")){
			addr = address;
		}
		else {
			addr = user_address;
		}
		orderService.orderAdd(addr);
		return "orderAdd";
	}
	
	/*
	 * 1.1直接生成订单
	 */
	public String addPay() {
		String addr = null;
		if(!address.equals("")){
			addr = address;
		}
		else {
			addr = user_address;
		}
		orderService.addPay(addr);
		return "orderAdd";
	}
	
	
	
	
	/*
	 * 2、查询我的订单
	 */
	
	@SuppressWarnings("all")
	public String myOrderList() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		 Set<OrderItem> setOrderItems = new HashSet<OrderItem>();
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		List<Order> list = orderService.myOrderList(userId);
		ServletActionContext.getRequest().setAttribute("myOrderList", list);
		
		return "myOrderList";
	}
	
	/*
	 * 3、确认订单
	 */
	
	private int orderId;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String firmOrder(){
		int orderId = this.orderId;
		Order order = orderService.oneOrder(orderId);
		orderService.updateOrder(order);
		
		return "firmOrder";
	}
	
	
}
