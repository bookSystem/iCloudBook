package com.zhbit.Action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.AdminService;

public class AdminAction extends ActionSupport{
	/**
	 * 
	 */
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
		PageBean deleteUser = adminService.deleteBook(userId);
		ServletActionContext.getRequest().setAttribute("showUser", deleteUser);
		return "deleteUser";
	}
}
