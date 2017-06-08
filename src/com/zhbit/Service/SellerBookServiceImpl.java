/*package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.SellerBookDao;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;

@Transactional
public class SellerBookServiceImpl implements SellerBookService {
	@Resource
	private SellerBookDao sellerBookDao;

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return sellerBookDao.findOne(bookId);
	}

	@SuppressWarnings("all")
	@Override
	public PageBean showBook(int currentPage) {
		// TODO Auto-generated method stub
		PageBean bookBean = new PageBean();
		bookBean.setCurrentPage(currentPage);
		
		int totalCount = sellerBookDao.getCount();
		bookBean.setTotalCount(totalCount);
		int pageSize = 8;
		bookBean.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 bookBean.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = sellerBookDao.showBook(begin,pageSize);
		 bookBean.setList(list);
		return bookBean;
	}

	@Override
	public void updateBook(double bookPrice, int bookId) {
		// TODO Auto-generated method stub
		sellerBookDao.updateBook(bookPrice,bookId);
	}

	@Override
	public List<Book> deleteBook(int bookId) {
		// TODO Auto-generated method stub
		return sellerBookDao.deleteBook(bookId);
	}
}
*/




package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.SellerBookDao;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Domain.Seller;

@Transactional
public class SellerBookServiceImpl implements SellerBookService {
	@Resource
	private SellerBookDao sellerBookDao;

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return sellerBookDao.findOne(bookId);
	}

	@SuppressWarnings("all")
	@Override
	public PageBean showBook(int currentPage) {
		// TODO Auto-generated method stub
		PageBean bookBean = new PageBean();
		bookBean.setCurrentPage(currentPage);
		
		int totalCount = sellerBookDao.getCount();
		bookBean.setTotalCount(totalCount);
		int pageSize = 8;
		bookBean.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 bookBean.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = sellerBookDao.showBook(begin,pageSize);
		 bookBean.setList(list);
		return bookBean;
	}

	@Override
	public void updateBook(Book book, int bookId) {
		sellerBookDao.updateBook(book,bookId);
	}

	@Override
	public void deleteBook(int bookId) {
		// TODO Auto-generated method stub
		sellerBookDao.deleteBook(bookId);
	}

	

	@Override
	public void addBook(Book book) {
		sellerBookDao.addBook(book);	
	}


}
