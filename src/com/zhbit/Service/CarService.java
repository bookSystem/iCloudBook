package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Book;


public interface CarService {

	void CarAdd(int sellerId, int bookId, int number);

	void setPrice();

	void CarDelete(int bookId);

	Book findOne(int bookId);

	void UpdateNum(int number,int bookId);

	void jiesuan(int[] carItem);

	void checkPrice();

	List<Book> CarList();

}
