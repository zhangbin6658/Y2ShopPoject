package com.mast.shop.bean.business;

import java.util.Date;

/**
 * 订单实体
 * @author Administrator
 *
 */
public class Order {
	  //订单ID
	  private Integer orderId;
	  //客户ID
	  private Integer customerId;
	  //商品ID
	  private Integer productId;
	  private String productName; //商品名称
	  private double productPrice; //单价(product表)
	  private String productTitle; //标题 (product表)
	  private String productImage; //图片路径(product表)
	  
	  //订单编号（18位）
	  private String orderCode;
	  //订单收货地址
	  private Integer orderAddress;
	  private String addressSignName; //收货人名(address表)
	  private String addressName; //收货地址(address表)
	  
	  //下单时间
	  private Date orderDate;
	  //数量
	  private Integer orderCount;
	  //发票号
	  private Integer orderReceiptId;
	  //订单总价
	  private double orderPrice;
	  //发货时间
	  private Date orderSendDate;
	  //付款方式
	  private String orderPayment;
	  //配送方式
	  private Integer orderSendType;
	  private String sendTypeName; //配送快递名(sendType表)
	  
	  //邮费
	  private double orderSendPrice;
	  //订单状态
	  private Integer orderState;
	  
	
	 
	//customer表
	private String nickName;
	private String phone;
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private String typeName; //类型名称(typeDictionary)
	 

	  //商家可见状态
	  private String orderbLook;
	  //客户可见状态
	  private String ordercLook;

	  public Order()
	  {
	  }

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Integer getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(Integer orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Date getOrderDate() {
		
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}

	public Integer getOrderReceiptId() {
		return orderReceiptId;
	}

	public void setOrderReceiptId(Integer orderReceiptId) {
		this.orderReceiptId = orderReceiptId;
	}

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getOrderSendDate() {
		return orderSendDate;
	}

	public void setOrderSendDate(Date orderSendDate) {
		this.orderSendDate = orderSendDate;
	}

	public String getOrderPayment() {
		return orderPayment;
	}

	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}

	public Integer getOrderSendType() {
		return orderSendType;
	}

	public void setOrderSendType(Integer orderSendType) {
		this.orderSendType = orderSendType;
	}

	public double getOrderSendPrice() {
		return orderSendPrice;
	}

	public void setOrderSendPrice(double orderSendPrice) {
		this.orderSendPrice = orderSendPrice;
	}

	public Integer getOrderState() {
		return orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public String getOrderbLook() {
		return orderbLook;
	}

	public void setOrderbLook(String orderbLook) {
		this.orderbLook = orderbLook;
	}

	public String getOrdercLook() {
		return ordercLook;
	}

	public void setOrdercLook(String ordercLook) {
		this.ordercLook = ordercLook;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getAddressSignName() {
		return addressSignName;
	}

	public void setAddressSignName(String addressSignName) {
		this.addressSignName = addressSignName;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getSendTypeName() {
		return sendTypeName;
	}

	public void setSendTypeName(String sendTypeName) {
		this.sendTypeName = sendTypeName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", customerId=" + customerId
				+ ", productId=" + productId + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productTitle="
				+ productTitle + ", productImage=" + productImage
				+ ", orderCode=" + orderCode + ", orderAddress=" + orderAddress
				+ ", addressSignName=" + addressSignName + ", addressName="
				+ addressName + ", orderDate=" + orderDate + ", orderCount="
				+ orderCount + ", orderReceiptId=" + orderReceiptId
				+ ", orderPrice=" + orderPrice + ", orderSendDate="
				+ orderSendDate + ", orderPayment=" + orderPayment
				+ ", orderSendType=" + orderSendType + ", sendTypeName="
				+ sendTypeName + ", orderSendPrice=" + orderSendPrice
				+ ", orderState=" + orderState + ", typeName=" + typeName
				+ ", orderbLook=" + orderbLook + ", ordercLook=" + ordercLook
				+ "]";
	}
	
	  
	
	  
	  
}
