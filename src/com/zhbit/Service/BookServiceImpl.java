package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;


import com.zhbit.Dao.BookDao;
import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;

@Transactional
public class BookServiceImpl implements BookService {

	@Resource
	private BookDao bookDao;

	@Override
	public List<Book> findLastBook() {
		// TODO Auto-generated method stub
		return bookDao.findLastBook();
	}

	@Override
	public List<Book> findDiscountBook() {
		// TODO Auto-generated method stub
		return bookDao.findDiscountBook();
	}

	@Override
	public List<Book> findMinNumBook() {
		// TODO Auto-generated method stub
		return bookDao.findMinNumBook();
	}

	@Override
	public List<Book> findNumBookList() {
		// TODO Auto-generated method stub
		return bookDao.findNumBookList();
	}

	@SuppressWarnings("all")
	@Override
	public PageBean bookListPage(int currentPage,String type) {
		// TODO Auto-generated method stub
		PageBean bookBean = new PageBean();
		bookBean.setCurrentPage(currentPage);
		
		int totalCount = bookDao.getCount(type);
		bookBean.setTotalCount(totalCount);
		int pageSize = 15;
		bookBean.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 bookBean.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = bookDao.bookListPage(begin,pageSize,type);
		 bookBean.setList(list);
		return bookBean;
		
	}

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return bookDao.findOne(bookId);
	}
}
