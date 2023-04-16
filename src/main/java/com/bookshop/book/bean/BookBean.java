package com.bookshop.book.bean;

import java.io.Serializable;

public class BookBean implements Serializable{
	/**
	 * 图书信息类
	 */
	private static final long serialVersionUID = 1L;
	private Integer bookId;
	private String bookName;
	private String bookAuthor;
	private String bookISBN;
	private String bookPress;
	private String bookPblishTime;
	private String bookEdition;
	private String bookSize;
	private Integer bookPrice;
	private Integer bookSellPrice;
	private Integer bookPrimeCost;
	private String bookPrimeDate;
	private String bookCover;
	private Integer bookTyprFirst;
	private Integer bookTypeSecond;
	private Integer bookTypeThird;
	private Integer bookNumber;
	private String bookdetails;
	private Integer bookStatus;
	private Integer bookSales;
	public Integer getBookId() {
		return bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public String getBookISBN() {
		return bookISBN;
	}
	public String getBookPress() {
		return bookPress;
	}
	
	public String getBookEdition() {
		return bookEdition;
	}
	public String getBookSize() {
		return bookSize;
	}
	public Integer getBookPrice() {
		return bookPrice;
	}
	public Integer getBookSellPrice() {
		return bookSellPrice;
	}
	public Integer getBookPrimeCost() {
		return bookPrimeCost;
	}
	public String getBookPrimeDate() {
		return bookPrimeDate;
	}
	public String getBookCover() {
		return bookCover;
	}
	public Integer getBookTypeSecond() {
		return bookTypeSecond;
	}
	public Integer getBookTypeThird() {
		return bookTypeThird;
	}
	public Integer getBookNumber() {
		return bookNumber;
	}
	public Integer getBookStatus() {
		return bookStatus;
	}
	public Integer getBookSales() {
		return bookSales;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}
	public void setBookPress(String bookPress) {
		this.bookPress = bookPress;
	}
	
	public String getBookPblishTime() {
		return bookPblishTime;
	}
	public void setBookPblishTime(String bookPblishTime) {
		this.bookPblishTime = bookPblishTime;
	}
	public void setBookEdition(String bookEdition) {
		this.bookEdition = bookEdition;
	}
	public void setBookSize(String bookSize) {
		this.bookSize = bookSize;
	}
	public void setBookPrice(Integer bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void setBookSellPrice(Integer bookSellPrice) {
		this.bookSellPrice = bookSellPrice;
	}
	public void setBookPrimeCost(Integer bookPrimeCost) {
		this.bookPrimeCost = bookPrimeCost;
	}
	public void setBookPrimeDate(String bookPrimeDate) {
		this.bookPrimeDate = bookPrimeDate;
	}
	public void setBookCover(String bookCover) {
		this.bookCover = bookCover;
	}
	
	public Integer getBookTyprFirst() {
		return bookTyprFirst;
	}
	public void setBookTyprFirst(Integer bookTyprFirst) {
		this.bookTyprFirst = bookTyprFirst;
	}
	public void setBookTypeSecond(Integer bookTypeSecond) {
		this.bookTypeSecond = bookTypeSecond;
	}
	public void setBookTypeThird(Integer bookTypeThird) {
		this.bookTypeThird = bookTypeThird;
	}
	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
	}
	
	public String getBookdetails() {
		return bookdetails;
	}
	public void setBookdetails(String bookdetails) {
		this.bookdetails = bookdetails;
	}
	public void setBookStatus(Integer bookStatus) {
		this.bookStatus = bookStatus;
	}
	public void setBookSales(Integer bookSales) {
		this.bookSales = bookSales;
	}
	
	
}
