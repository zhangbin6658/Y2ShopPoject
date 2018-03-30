package com.mast.shop.bean.admin;

import java.util.Date;

/**
 * 管理员实体
 * 
 * @author Administrator
 * @version 1.0
 */
public class Admin {
	public Admin() {
	}
	//管理员账号
	private Integer adminId;
	//管理员姓名
	private String adminName;
	//管理员密码
	private String adminPassword;
	//管理员创建时间
	private Date adminDate;
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public Date getAdminDate() {
		return adminDate;
	}
	public void setAdminDate(Date adminDate) {
		this.adminDate = adminDate;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName
				+ ", adminPassword=" + adminPassword + ", adminDate="
				+ adminDate + "]";
	}
	
	
}
