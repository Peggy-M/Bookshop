package com.bookshop.advertise.bean;

import java.io.Serializable;

public class AdvertiseDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer adId;
	private String adTitle;
	private String adContent;
	private String adPublishTime;
	public Integer getAdId() {
		return adId;
	}
	public void setAdId(Integer adId) {
		this.adId = adId;
	}
	public String getAdTitle() {
		return adTitle;
	}
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}
	public String getAdContent() {
		return adContent;
	}
	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}
	public String getAdPublishTime() {
		return adPublishTime;
	}
	public void setAdPublishTime(String adPublishTime) {
		this.adPublishTime = adPublishTime;
	}
	
	
}
