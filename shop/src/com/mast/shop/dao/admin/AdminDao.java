package com.mast.shop.dao.admin;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.Admin;

/**
 * 管理员数据库访问层
 * 
 * @author Administrator
 * @version 1.0
 */
public interface AdminDao {
	//登录方法
	Admin login(@Param("adminName") String adminName);
}
