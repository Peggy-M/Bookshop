package com.bookshop.user.bean;

import java.util.Set;

public class UserRolePermDTO {
	private String userName;
	private Set<String> roles;
	private Set<String> permList;
	public String getUserName() {
		return userName;
	}
	public Set<String> getRoles() {
		return roles;
	}
	public Set<String> getPermList() {
		return permList;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}
	public void setPermList(Set<String> permList) {
		this.permList = permList;
	}
}
