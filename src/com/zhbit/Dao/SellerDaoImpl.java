package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Domain.Seller;

public class SellerDaoImpl extends HibernateDaoSupport implements SellerDao {
	@Resource
	private SessionFactory sessionFactory;
	

	@SuppressWarnings("all")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW )
	public void updateSeller(Seller seller, int sellerId) {
		this.getHibernateTemplate().save(seller);
	}


	@Override
	public List<Seller> showSeller(int sellerId) {
		HttpServletRequest request = ServletActionContext.getRequest();
		Query query = sessionFactory.getCurrentSession().createQuery("from Seller where sellerId=?");
		query.setInteger(0,sellerId);
		List<Seller> list = query.list();
		return list;
	}


}
