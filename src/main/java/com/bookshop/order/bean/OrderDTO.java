package com.bookshop.order.bean;

import java.io.Serializable;

public class OrderDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer orderId;
	private String orderNumber;
	private String orderCreateTime;
	private Integer orderPrice;
	private String orderStatus;
	private String orderDeliver;
	private Integer orderAddressId;
	private Integer orderUserId;
	private String orderBak;
	public String getOrderBak() {
		return orderBak;
	}
	public void setOrderBak(String orderBak) {
		this.orderBak = orderBak;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderCreateTime() {
		return orderCreateTime;
	}
	public void setOrderCreateTime(String orderCreateTime) {
		this.orderCreateTime = orderCreateTime;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDeliver() {
		return orderDeliver;
	}
	public void setOrderDeliver(String orderDeliver) {
		this.orderDeliver = orderDeliver;
	}
	public Integer getOrderAddressId() {
		return orderAddressId;
	}
	public void setOrderAddressId(Integer orderAddressId) {
		this.orderAddressId = orderAddressId;
	}
	public Integer getOrderUserId() {
		return orderUserId;
	}
	public void setOrderUserId(Integer orderUserId) {
		this.orderUserId = orderUserId;
	}
	
}
