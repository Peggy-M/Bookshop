package com.bookshop.address.bean;

import java.io.Serializable;

public class AddressDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer addressId;
	private String addressUserName;
	private String addressArea;
	private String addressDetails;
	private String addressPhone;
	private String addressPostcode;
	private Integer addressUserId;
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getAddressUserName() {
		return addressUserName;
	}
	public void setAddressUserName(String addressUserName) {
		this.addressUserName = addressUserName;
	}
	public String getAddressArea() {
		return addressArea;
	}
	public void setAddressArea(String addressArea) {
		this.addressArea = addressArea;
	}
	public String getAddressDetails() {
		return addressDetails;
	}
	public void setAddressDetails(String addressDetails) {
		this.addressDetails = addressDetails;
	}
	public String getAddressPhone() {
		return addressPhone;
	}
	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}
	public String getAddressPostcode() {
		return addressPostcode;
	}
	public void setAddressPostcode(String addressPostcode) {
		this.addressPostcode = addressPostcode;
	}
	public Integer getAddressUserId() {
		return addressUserId;
	}
	public void setAddressUserId(Integer addressUserId) {
		this.addressUserId = addressUserId;
	}
	
}
