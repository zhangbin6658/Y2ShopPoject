package com.mast.shop.bean.admin;

import java.util.Date;

/**
 * 地址字典实体
 * 
 * @author Administrator
 * 
 */
public class Address {
	// 地址ID
	private Integer addressId;
	// 地址名称
	private String addressName;
	//收货人名
	private String addressSignName;
	//收货电话
	private String addressSignPhone;
	// 是否默认
	private String addressDefault;
	// 客户ID
	private Integer customerId;
	// 创建时间
	private Date addressDate;

	public Address() {
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddressSignName() {
		return addressSignName;
	}

	public void setAddressSignName(String addressSignName) {
		this.addressSignName = addressSignName;
	}

	public String getAddressSignPhone() {
		return addressSignPhone;
	}

	public void setAddressSignPhone(String addressSignPhone) {
		this.addressSignPhone = addressSignPhone;
	}

	public String getAddressDefault() {
		return addressDefault;
	}

	public void setAddressDefault(String addressDefault) {
		this.addressDefault = addressDefault;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Date getAddressDate() {
		return addressDate;
	}

	public void setAddressDate(Date addressDate) {
		this.addressDate = addressDate;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", addressName="
				+ addressName + ", addressSignName=" + addressSignName
				+ ", addressSignPhone=" + addressSignPhone
				+ ", addressDefault=" + addressDefault + ", customerId="
				+ customerId + ", addressDate=" + addressDate + "]";
	}

}
