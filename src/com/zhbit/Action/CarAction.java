package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;

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
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		int number = Integer.parseInt(request.getParameter("number"));
		int bookId = this.bookId;
		carService.CarAdd(sellerId,bookId,number);
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
		List<Book> books = carService.CarList();
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
	
	/*
	 * 增加购买数量
	 */
	
	public String UpdateNum(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int number = Integer.parseInt(request.getParameter("num"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		if(number==0){
			number=1;
		}
		System.out.println("number:"+number+"bookId:"+bookId);
		carService.UpdateNum(number,bookId);
		
		return "UpdateNum";
	}
	
	@SuppressWarnings("all")
	public String jiesuan(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String cartItemIds = request.getParameter("cartItemIds");
		//int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		String[] cartItemIdArray = cartItemIds.split(",");
		int[] carItem = new int[cartItemIdArray.length];
		for (int i = 0; i < carItem.length; i++) {
			carItem[i] = Integer.parseInt(cartItemIdArray[i]);
			System.out.println(carItem[i]);
		}
		carService.jiesuan(carItem);
		carService.checkPrice();
		return "jiesuan";
		
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
