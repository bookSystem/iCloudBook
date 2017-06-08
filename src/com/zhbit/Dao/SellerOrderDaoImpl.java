package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Book;
import com.zhbit.Domain.Order;

@SuppressWarnings("all")
public class SellerOrderDaoImpl extends HibernateDaoSupport implements SellerOrderDao {

	@Resource
	private SessionFactory session;
	
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

	@Override
	public List getOrder(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		List list = this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public int getCount() {
			List<Order> list = this.getHibernateTemplate().find("select count(*) from Order");
			if(list != null && list.size() != 0){
				Object object =	 list.get(0);
				Long log = (Long) object;
				return log.intValue();
			}
			return 0;
		}

}
