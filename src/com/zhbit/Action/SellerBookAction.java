/*package com.zhbit.Action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.SellerBookService;

public class SellerBookAction extends ActionSupport {
	*//**
	 * 
	 *//*
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
	
	
	 * 1、显示所有图书
	 
	public String showBook(){
		PageBean bookList = (PageBean) sellerBookService.showBook(currentPage);	
		ServletActionContext.getRequest().setAttribute("bookList",bookList);
		return "showBook";		
	}
	
	
	 * 2、修改图书
	 
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
	
	
	
	 * 3、删除图书
	 
	public String deleteBook(){
		int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));
		List<Book> book = sellerBookService.deleteBook(bookId);
		ServletActionContext.getRequest().setAttribute("bookList", book);
		return "deleteBook";
	}
	
	
	
	
	
	
	

	
	
}
*/

package com.zhbit.Action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Service.SellerBookService;
import com.zhbit.Service.UserService;
import com.zhbit.Domain.Seller;

public class SellerBookAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private SellerBookService sellerBookService;
	@Resource
	private UserService userService;

	private int sellerId;
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}


	private File image;
	private String imageFileName;
	
	private int bookId;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	
	
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String addBook(){
		if(image != null){
			 String  imagePath = ServletActionContext.getServletContext()
					.getRealPath("/book/images");
			File serverFile = new File(imagePath
					+ "/" + imageFileName);
			try {
				FileUtils.copyFile(image, serverFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		//Seller seller = (Seller) ServletActionContext.getRequest().getSession().getAttribute("seller");
		Book book = new Book();
		String img = "book/images/"+imageFileName;
		book.setBookNo(ServletActionContext.getRequest().getParameter("bookNo"));
		book.setBookName(ServletActionContext.getRequest().getParameter("bookName"));
		book.setAuthor(ServletActionContext.getRequest().getParameter("author"));
		double bookPrice = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookPrice"));
		book.setBookPrice(bookPrice);
		int bookNum = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookNum"));
		book.setBookNum(bookNum);
		book.setPublishName(ServletActionContext.getRequest().getParameter("publishName"));
		book.setImage(img);
		book.setType(ServletActionContext.getRequest().getParameter("type"));
		book.setDescripe(ServletActionContext.getRequest().getParameter("descripe"));
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		Seller seller = userService.findSeller(sellerId);
		book.setSeller(seller);
		sellerBookService.addBook(book);
		return "addBook";
	}
	

	private int currentPage;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	/*
	 * 1銆佹樉绀烘墍鏈夊浘涔�
	 */
	public String showBook(){
		int book_flag = 0;
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		System.out.println(sellerId);
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		PageBean bookList = (PageBean) sellerBookService.showBook(currentPage,sellerId);
		if(bookList != null){
			ServletActionContext.getRequest().setAttribute("bookList",bookList);
			book_flag=1;
			ServletActionContext.getRequest().setAttribute("book_flag",book_flag);
			
		}else{
			ServletActionContext.getRequest().setAttribute("bookList",bookList);
			ServletActionContext.getRequest().setAttribute("book_flag",book_flag);
		}
		return "showBook";	
	}
	
	/*
	 * 2銆佷慨鏀瑰浘涔
	 */

	public String updateBook(){
		int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));		
		Book book =  sellerBookService.findOne(bookId);
		book.setBookNo(ServletActionContext.getRequest().getParameter("bookNo"));
		book.setBookName(ServletActionContext.getRequest().getParameter("bookName"));
		book.setAuthor(ServletActionContext.getRequest().getParameter("author"));
		double bookPrice =  Double.parseDouble(ServletActionContext.getRequest().getParameter("bookPrice"));
		book.setBookPrice(bookPrice);
		int bookNum = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookNum"));
		book.setBookNum(bookNum);
		book.setPublishName(ServletActionContext.getRequest().getParameter("publishName"));
		book.setImage(book.getImage());
		book.setType(ServletActionContext.getRequest().getParameter("type"));
		book.setDescripe(ServletActionContext.getRequest().getParameter("descripe"));
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		Seller seller = userService.findSeller(sellerId);
		book.setSeller(seller);
		sellerBookService.updateBook(book,bookId);
		return "updateBook";
	}
	
	
	/*
	 * 3銆佸垹闄ゅ浘涔�
	 */
	public String deleteBook(){
		int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));
		Book book =  sellerBookService.findOne(bookId);
		sellerId = Integer.parseInt(ServletActionContext.getRequest().getParameter("sellerId"));
		ServletActionContext.getRequest().setAttribute("sId",sellerId);
		Seller seller = userService.findSeller(sellerId);
		book.setSeller(seller);
		sellerBookService.deleteBook(bookId);
		return "deleteBook";
	}
		
}
