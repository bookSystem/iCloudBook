package com.zhbit.Dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Book;

public class CarDaoImpl extends HibernateDaoSupport implements CarDao {

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Book.class, bookId);
	}

}
