package com.zhbit.Action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.AdminService;

public class AdminAction extends ActionSupport{
	/**
	 * 测试文字最后版本
	 */
	//
	private static final long serialVersionUID = 1L;

	@Resource
	private AdminService adminService;

	private int currentPage;
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private int userId;
	private int sellerId;
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String showUser(){
		PageBean showUser = adminService.showUser(currentPage);
		ServletActionContext.getRequest().setAttribute("showUser", showUser);
		return "showUser";
	}
	
	public String deleteUser(){
		System.out.println(ServletActionContext.getRequest().getParameter("userId"));
		int userId = Integer.parseInt(ServletActionContext.getRequest().getParameter("userId"));
		PageBean deleteUser = adminService.deleteUser(userId);
		ServletActionContext.getRequest().setAttribute("showUser", deleteUser);
		return "deleteUser";
	}
	
	public String showSeller(){
		PageBean showSeller = adminService.showSeller(currentPage);
		ServletActionContext.getRequest().setAttribute("showSeller", showSeller);
		return "showSeller";
	}
	
	public String deleteSeller(){
		System.out.println(ServletActionContext.getRequest().getParameter("sellerId"));
		int sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		PageBean deleteSeller = adminService.deleteSeller(sellerId);
		ServletActionContext.getRequest().setAttribute("showSeller", deleteSeller);
		return "deleteSeller";
	}
}
