package com.bookshop.frontbook.bean;

import java.io.Serializable;
import java.util.List;

public class Type2aboutType1Bean implements Serializable{
	private String typeoneName;
	private List<SecondTypeBean> secondtype;
	public String getTypeoneName() {
		return typeoneName;
	}
	public void setTypeoneName(String typeoneName) {
		this.typeoneName = typeoneName;
	}
	public List<SecondTypeBean> getSecondtype() {
		return secondtype;
	}
	public void setSecondtype(List<SecondTypeBean> secondtype) {
		this.secondtype = secondtype;
	}
	

}
