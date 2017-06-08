/*package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;

public interface SellerBookService {

	Book findOne(int bookId);

	PageBean showBook(int currentPage);

	void updateBook(double bookPrice, int bookId);

	List<Book> deleteBook(int bookId);

}
*/


package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.PageBean;
import com.zhbit.Domain.Seller;

public interface SellerBookService {

	Book findOne(int bookId);

	PageBean showBook(int currentPage);

	void updateBook(Book book, int bookId);

	void deleteBook(int bookId);

	void addBook(Book book);

}

