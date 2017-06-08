package com.zhbit.Service;

import com.zhbit.Domain.PageBean;

public interface AdminService {

	PageBean showUser(int currentPage);

	PageBean deleteBook(int userId);

}
