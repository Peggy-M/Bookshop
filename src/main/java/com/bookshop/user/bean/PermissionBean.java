package com.bookshop.user.bean;

import java.io.Serializable;

public class PermissionBean implements Serializable{
	
	/**
	 * 权限类
	 */
	private static final long serialVersionUID = 1L;
	private Integer permissionId;
	private String permissionName;
	private String permissionDetails;
	public Integer getPermissionId() {
		return permissionId;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public String getPermissionDetails() {
		return permissionDetails;
	}
	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	public void setPermissionDetails(String permissionDetails) {
		this.permissionDetails = permissionDetails;
	}
	
}
