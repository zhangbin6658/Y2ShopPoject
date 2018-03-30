package com.mast.shop.bean.business;

import java.util.Date;
import java.util.List;
/**
 * 订单集合实体类
 * @author Administrator
 *
 */
public class OrderItem {
	/**
	 * 订单编号
	 */
	private String orderCode;
	/**
	 * 下单日期
	 */
	private Date orderDate;
	/**
	 * 成交日期
	 */
	private Date orderSuccessDate;
	/**
	 * 订单总价
	 */
	private double orderMoney;
	/**
	 * 订单状态Id
	 */
	private Integer typeId;
	/**
	 * 订单状态名称
	 */
	private String typeName;
	/**
	 * 类型编码
	 */
	private String typeCode;
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	/**
	 * 订单中的商品集
	 */
	private List<Order> list;
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getOrderSuccessDate() {
		return orderSuccessDate;
	}
	public void setOrderSuccessDate(Date orderSuccessDate) {
		this.orderSuccessDate = orderSuccessDate;
	}
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<Order> getList() {
		return list;
	}
	public void setList(List<Order> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "OrderItem [orderCode=" + orderCode + ", orderDate=" + orderDate
				+ ", orderSuccessDate=" + orderSuccessDate + ", orderMoney="
				+ orderMoney + ", typeId=" + typeId + ", typeName=" + typeName
				+ ", typeCode=" + typeCode + ", list=" + list + "]";
	}
	
	
}
