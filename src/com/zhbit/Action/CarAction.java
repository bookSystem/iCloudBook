package com.zhbit.Action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Service.CarService;


public class CarAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private CarService carService;
	
	/*
	 * 1、添加购物车
	 */
	
	private int bookId;


	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	
	public String CarAdd() {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		int number = Integer.parseInt(request.getParameter("number"));
		int bookId = this.bookId;
		carService.CarAdd(bookId,number);
		carService.setPrice();
		
		return "CarAdd";
	}
	
	/*
	 * 2刪除购物车
	 */
	public String CarDelete(){
		int bookId = this.bookId;
		carService.CarDelete(bookId);
		carService.setPrice();
		
		return "CarDelete";
		
	}
	/*
	 * 3、查询购物车
	 */
	
	public String CarList(){
		
		return "CarList";
	}
	
	
	 /*
	  * 4、结算
	  */
	 
	
	public String CarPay(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int number = Integer.parseInt(request.getParameter("number"));
		ServletActionContext.getRequest().getSession().setAttribute("num", number);
		int bookId = this.bookId;
		Book book = carService.findOne(bookId);
		ServletActionContext.getRequest().getSession().setAttribute("paybook", book);
		return "CarPay";
	}
	
	
	private String flag;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	private int number;
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	
}
