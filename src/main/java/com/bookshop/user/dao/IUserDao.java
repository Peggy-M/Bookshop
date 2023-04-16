package com.bookshop.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.bean.RoleBean;

public interface IUserDao {
	 /**
	 * @param userBean
	 * @return 用户信息
	 * 根据用户名查找用户信息
	 */
	LoginUserBean getUserByNamePassword(LoginUserBean userBean);
	
	/**
	 * @param name
	 * @return
	 * 根据用户名查找用户角色信息
	 */
	List<String> getRoleByName(String name); 
	
	/**
	 * @param name
	 * @return
	 * 根据角色查询权限
	 */
	List<String> getPermissionByrole(String name);
	
	/**
	 * @param userBean
	 * 增加注册用户
	 */
	void insertUser(LoginUserBean userBean);
	
	/**
	 * @param userBean
	 * 更新登陆时间
	 */
	void updateLoginTime(LoginUserBean userBean);
	
	/**根据名字查询用户信息
	 * @param name
	 * @return
	 */
	LoginUserBean getUserInfoByName(String name);
	
	/**
	 * @return
	 * 获取用户列表
	 */
	List<LoginUserBean> getUserList(Integer pageno);
	
	/**
	 * @param id
	 * 修改密码
	 */
	void updatePasswordById(LoginUserBean userBean);
	
	/**
	 * @param userBean
	 * 修改资料
	 */
	void updateUserInfoById(LoginUserBean userBean);
	
	/**
	 * @param id
	 * 根据用户id删除用户信息
	 */
	void deleteUserById(Integer id);
	
	/**
	 * @return
	 * 获取用户总数
	 */
	Integer getUserCount();
	
	/**
	 * @param bean
	 * 增加用户信息
	 */
	void insertUsertInfo(LoginUserBean bean);
	
	/**
	 * @param id
	 * @return
	 * 根据id查询用户信息
	 */
	LoginUserBean getUserById(Integer id);
	
	/**
	 * @param userBean
	 * 根据id更新用户登陆状态
	 */
	void updateStatusById(LoginUserBean userBean);
	
	/**
	 * @param name
	 * @return
	 * 根据姓名查找手机号
	 */
	String getPhoneByName(String name);
	/**
	 * @param name
	 * @return
	 * 根据姓名查找用户状态
	 */
	Integer getStatusByName(String name);
}
