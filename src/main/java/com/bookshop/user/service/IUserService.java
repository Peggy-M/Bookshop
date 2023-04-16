package com.bookshop.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.bookshop.user.bean.LoginUserBean;

public interface IUserService {
	/**
	 * @param userBean
	 * @return
	 * 根据用户名和密码验证是否正确
	 */
	LoginUserBean getUser(LoginUserBean userBean);
	/**
	 * @param name
	 * @return
	 * 根据用户名查询角色
	 */
	List<String> getRoleByName(String name);
	/**
	 * @param 
	 * @return
	 * 根据角色查询权限
	 */
	List<String> getPermissionByRole(String role);
	
	/**
	 * @param userBean
	 * 用户注册，对密码加密
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
	void insertUsertInfo(LoginUserBean bean,MultipartFile userImage,HttpServletRequest request);
	
	/**
	 * @param id
	 * @return
	 * 根据id查询用户信息
	 */
	LoginUserBean getUserById(Integer id);
	/**
	 * 保存修改信息
	 */
	void updateUserSave(Integer id,LoginUserBean loginUserBean,MultipartFile userImage2,HttpServletRequest request);

	/**
	 * @param userBean
	 * 根据id更新用户登陆状态
	 */
	void updateStatusById(LoginUserBean userBean);
	
	/**
	 * @param mobile
	 * @return
	 * 验证短信密码
	 */
	String mobileChack(String mobile,String content);
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
