package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.SellerBookService;

public class SellerBookAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private SellerBookService sellerBookService;
	
	
	
	private int currentPage;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private int bookId;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	
	/*
	 * 1、显示所有图书
	 */
	public String showBook(){
		PageBean bookList = (PageBean) sellerBookService.showBook(currentPage);	
		ServletActionContext.getRequest().setAttribute("bookList",bookList);
		return "showBook";		
	}
	
	/*
	 * 2、修改图书
	 */
	public String updatebook(){
		int bookId = this.bookId;
		Book book =  sellerBookService.findOne(bookId);
		ServletActionContext.getRequest().setAttribute("updatebook", book);
		return "updatebook";
	}
	@SuppressWarnings("all")
	public String updateBook(){
		int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));
		Book book =  sellerBookService.findOne(bookId);
		double bookPrice = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookPrice"));
		sellerBookService.updateBook(bookPrice,bookId);
		return "updateBook";
	}
	
	
	/*
	 * 3、删除图书
	 */
	public String deleteBook(){
		int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));
		List<Book> book = sellerBookService.deleteBook(bookId);
		ServletActionContext.getRequest().setAttribute("bookList", book);
		return "deleteBook";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
