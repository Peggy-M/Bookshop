package com.bookshop.type.bean;

import java.io.Serializable;

/**
 * @author wilson
 *一级类目
 */
public class FirstTypeDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
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
