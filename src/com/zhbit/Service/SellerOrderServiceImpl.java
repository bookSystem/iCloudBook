package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.SellerOrderDao;
import com.zhbit.Domain.Order;


@Transactional
public class SellerOrderServiceImpl implements SellerOrderService {
	@Resource
	private SellerOrderDao sellerOrderDao;

	@SuppressWarnings("all")
	public List getOrder(){
		return sellerOrderDao.getOrder();
	}

	@Override
	public Order findOrder(int orderId) {
		// TODO Auto-generated method stub
		return sellerOrderDao.findOrder(orderId);
	}

	@Override
	public void dealOrder(Order order) {
		// TODO Auto-generated method stub
		sellerOrderDao.dealOrder(order);
	}
}
