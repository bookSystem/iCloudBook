package com.zhbit.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zhbit.Dao.AdminDao;
import com.zhbit.Domain.PageBean;

@Transactional
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDao adminDao;

	@SuppressWarnings("all")
	@Override
	public PageBean showUser(int currentPage) {
		// TODO Auto-generated method stub
		PageBean showUser = new PageBean();
		showUser.setCurrentPage(currentPage);
		
		int totalCount = adminDao.getCount();
		showUser.setTotalCount(totalCount);
		int pageSize = 8;
		showUser.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 showUser.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = adminDao.showUser(begin,pageSize);
		 showUser.setList(list);
		return showUser;
	}

	@SuppressWarnings("all")
	@Override
	public PageBean deleteUser(int userId) {
		// TODO Auto-generated method stub
		PageBean deleteUser = new PageBean();
		 List list = adminDao.deleteUser(userId);
		 deleteUser.setList(list);
		return deleteUser;
	}

	@Override
	public PageBean showSeller(int currentPage) {
		PageBean showSeller = new PageBean();
		showSeller.setCurrentPage(currentPage);
		
		int totalCount = adminDao.getCount();
		showSeller.setTotalCount(totalCount);
		int pageSize = 8;
		showSeller.setPageSize(pageSize);
		 int totalPage =0;
		 if(totalCount%pageSize==0){
				totalPage=totalCount/pageSize;
			}else {
				totalPage=totalCount/pageSize+1;
			}
		 showSeller.setTotalPage(totalPage);
		 int begin = (currentPage-1)*pageSize;
		 List list = adminDao.showSeller(begin,pageSize);
		 showSeller.setList(list);
		return showSeller;
	}

	@Override
	public PageBean deleteSeller(int sellerId) {
		PageBean deleteSeller = new PageBean();
		 List list = adminDao.deleteSeller(sellerId);
		 deleteSeller.setList(list);
		return deleteSeller;
	}
}
