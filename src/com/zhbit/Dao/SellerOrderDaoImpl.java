package com.zhbit.Dao;

import java.util.List;

import javax.management.Query;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Order;

@SuppressWarnings("all")
public class SellerOrderDaoImpl extends HibernateDaoSupport implements SellerOrderDao {

	
	@Override
	public List getOrder() {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().find("from Order");
	}

	@Override
	public Order findOrder(int orderId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Order.class, orderId);
	}

	@Override
	public void dealOrder(Order order) {
		// TODO Auto-generated method stub
		//String hql = "update Order set isDeal = '1'";
		order.setIsDeal("1");
	    
		this.getHibernateTemplate().update(order);
	}

}
