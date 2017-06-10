package com.zhbit.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Order;
import com.zhbit.Domain.OrderItem;
import com.zhbit.Domain.Seller;

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
	public OrderItem findOrder(int orderItemId) {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().get(OrderItem.class, orderItemId);
	}

	@Override
	public Order OrderOne(int orderId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Order.class, orderId);
	}
	
	@SuppressWarnings("all")
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
	public void updateOrder(OrderItem orderItem) {
		// TODO Auto-generated method stub
		orderItem.setIsDeal("1");
		this.getHibernateTemplate().update(orderItem);
	}

	@Override
	public void deleteOrder(Order order) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(order);
	}

	

	

}
