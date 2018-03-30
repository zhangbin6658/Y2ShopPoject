package com.mast.shop.tools;

import java.util.List;



 
/**
 * 类描述：用户登录身份信息  
 * 类名称：       
 * 创建人：keven  
 * 创建时间：2016年11月14日 下午10:32:33
 * @version   V1.0
 */
public class Principle  implements java.io.Serializable{
	 
 	
	private static final long serialVersionUID = 6971930550570778779L;
	private Integer userId;
	private String loginName;
	private String userName;
	
	/*private List<Menu> menuList;*/
	
	
	public Principle(Integer userId, String loginName, String userName) {
		super();
		this.userId = userId;
		this.loginName = loginName;
		this.userName = userName;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
/*	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}*/
	
	
	 
}