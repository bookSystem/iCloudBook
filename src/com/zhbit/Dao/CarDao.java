package com.zhbit.Dao;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.Seller;

public interface CarDao {

	Book findOne(int bookId);

	Seller findSeller(int sellerId);

}
