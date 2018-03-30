package com.mast.shop.bean.customer;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
/**
 * 消费者实体
 * @author Administrator
 *
 */
public class Customer {
	  //客户ID
	  private Integer customerId;
	  //用户名
	  private String nickName;
	  //用户密码
	  private String passWord;
	  //联系电话
	  private String phone;
	  //注册时间
	  @DateTimeFormat(pattern="yyyy-MM-dd")
	  private Date registerTime;
	  //积分
	  private Integer score;
	  //地址
	  private String address;
	  //客户姓名
	  private String name;
	  //客户身份证号
	  private String ID;
	  //钱包
	  private double wallet;
	  
	  private String orderCode;
	  public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public double getWallet() {
		return wallet;
	}

	public void setWallet(double wallet) {
		this.wallet = wallet;
	}

	public Customer()
	  {
	  }

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}
	
	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", nickName=" + nickName
				+ ", passWord=" + passWord + ", phone=" + phone
				+ ", registerTime=" + registerTime + ", score=" + score
				+ ", address=" + address + ", name=" + name + ", ID=" + ID
				+ "]";
	}
	  
	  
}
