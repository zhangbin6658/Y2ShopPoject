package com.mast.shop.service.admin;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.Admin;

/**
 * 管理员业务逻辑层接口
 * 
 * @author Administrator
 * @version 1.0
 */

public interface AdminService {
	//登录方法
	Admin login(@Param("adminName") String adminName);
}
