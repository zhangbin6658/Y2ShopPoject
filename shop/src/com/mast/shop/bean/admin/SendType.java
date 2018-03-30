package com.mast.shop.bean.admin;

import java.util.Date;

/**
 * 配送方式实体
 * @author Administrator
 *
 */
public class SendType {
	  //快递ID
	  private Integer sendTypeId;
	  //快递编码
	  private String sendTypeCode;
	  //快递名称
	  private String sendTypeName;
	  //创建者
	  private Integer adminId;
	  //创建时间
	  private Date sendtypeDate;
	  //快递单号(订单表)
	  private String logisticCode;

	  public String getSendTypeCode() {
		return sendTypeCode;
	}

	public void setSendTypeCode(String sendTypeCode) {
		this.sendTypeCode = sendTypeCode;
	}

	public String getLogisticCode() {
		return logisticCode;
	}

	public void setLogisticCode(String logisticCode) {
		this.logisticCode = logisticCode;
	}

	public SendType()
	  {
	  }

	public Integer getSendTypeId() {
		return sendTypeId;
	}

	public void setSendTypeId(Integer sendTypeId) {
		this.sendTypeId = sendTypeId;
	}

	public String getSendTypeName() {
		return sendTypeName;
	}

	public void setSendTypeName(String sendTypeName) {
		this.sendTypeName = sendTypeName;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Date getSendtypeDate() {
		return sendtypeDate;
	}

	public void setSendtypeDate(Date sendtypeDate) {
		this.sendtypeDate = sendtypeDate;
	}

	@Override
	public String toString() {
		return "SendType [sendTypeId=" + sendTypeId + ", sendTypeCode="
				+ sendTypeCode + ", sendTypeName=" + sendTypeName
				+ ", adminId=" + adminId + ", sendtypeDate=" + sendtypeDate
				+ ", logisticCode=" + logisticCode + "]";
	}
	  
	
}
