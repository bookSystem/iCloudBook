package com.zhbit.Dao;

import java.util.List;

import com.zhbit.Domain.Seller;

public interface SellerDao {

	void updateSeller(Seller seller, int sellerId);

	List<Seller> showSeller(int sellerId);

}
