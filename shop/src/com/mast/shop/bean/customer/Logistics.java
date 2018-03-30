package com.mast.shop.bean.customer;
/**
 * 物流信息
 * @author Administrator
 *
 */
public class Logistics {
	private Integer id;
	private String substance;
	private String date;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSubstance() {
		return substance;
	}
	public void setSubstance(String substance) {
		this.substance = substance;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Logistics [id=" + id + ", substance=" + substance + ", date="
				+ date + "]";
	}
	
}
