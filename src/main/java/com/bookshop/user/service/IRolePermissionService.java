package com.bookshop.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.bean.PermissionBean;
import com.bookshop.user.bean.RoleBean;
import com.bookshop.user.bean.RolePermissionBean;
import com.bookshop.user.bean.UserRoleBean;

public interface IRolePermissionService {
	/**
	 * @param pageno
	 * @return
	 * 获取角色列表，进行分页排布
	 */
	List<RoleBean> getRoleList(Integer pageno);
	
	/**
	 * @return
	 * 获取角色总数
	 */
	Integer getRoleCount();
	
	/**
	 * @param id
	 * @return
	 * 根据id获取角色
	 */
	RoleBean getRoleById(Integer id);
	/**
	 * @param roleBean
	 * 增加角色
	 */
	void addRole(RoleBean roleBean);
	
	/**
	 * @param roleBean
	 * 根据删除角色
	 */
	void deleteRole(Integer id);
	
	/**
	 * @param roleBean
	 * 修改角色
	 */
	void updateRole(RoleBean roleBean);
	
	/**
	 * @return   权限列表
	 * 获取权限列表
	 */
	List<PermissionBean> getPermissionList(Integer pageno);
	
	/**
	 * @return
	 * 获取权限的总数
	 */
	Integer getPermissionCount();
	
	/**
	 * @param id
	 * @return    
	 * 根据id查询权限信息
	 */
	PermissionBean getPermissionById(Integer id);
	
	/**
	 * @param roleBean
	 * 增加权限
	 */
	void addPermission(PermissionBean permissionBean);
	
	/**
	 * @param roleBean
	 * 删除权限
	 */
	/*void deletePermission(Integer id);*/
	
	/**
	 * @param roleBean
	 * 修改权限
	 */
	void updatePermission(PermissionBean permissionBean);
	
	/**
	 * @return
	 * 在角色列表中选择权限
	 */
	List<PermissionBean> getPermissionListAll();
	/**
	 * @param name
	 * @return
	 * 根据姓名查询id
	 */
	PermissionBean getPermissionIdByName(String name);

	/**
	 * @param bean
	 * 在角色和权限中间表上新增id信息
	 */
	void addRolePermission(RolePermissionBean bean);
	
	/**
	 * @param id
	 * 根据角色id删除权限
	 */
	void deletePermissionByrpRoleId(Integer id);
	
	/**
	 * @param roleNmae
	 * @return
	 * 根据角色姓名查询id
	 */
	RoleBean getRoleIdByName(String roleNmae);
	/**
	 * @return
	 * 获取所有部门列表
	 */
	List<RoleBean> getRoleListAll();
	
	/**
	 * @param roleType
	 * @return
	 * 根据部门获取职位名
	 */
	List<RoleBean> getRoleNameListByType(String roleType);
	
	/**
	 * @param bean
	 * 在用户和角色中间表上新增id信息
	 */
	void addUserRole(UserRoleBean bean);
	
	/**
	 * @param id
	 * 根据角色id删除角色
	 */
	void deleteRoleByurRoleId(Integer id);
}
