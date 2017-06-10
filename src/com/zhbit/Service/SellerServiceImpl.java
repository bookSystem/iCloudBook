package com.zhbit.Service;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

/*import org.jboss.weld.security.spi.SecurityServices;*/

import com.zhbit.Dao.SellerDao;
import com.zhbit.Domain.Seller;

public class SellerServiceImpl implements SellerService {
	@Resource
	private SellerDao sellerDao;


	@Override
	public void updateSeller(Seller seller, int sellerId) {
		sellerDao.updateSeller(seller,sellerId);
		
	}


	@Override
	public List<Seller> showSeller(int sellerId) {
		return sellerDao.showSeller(sellerId);
	}


}
