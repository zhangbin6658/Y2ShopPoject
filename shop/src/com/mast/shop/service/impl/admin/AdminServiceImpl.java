package com.mast.shop.service.impl.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.admin.Admin;
import com.mast.shop.dao.admin.AdminDao;
import com.mast.shop.service.admin.AdminService;

/**
 * 管理员业务逻辑层
 * 
 * @author Administrator
 * @version 1.0 
 */
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public Admin login(String adminName) {
		return adminDao.login(adminName);
	}
}
