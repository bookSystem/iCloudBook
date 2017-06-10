package com.zhbit.Service;

import com.zhbit.Domain.PageBean;

public interface AdminService {

	PageBean showUser(int currentPage);

	PageBean deleteUser(int userId);

	PageBean showSeller(int currentPage);

	PageBean deleteSeller(int sellerId);

}
