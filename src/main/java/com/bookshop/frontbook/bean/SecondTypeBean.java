package com.bookshop.frontbook.bean;

import java.io.Serializable;

public class SecondTypeBean implements Serializable{
	private Integer typeId;
	private String typeName;
	
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
	
	

}
