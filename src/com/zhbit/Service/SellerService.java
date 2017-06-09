package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Seller;

public interface SellerService {

	void updateSeller(Seller seller, int sellerId);

	List<Seller> showSeller(int sellerId);
	

}
