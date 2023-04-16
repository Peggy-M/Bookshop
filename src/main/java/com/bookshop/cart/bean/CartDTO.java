package com.bookshop.cart.bean;

import java.io.Serializable;

public class CartDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer cartId;
	private String cartBookImage;
	private String cartBookName;
	private Integer cartBookSellprice;
	private Integer cartBookPrice;
	private Integer cartBookNumber;
	private String cartBookAddtime;
	private Integer cartUserId;
	private String cartOrderNumber;
	private Integer cartStatus;
	private String cartBak;
	
	public String getCartOrderNumber() {
		return cartOrderNumber;
	}
	public void setCartOrderNumber(String cartOrderNumber) {
		this.cartOrderNumber = cartOrderNumber;
	}
	public Integer getCartStatus() {
		return cartStatus;
	}
	public void setCartStatus(Integer cartStatus) {
		this.cartStatus = cartStatus;
	}
	public String getCartBak() {
		return cartBak;
	}
	public void setCartBak(String cartBak) {
		this.cartBak = cartBak;
	}
	public Integer getCartUserId() {
		return cartUserId;
	}
	public void setCartUserId(Integer cartUserId) {
		this.cartUserId = cartUserId;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public String getCartBookImage() {
		return cartBookImage;
	}
	public void setCartBookImage(String cartBookImage) {
		this.cartBookImage = cartBookImage;
	}
	public String getCartBookName() {
		return cartBookName;
	}
	public void setCartBookName(String cartBookName) {
		this.cartBookName = cartBookName;
	}
	public Integer getCartBookSellprice() {
		return cartBookSellprice;
	}
	public void setCartBookSellprice(Integer cartBookSellprice) {
		this.cartBookSellprice = cartBookSellprice;
	}
	public Integer getCartBookPrice() {
		return cartBookPrice;
	}
	public void setCartBookPrice(Integer cartBookPrice) {
		this.cartBookPrice = cartBookPrice;
	}
	public Integer getCartBookNumber() {
		return cartBookNumber;
	}
	public void setCartBookNumber(Integer cartBookNumber) {
		this.cartBookNumber = cartBookNumber;
	}
	public String getCartBookAddtime() {
		return cartBookAddtime;
	}
	public void setCartBookAddtime(String cartBookAddtime) {
		this.cartBookAddtime = cartBookAddtime;
	}
	
	
}
