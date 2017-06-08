package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Order;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.SellerOrderService;

public class SellerOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	@Resource
	private SellerOrderService sellerOrderService;
	
	
	private int orderId;
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	private int currentPage;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	@SuppressWarnings("rawtypes")
	/*
	 * 鍗栧璁㈠崟鏌ヨ
	 */
	public String getOrder(){
		PageBean orderList = (PageBean) sellerOrderService.getOrder(currentPage);	
		ServletActionContext.getRequest().setAttribute("orderList",orderList);		
		return "getOrder";
	}
	
	/*
	 * 2銆佷慨鏀硅鍗�
	 */
	
	public String dealOrder(){
		int orderId = Integer.parseInt(ServletActionContext.getRequest().getParameter("orderId"));
		Order order = sellerOrderService.findOrder(orderId);
		sellerOrderService.dealOrder(order);
		return "dealOrder";
	}
	
	
}
