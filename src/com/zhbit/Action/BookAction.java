package com.zhbit.Action;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.BookService;


@SuppressWarnings("all")
public class BookAction extends ActionSupport {

	@Resource
	private BookService bookService;
	
	/*
	 * 首页展示
	 */
	public String findLastBook(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		request.setAttribute("T_flag", "123");
		
		/*
		 * 1、最新推出
		 */
		
		List<Book> list = bookService.findLastBook();
		
		request.setAttribute("bookList", list);
		/*
		 * 2、今日特价
		 */
		List<Book> discountBook = bookService.findDiscountBook();
		request.setAttribute("discountBook", discountBook);
		
		/*
		 * 3、人气推出1
		 */
		List<Book> minNumBook = bookService.findMinNumBook();
		request.setAttribute("minNumBook", minNumBook);
		
		/*
		 * 4、人气推出2
		 */
		List<Book> NumBookList = bookService.findNumBookList();
		request.setAttribute("NumBookList", NumBookList);
		
		return "findLastBook";
	}
	
	private int currentPage=1;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	private String type;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String bookListPage(){
		
		PageBean bookBean = bookService.bookListPage(currentPage,type);
		
		ServletActionContext.getRequest().setAttribute("bookBean", bookBean);
		
		if(type.equals("literature")){
			return "literatureBookListPage";
		}
		if(type.equals("inspiration")){
			return "inspirationBookListPage";
		}
		if(type.equals("education")){
			return "educationBookListPage";
		}
		if(type.equals("technology")){
			return "technologyBookListPage";
		}
		
		return "findLastBook";
	}
	
	/*
	 * 每本书的详细列表
	 */
	private int bookId;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String BookItem(){
		
		int bookId = this.bookId;
		Book book =  bookService.findOne(bookId);
		ServletActionContext.getRequest().setAttribute("book", book);	
		return "BookItem";
	}
	
	
	
}
