package com.zhbit.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.*;


@SuppressWarnings("all")
public class SellerOrderDaoImpl extends HibernateDaoSupport implements SellerOrderDao {

	@Resource
	private SessionFactory session;
	
	@Override
	public OrderItem findOrder(int orderId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(OrderItem.class, orderId);
	}

	@Override
	public void dealOrder(OrderItem order) {
		// TODO Auto-generated method stub
		//String hql = "update Order set isDeal = '1'";
		order.setIsDeal("1");
	    
		this.getHibernateTemplate().update(order);
	}

	@Override
	public List getOrder(int begin,int pageSize,int sellerId) {
		HibernateTemplate ht=this.getHibernateTemplate();
		Criteria criteria = session.getCurrentSession().createCriteria(OrderItem.class);
		criteria.add(Restrictions.eq("seller.sellerId", sellerId));
		List<OrderItem> list = criteria.list();
			return list;	
	}

	@Override
	public int getCount() {
			List<OrderItem> list = this.getHibernateTemplate().find("select count(*) from OrderItem");
			if(list != null && list.size() != 0){
				Object object =	 list.get(0);
				Long log = (Long) object;
				return log.intValue();
			}
			return 0;
		}

}
