package com.mast.shop.bean.admin;

import java.util.Date;

/**
 * 类型实体
 * @author Administrator
 *
 */
public class DictionaryType {
	  //类型ID
	  private Integer typeId;
	  //类型编码
	  private String typeCode;
	  //类型名称
	  private String typeName;
	  //编码ID
	  private Integer typeCodeId;
	  //创建者ID
	  private Integer adminId;
	  //创建时间ID
	  private Date typeidDate;

	  public DictionaryType()
	  {
	  }

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getTypeCodeId() {
		return typeCodeId;
	}
	public void setTypeCodeId(Integer typeCodeId) {
		this.typeCodeId = typeCodeId;
	}
	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Date getTypeidDate() {
		return typeidDate;
	}

	public void setTypeidDate(Date typeidDate) {
		this.typeidDate = typeidDate;
	}

	@Override
	public String toString() {
		return "DictionaryType [typeId=" + typeId + ", typeCode=" + typeCode
				+ ", typeName=" + typeName + ", typeCodeId=" + typeCodeId
				+ ", adminId=" + adminId + ", typeidDate=" + typeidDate + "]";
	}
	  
	
}
