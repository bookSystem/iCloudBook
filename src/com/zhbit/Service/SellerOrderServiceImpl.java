package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.SellerOrderDao;
import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.PageBean;


@Transactional
public class SellerOrderServiceImpl implements SellerOrderService {
	@Resource
	private SellerOrderDao sellerOrderDao;

	@Override
	public OrderItem findOrder(int orderId) {
		// TODO Auto-generated method stub
		return sellerOrderDao.findOrder(orderId);
	}

	@Override
	public void dealOrder(OrderItem order) {
		// TODO Auto-generated method stub
		sellerOrderDao.dealOrder(order);
	}

	@Override
	public PageBean getOrder(int currentPage,int sellerId) {
		PageBean orderBean = new PageBean();
		orderBean.setCurrentPage(currentPage);
		
		int totalCount = sellerOrderDao.getCount();
		orderBean.setTotalCount(totalCount);
		int pageSize = 8;
		orderBean.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 orderBean.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = sellerOrderDao.getOrder(begin,pageSize,sellerId);
		 orderBean.setList(list);
		return orderBean;
	}
}
