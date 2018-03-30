package com.mast.shop.bean.business;

import java.util.Date;

/**
 * 商家实体
 * 
 * @author Administrator
 * @version 1.0
 */
public class Business {
	public Business() {
	}
	  //商家账号
	  private Integer businessId;
	  //商家昵称
	  private String businessName;
	  //商家姓名
	  private String businessRealName;
	  //商家密码
	  private String businessPassword;
	  //商家电话
	  private String businessPhone;
	  //商家邮箱
	  private String businessEmail;
	  //商家身份信息
	  private String id;
	  //商家注册时间
	  private Date businessRegistTime;
	  //商家积分
	  private Integer businessScore;
	  //商家地址
	  private String address;
	  //商家银行卡号
	  private String businessBankId;
	public Integer getBusinessId() {
		return businessId;
	}
	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessRealName() {
		return businessRealName;
	}
	public void setBusinessRealName(String businessRealName) {
		this.businessRealName = businessRealName;
	}
	public String getBusinessPassword() {
		return businessPassword;
	}
	public void setBusinessPassword(String businessPassword) {
		this.businessPassword = businessPassword;
	}
	public String getBusinessPhone() {
		return businessPhone;
	}
	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}
	public String getBusinessEmail() {
		return businessEmail;
	}
	public void setBusinessEmail(String businessEmail) {
		this.businessEmail = businessEmail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Date getBusinessRegistTime() {
		return businessRegistTime;
	}
	public void setBusinessRegistTime(Date businessRegistTime) {
		this.businessRegistTime = businessRegistTime;
	}
	public Integer getBusinessScore() {
		return businessScore;
	}
	public void setBusinessScore(Integer businessScore) {
		this.businessScore = businessScore;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusinessBankId() {
		return businessBankId;
	}
	public void setBusinessBankId(String businessBankId) {
		this.businessBankId = businessBankId;
	}
	@Override
	public String toString() {
		return "Business [businessId=" + businessId + ", businessName="
				+ businessName + ", businessRealName=" + businessRealName
				+ ", businessPassword=" + businessPassword + ", businessPhone="
				+ businessPhone + ", businessEmail=" + businessEmail + ", id="
				+ id + ", businessRegistTime=" + businessRegistTime
				+ ", businessScore=" + businessScore + ", address=" + address
				+ ", businessBankId=" + businessBankId + "]";
	}
	
	

}
