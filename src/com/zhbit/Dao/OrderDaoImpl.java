package com.zhbit.Dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	@SuppressWarnings("unchecked")
	@Override
	public int orderAdd(Order order) {
		// TODO Auto-generated method stub
		int i = 0;
		this.getHibernateTemplate().save(order);
		
		String hql = "select max(orderId) from Order";
		List<Integer> idList =this.getHibernateTemplate().find(hql);
		
		if(idList.size()>0&&idList!=null){
			i = idList.get(0);
		}
		return i;
		
	}

	@Override
	public Order findOrder(int orderId) {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().get(Order.class, orderId);
	}

	@Override
	public void orderItemAdd(OrderItem orderItem) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(orderItem);
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> myOrderList(int userId) {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().find("from Order where user.userId=?", userId);
	}

	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		order.setIsDeal("2");
		this.getHibernateTemplate().update(order);
	}


}
