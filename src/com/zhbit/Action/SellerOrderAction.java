package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Order;
import com.zhbit.Service.SellerOrderService;

public class SellerOrderAction extends ActionSupport {
	
	
	private int orderId;
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private SellerOrderService sellerOrderService;
	
	@SuppressWarnings("rawtypes")
	/*
	 * 卖家订单查询
	 */
	public String getOrder(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List list = sellerOrderService.getOrder();
		request.setAttribute("list", list);
		return "getOrder";
	}
	
	/*
	 * 2、修改订单
	 */
	
	public String dealOrder(){
		int orderId = this.orderId;
		Order order = sellerOrderService.findOrder(orderId);
		//HttpServletRequest request = ServletActionContext.getRequest();
		sellerOrderService.dealOrder(order);
		return "dealOrder";
	}
	
	

	
}
