package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Book;

public interface SellerBookDao {

	Book findOne(int bookId);

	int getCount();

	@SuppressWarnings("rawtypes")
	List showBook(int begin, int pageSize);

	void updateBook(double bookPrice, int bookId);

	List<Book> deleteBook(int bookId);

}
