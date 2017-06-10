package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.PageBean;
import com.zhbit.Domain.Seller;
import com.zhbit.Service.SellerOrderService;
import com.zhbit.Service.UserService;

public class SellerOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	@Resource
	private SellerOrderService sellerOrderService;
	@Resource
	private UserService userService;
	
	private int sellerId;
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	
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
		int order_flag = 0;
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		PageBean orderList = (PageBean) sellerOrderService.getOrder(currentPage,sellerId);
		if(orderList != null){
			ServletActionContext.getRequest().setAttribute("orderList",orderList);
			order_flag=1;
			ServletActionContext.getRequest().setAttribute("order_flag",order_flag);
		}else{
			ServletActionContext.getRequest().setAttribute("orderList",orderList);
			ServletActionContext.getRequest().setAttribute("order_flag",order_flag);
		}	
		return "getOrder";
	}
	
	/*
	 * 2銆佷慨鏀硅鍗�
	 */
	
	public String dealOrder(){
		int orderId = Integer.parseInt(ServletActionContext.getRequest().getParameter("orderId"));
		Order order =  sellerOrderService.findOrder(orderId);
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		Seller seller = userService.findSeller(sellerId);
		order.setSeller(seller);
		sellerOrderService.dealOrder(order);
		return "dealOrder";
	}
	
	
}
