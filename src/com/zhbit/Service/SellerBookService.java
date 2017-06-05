package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;

public interface SellerBookService {

	Book findOne(int bookId);

	PageBean showBook(int currentPage);

	void updateBook(double bookPrice, int bookId);

	List<Book> deleteBook(int bookId);

}
