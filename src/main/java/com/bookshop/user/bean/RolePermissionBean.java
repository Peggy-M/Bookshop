package com.bookshop.user.bean;

public class RolePermissionBean {
	private Integer rpId;
	private Integer rpRoleId;
	private Integer rpPermissionId;
	public Integer getRpId() {
		return rpId;
	}
	public Integer getRpRoleId() {
		return rpRoleId;
	}
	public Integer getRpPermissionId() {
		return rpPermissionId;
	}
	public void setRpId(Integer rpId) {
		this.rpId = rpId;
	}
	public void setRpRoleId(Integer rpRoleId) {
		this.rpRoleId = rpRoleId;
	}
	public void setRpPermissionId(Integer rpPermissionId) {
		this.rpPermissionId = rpPermissionId;
	}
}
