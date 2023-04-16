package com.bookshop.order.bean;

public class CompanyDTO {
	private Integer companyId;
	private String companyName;
	private String companyCom;
	public Integer getCompanyId() {
		return companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public String getCompanyCom() {
		return companyCom;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public void setCompanyCom(String companyCom) {
		this.companyCom = companyCom;
	}
	
}
