package com.zhbit.Service;

import com.zhbit.Domain.Book;


public interface CarService {

	void CarAdd(int bookId, int number);

	void setPrice();

	void CarDelete(int bookId);

	Book findOne(int bookId);

	void UpdateNum(int number,int bookId);

	void jiesuan(int[] carItem);

	void checkPrice();

}
