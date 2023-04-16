package com.bookshop.user.bean;

import java.io.Serializable;

public class RoleBean implements Serializable{
	/**
	 * 角色类
	 */
	private static final long serialVersionUID = 1L;
	private Integer roleId;
	private String roleName;
	private String roleType;
	public Integer getRoleId() {
		return roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	
}
