package com.mast.shop.bean.customer;

import java.util.Date;

/**
 * 购物车
 * @author Administrator
 *
 */
public class Cart {
	  //购物车ID
	  private Integer cartId;
	  //用户ID
	  private Integer customerId;
	  //商品ID
	  private Integer productId;
	  //加入购物车时间
	  private Date cartTime;
	  //商品数
	  private Integer cartCount;
	  //单价
	  private double productPrice;
	  //总价
	  private double orderPrice;
	  /**
	   * 	商品图片	商品标题
	   */
	  private String pimage;
	  
	  private String ptitle;
	  
	  private String pintr;
	  
	  private double price;
	  private double sumPrice;
	  private Integer sumCount;
	  
	  public double getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(double sumPrice) {
		this.sumPrice = sumPrice;
	}

	public Integer getSumCount() {
		return sumCount;
	}

	public void setSumCount(Integer sumCount) {
		this.sumCount = sumCount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPintr() {
		return pintr;
	}

	public void setPintr(String pintr) {
		this.pintr = pintr;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public Cart()
	  {
	  }

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
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

	public Date getCartTime() {
		return cartTime;
	}

	public void setCartTime(Date cartTime) {
		this.cartTime = cartTime;
	}

	public Integer getCartCount() {
		return cartCount;
	}

	public void setCartCount(Integer cartCount) {
		this.cartCount = cartCount;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", customerId=" + customerId
				+ ", productId=" + productId + ", cartTime=" + cartTime
				+ ", cartCount=" + cartCount + ", productPrice="
				+ productPrice + ", orderPrice=" + orderPrice + "]";
	}
	  
	  
}
