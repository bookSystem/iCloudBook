package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;

public interface BookService {

	List<Book> findLastBook();

	List<Book> findDiscountBook();

	List<Book> findMinNumBook();

	List<Book> findNumBookList();

	PageBean bookListPage(int currentPage,String type);

	Book findOne(int bookId);

}
