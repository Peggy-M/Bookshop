package com.bookshop.type.bean;

import java.io.Serializable;

public class ThirdTypeDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer typeId;
	private String  typeName;
	private Integer typeSecondId;
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
	public Integer getTypeSecondId() {
		return typeSecondId;
	}
	public void setTypeSecondId(Integer typeSecondId) {
		this.typeSecondId = typeSecondId;
	}
	
}
