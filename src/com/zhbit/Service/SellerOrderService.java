package com.zhbit.Service;

import java.util.List;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.PageBean;

public interface SellerOrderService {

	@SuppressWarnings("all")

	Order findOrder(int orderId);

	void dealOrder(Order order);

	PageBean getOrder(int currentPage);

}
