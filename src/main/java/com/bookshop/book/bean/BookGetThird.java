package com.bookshop.book.bean;

import java.util.List;

public class BookGetThird {
	private Integer bookSecondId;
	private List<String> bookThird;
	public Integer getBookSecondId() {
		return bookSecondId;
	}
	public List<String> getBookThird() {
		return bookThird;
	}
	public void setBookSecondId(Integer bookSecondId) {
		this.bookSecondId = bookSecondId;
	}
	public void setBookThird(List<String> bookThird) {
		this.bookThird = bookThird;
	}
}
