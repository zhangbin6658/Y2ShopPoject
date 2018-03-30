package com.mast.shop.bean.customer;

import java.util.Date;

/**
 * 评论实体
 * @author Administrator
 *
 */
public class Commentary {
	  //评论ID
	  private Integer commentaryId;
	  //评论内容
	  private String commentaryContent;
	  //评论标题
	  private String commentaryTitle;
	  //图片路径
	  private String commentaryPicture;
	  //用户ID
	  private Integer customerId;
	  //商品ID
	  private Integer productId;
	  //评论时间
	  private Date commentaryTime;
	  
	  

	public String getCommentaryTitle() {
		return commentaryTitle;
	}

	public void setCommentaryTitle(String commentaryTitle) {
		this.commentaryTitle = commentaryTitle;
	}

	/**
	   * 商品名称	图片
	   */
	  private String pname;
	  private String pimage;
	  
	  public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public Commentary()
	  {
	  }

	public Integer getCommentaryId() {
		return commentaryId;
	}

	public void setCommentaryId(Integer commentaryId) {
		this.commentaryId = commentaryId;
	}

	public String getCommentaryContent() {
		return commentaryContent;
	}

	public void setCommentaryContent(String commentaryContent) {
		this.commentaryContent = commentaryContent;
	}

	public String getCommentaryPicture() {
		return commentaryPicture;
	}

	public void setCommentaryPicture(String commentaryPicture) {
		this.commentaryPicture = commentaryPicture;
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

	public Date getCommentaryTime() {
		return commentaryTime;
	}

	public void setCommentaryTime(Date commentaryTime) {
		this.commentaryTime = commentaryTime;
	}

	@Override
	public String toString() {
		return "Commentary [commentaryId=" + commentaryId
				+ ", commentaryContent=" + commentaryContent
				+ ", commentaryTitle=" + commentaryTitle
				+ ", commentaryPicture=" + commentaryPicture + ", customerId="
				+ customerId + ", productId=" + productId + ", commentaryTime="
				+ commentaryTime + ", pname=" + pname + ", pimage=" + pimage
				+ "]";
	}

	

	
	  
	
}
