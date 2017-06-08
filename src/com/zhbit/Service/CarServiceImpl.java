package com.zhbit.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.CarDao;
import com.zhbit.Domain.Book;

@Transactional
public class CarServiceImpl implements CarService {
	@Resource
	private CarDao carDao;

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	/*
	 * 添加购物车(non-Javadoc)
	 * @see com.zhbit.Service.CarServiceImpl#CarAdd(int, int)
	 */
	public void CarAdd(int bookId, int number) {
		// TODO Auto-generated method stub
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<Book> shoppingBook = new ArrayList<Book>();
		if(session.getAttribute("shoppingBook")==null){
			session.setAttribute("shoppingBook", shoppingBook);
		}else {
			shoppingBook = (List<Book>) session.getAttribute("shoppingBook");
		}
		
		int i = 0;
		
		for(Book book:shoppingBook){
			if(bookId==book.getBookId()){
				i++;
				book.setBookNum(book.getBookNum()+number);	
			}
		}
		if(i==0){
			Book book = carDao.findOne(bookId);
			Book book2 = new Book();
			book2.setBookId(bookId);
			book2.setBookNo(book.getBookNo());
			book2.setBookName(book.getBookName());
			book2.setAuthor(book.getAuthor());
			book2.setBookPrice(book.getBookPrice());
			book2.setImage(book.getImage());
			book2.setPublishName(book.getPublishName());
			book2.setType(book.getType());
			book2.setDescripe(book.getDescripe());
			book2.setBookNum(number);
			shoppingBook.add(book2);
			session.setAttribute("shoppingBook", shoppingBook);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void setPrice() {
		// TODO Auto-generated method stub
	
		double price = 0;
		List<Book> shoppingBook = (List<Book>)ServletActionContext.getRequest().getSession().getAttribute("shoppingBook");
		if(shoppingBook != null){
			
			for(int i=0;i<shoppingBook.size();i++)
			{
				price += shoppingBook.get(i).getBookPrice() * shoppingBook.get(i).getBookNum();
			}
			
		}
		ServletActionContext.getRequest().getSession().setAttribute("totalMoney", price);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public void CarDelete(int bookId) {
		// TODO Auto-generated method stub
		
		List<Book> shoppingBook = new ArrayList<Book>();
		HttpSession session = ServletActionContext.getRequest().getSession();
		shoppingBook = (List<Book>)session.getAttribute("shoppingBook");
	
		
		for(int i=0;i<shoppingBook.size();i++){
			if(shoppingBook.get(i).getBookId() == bookId)
			{
				shoppingBook.remove(shoppingBook.get(i));
				break;
			}
		}
		
		if(shoppingBook.size()>0){
			session.setAttribute("shoppingBook", shoppingBook);
		}else {
			session.setAttribute("shoppingBook", null);
		}
		
	}

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return carDao.findOne(bookId);
	}

	@Override
	public void UpdateNum(int number,int bookId) {
		// TODO Auto-generated method stub
		List<Book> shoppingBook = (List<Book>) ServletActionContext.getRequest().getSession().getAttribute("shoppingBook");
		
		for (Book book : shoppingBook) {
			if(book.getBookId()==bookId){
				book.setBookNum(number);
			}
		}
		
		ServletActionContext.getRequest().getSession().setAttribute("shoppingBook", shoppingBook);
		
		
		
	}

	@SuppressWarnings("all")
	@Override
	public void jiesuan(int[] carItem) {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<Book> shoppingBook = (List<Book>) session.getAttribute("shoppingBook");
		
		List<Book> checkBook = new ArrayList<Book>();
		int k=0;
		for (int i : carItem) {
			System.out.println("传值i:"+i);
			for (Book book : shoppingBook) {
				System.out.println("书的Id:"+book.getBookId());
				if(i==book.getBookId()){
					checkBook.add(book);
					session.setAttribute("checkBook", checkBook);
				}
			}
		}		
			
	}		
	
	
	public void checkPrice() {
		// TODO Auto-generated method stub
	
		double price = 0;
		List<Book> checkBook = (List<Book>)ServletActionContext.getRequest().getSession().getAttribute("checkBook");
		if(checkBook != null){
			
			for(int i=0;i<checkBook.size();i++)
			{
				price += checkBook.get(i).getBookPrice() * checkBook.get(i).getBookNum();
			}
			
		}
		ServletActionContext.getRequest().getSession().setAttribute("checkMoney", price);
		
	}
	
	
			





	
	
	
	
	
	
}
