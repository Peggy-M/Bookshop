package com.bookshop.user.bean;

import java.io.Serializable;

public class LoginUserBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userId;
	private String userName;
	private String userPassword;
	private String userImage;
	private String userPhone;
	private String userEmail;
	private String userRealname;
	private String userRegisterTime;
	private String lastLoginTime;
	private Integer userStatus;
	public Integer getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public String getUserImage() {
		return userImage;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public String getUserRealname() {
		return userRealname;
	}
	public String getUserRegisterTime() {
		return userRegisterTime;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}
	public void setUserRegisterTime(String userRegisterTime) {
		this.userRegisterTime = userRegisterTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public LoginUserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginUserBean(Integer userId, String userName, String userPassword, String userImage, String userPhone,
			String userEmail, String userRealname, String userRegisterTime, String lastLoginTime, Integer userStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userImage = userImage;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userRealname = userRealname;
		this.userRegisterTime = userRegisterTime;
		this.lastLoginTime = lastLoginTime;
		this.userStatus = userStatus;
	}
	
}
