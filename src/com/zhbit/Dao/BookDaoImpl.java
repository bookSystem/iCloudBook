package com.zhbit.Dao;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.Book;

public class BookDaoImpl extends HibernateDaoSupport implements BookDao {

	@SuppressWarnings("all")
	@Override
	public List<Book> findLastBook() {
		// TODO Auto-generated method stub
		
		List<Book> list = this.getHibernateTemplate().find("from Book order by bookId desc");
		//List<Book> list2 = list.subList(0, 4);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findDiscountBook() {
		// TODO Auto-generated method stub
		
		List<Book> list = this.getHibernateTemplate().find("from Book order by bookPrice asc");
		//List<Book> list2 = list.subList(0, 4);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findMinNumBook() {
		// TODO Auto-generated method stub

		List<Book> list = this.getHibernateTemplate().find("from Book order by bookNum asc ");
		//List<Book> list2 = list.subList(0, 1);
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findNumBookList() {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().find("from Book order by bookNum asc");
		 
	}

	@SuppressWarnings("all")
	@Override
	public int getCount(String type) {
		// TODO Auto-generated method stub
		
		List<Book> list1 = this.getHibernateTemplate().find("select count(*) from Book where type=?",type);
		if(list1 != null && list1.size() != 0){
			Object object =	 list1.get(0);
			Long log1 = (Long) object;
			return log1.intValue();
		}
		
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> bookListPage(int begin, int pageSize,String type) {
		// TODO Auto-generated method stub
		
		
		String sql = "from Book where type=?";
		Session session = this.getSessionFactory().getCurrentSession();
		
		Query query = session.createQuery(sql);
		query.setParameter(0, type);
		query.setFirstResult(begin);
		query.setMaxResults(pageSize);
		return query.list();
	
	}

	@Override
	public Book findOne(int bookId) {
		// TODO Auto-generated method stub
		
		return this.getHibernateTemplate().get(Book.class, bookId);
	}

}
