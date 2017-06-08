/*package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Book;

public class SellerBookDaoImpl extends HibernateDaoSupport implements SellerBookDao {
	@Resource
	private SessionFactory session;

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Book.class, bookId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		List<Book> list = this.getHibernateTemplate().find("select count(*) from Book");
		if(list != null && list.size() != 0){
			Object object =	 list.get(0);
			Long log = (Long) object;
			return log.intValue();
		}
		return 0;
	}

	@SuppressWarnings("all")
	@Override
	public List showBook(int begin, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		List list = this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@SuppressWarnings("all")
	@Override
	public void updateBook(double bookPrice, int bookId) {
		// TODO Auto-generated method stub
		List<Book> list = null;
		String hql = "update Book set bookPrice=? where bookId=?";
		Query q = session.getCurrentSession().createQuery(hql);
		q.setDouble(0, bookPrice);
		q.setInteger(1, bookId);
		q.executeUpdate();
		Query query = session.getCurrentSession().createQuery("from Book");
		query.list();
		
	}

	@SuppressWarnings("all")
	@Override
	public List<Book> deleteBook(int bookId) {
		// TODO Auto-generated method stub
		List<Book> list = null;
		String hql = "delete from Book where bookId=?";
		Query q = session.getCurrentSession().createQuery(hql);
		q.setInteger(0, bookId);
		q.executeUpdate();
		Query query = session.getCurrentSession().createQuery("from Book");
		return query.list();
	}

}
*/


package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Book;

public class SellerBookDaoImpl extends HibernateDaoSupport implements SellerBookDao {
	@Resource
	private SessionFactory session;

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Book.class, bookId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		List<Book> list = this.getHibernateTemplate().find("select count(*) from Book");
		if(list != null && list.size() != 0){
			Object object =	 list.get(0);
			Long log = (Long) object;
			return log.intValue();
		}
		return 0;
	}

	@SuppressWarnings("all")
	@Override
	public List showBook(int begin, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		List list = this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@SuppressWarnings("all")
	@Override
	public void updateBook(Book book, int bookId) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		hibernateTemplate.save(book);
	}

	@SuppressWarnings("all")
	@Override
	public void deleteBook(int bookId) {
		// TODO Auto-generated method stub
		String hql = "delete from Book where bookId=?";
		Query q = session.getCurrentSession().createQuery(hql);
		q.setInteger(0, bookId);
		q.executeUpdate();
	}

	@Override
	public void addBook(Book book) {
		HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
		hibernateTemplate.save(book);
	}

}
