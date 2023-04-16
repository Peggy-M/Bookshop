package com.bookshop.type.bean;

import java.io.Serializable;
/**
 * @author wilson
 *二级类目
 */
public class SecondTypeDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer typeId;
	private String typeName;
	private Integer typeFirstId;
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
	public Integer getTypeFirstId() {
		return typeFirstId;
	}
	public void setTypeFirstId(Integer typeFirstId) {
		this.typeFirstId = typeFirstId;
	}
	
}
