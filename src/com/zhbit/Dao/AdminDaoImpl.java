package com.zhbit.Dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.Domain.User;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {
	@Resource
	private SessionFactory session;
	
	@SuppressWarnings("all")
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		List<User> list = this.getHibernateTemplate().find("select count(*) from User");
		if(list != null && list.size() != 0){
			Object object =	 list.get(0);
			Long log = (Long) object;
			return log.intValue();
		}
		return 0;
	}

	@SuppressWarnings("all")
	@Override
	public List showUser(int begin, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		List list = this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@SuppressWarnings("all")
	@Override
	public List deleteUser(int userId) {
		// TODO Auto-generated method stub
		List<User> list = null;
		String hql = "delete from User where id=?";
		Query q = session.getCurrentSession().createQuery(hql);
		q.setInteger(0, userId);
		q.executeUpdate();
		Query query = session.getCurrentSession().createQuery("from User");
		list = query.list();
		return list;
	}

}
