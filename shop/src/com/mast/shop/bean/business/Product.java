package com.mast.shop.bean.business;

import java.util.Date;

/**
 * 商品实体类
 * @author Administrator
 *
 */
public class Product {
	  //商品ID
	  private Integer productId;
	  //商品name
	  private String productName;
	  //单价
	  private double productPrice;
	  //标题
	  private String productTitle;	 
	  //描述
	  private String productIntroduction;
	  //图片路径
	  private String productImage;
	  //库存
	  private Integer productCount;
	  //销量
	  private Integer productSail;
	  //重量
	  private Double productWeight;
	  //规格大小
	  private String productSize;
	  //一级分类
	  private String productOneId;
	  //二级分类
	  private String productTwoId;
	  //三级分类
	  private String productThreeId;
	  //状态
	  private Integer productStatus;
	  //上架日期
	  private Date productStartDateTime;
	  //下架日期
	  private Date productEndDateTime;
	  //商家ID
	  private Integer businessId;
	  //发货地
	  private String productAddress;
	  //配送类型
	  private Integer sendTypeId;
	  //浏览量
	  private Integer productPageView;
	  
	  private String categoryLevel1Name;//所属一级分类名称
	  private String categoryLevel2Name;//所属二级分类名称
	  private String categoryLevel3Name;//所属三级分类名称
		
		
	  
	  public String getCategoryLevel1Name() {
		return categoryLevel1Name;
	}

	public void setCategoryLevel1Name(String categoryLevel1Name) {
		this.categoryLevel1Name = categoryLevel1Name;
	}

	public String getCategoryLevel2Name() {
		return categoryLevel2Name;
	}

	public void setCategoryLevel2Name(String categoryLevel2Name) {
		this.categoryLevel2Name = categoryLevel2Name;
	}

	public String getCategoryLevel3Name() {
		return categoryLevel3Name;
	}

	public void setCategoryLevel3Name(String categoryLevel3Name) {
		this.categoryLevel3Name = categoryLevel3Name;
	}

	//商品类型
	  private String typename;
	  
	  public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public Product()
	  {
	  }

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
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

	

	public String getProductIntroduction() {
		return productIntroduction;
	}

	public void setProductIntroduction(String productIntroduction) {
		this.productIntroduction = productIntroduction;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Integer getProductCount() {
		return productCount;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

	public Integer getProductSail() {
		return productSail;
	}

	public void setProductSail(Integer productSail) {
		this.productSail = productSail;
	}

	public Double getProductWeight() {
		return productWeight;
	}

	public void setProductWeight(Double productWeight) {
		this.productWeight = productWeight;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	

	public String getProductOneId() {
		return productOneId;
	}

	public void setProductOneId(String productOneId) {
		this.productOneId = productOneId;
	}

	public String getProductTwoId() {
		return productTwoId;
	}

	public void setProductTwoId(String productTwoId) {
		this.productTwoId = productTwoId;
	}

	public String getProductThreeId() {
		return productThreeId;
	}

	public void setProductThreeId(String productThreeId) {
		this.productThreeId = productThreeId;
	}

	public Integer getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

	public Date getProductStartDateTime() {
		return productStartDateTime;
	}

	public void setProductStartDateTime(Date productStartDateTime) {
		this.productStartDateTime = productStartDateTime;
	}

	public Date getProductEndDateTime() {
		return productEndDateTime;
	}

	public void setProductEndDateTime(Date productEndDateTime) {
		this.productEndDateTime = productEndDateTime;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public String getProductAddress() {
		return productAddress;
	}

	public void setProductAddress(String productAddress) {
		this.productAddress = productAddress;
	}

	public Integer getSendTypeId() {
		return sendTypeId;
	}

	public void setSendTypeId(Integer sendTypeId) {
		this.sendTypeId = sendTypeId;
	}

	public Integer getProductPageView() {
		return productPageView;
	}

	public void setProductPageView(Integer productPageView) {
		this.productPageView = productPageView;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName="
				+ productName + ", productPrice=" + productPrice
				+ ", productTitle=" + productTitle + ", productInroduction="
				+ productIntroduction + ", productImage=" + productImage
				+ ", productCount=" + productCount + ", productSail="
				+ productSail + ", productWeight=" + productWeight
				+ ", productSize=" + productSize + ", productOneId="
				+ productOneId + ", productTwoId=" + productTwoId
				+ ", productThreeId=" + productThreeId + ", productStatus="
				+ productStatus + ", productStartDateTime="
				+ productStartDateTime + ", productEndDateTime="
				+ productEndDateTime + ", businessId=" + businessId
				+ ", productAddress=" + productAddress + ", sendTypeId="
				+ sendTypeId + ", productPageView=" + productPageView + "]";
	}


	
	  
	  
}
