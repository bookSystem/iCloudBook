package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.PageBean;

public interface SellerOrderService {

	@SuppressWarnings("all")

	OrderItem findOrder(int orderId);

	void dealOrder(OrderItem orderItem);

	PageBean getOrder(int currentPage,int sellerId);

}
