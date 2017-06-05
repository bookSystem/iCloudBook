package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Book;

public interface BookDao {

	List<Book> findLastBook();

	List<Book> findDiscountBook();

	List<Book> findMinNumBook();

	List<Book> findNumBookList();

	int getCount(String type);

	List<Book> bookListPage(int begin, int pageSize,String type);

	Book findOne(int bookId);

}
