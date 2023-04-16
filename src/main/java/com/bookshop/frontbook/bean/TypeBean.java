package com.bookshop.frontbook.bean;

import java.io.Serializable;

public class TypeBean implements Serializable{
	private String typeFirst;
	private String typeSecond;
	private String typeThird;
	public String getTypeFirst() {
		return typeFirst;
	}
	public void setTypeFirst(String typeFirst) {
		this.typeFirst = typeFirst;
	}
	public String getTypeSecond() {
		return typeSecond;
	}
	public void setTypeSecond(String typeSecond) {
		this.typeSecond = typeSecond;
	}
	public String getTypeThird() {
		return typeThird;
	}
	public void setTypeThird(String typeThird) {
		this.typeThird = typeThird;
	}


}
