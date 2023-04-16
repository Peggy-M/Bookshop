package com.bookshop.book.bean;

import java.util.List;


public class BookType {
	private Integer bookFirstId;
	private List<String> bookSecond;
	public Integer getBookFirstId() {
		return bookFirstId;
	}
	public List<String> getBookSecond() {
		return bookSecond;
	}
	public void setBookFirstId(Integer bookFirstId) {
		this.bookFirstId = bookFirstId;
	}
	public void setBookSecond(List<String> bookSecond) {
		this.bookSecond = bookSecond;
	} 
}
