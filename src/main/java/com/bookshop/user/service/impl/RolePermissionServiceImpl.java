package com.bookshop.user.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.bean.PermissionBean;
import com.bookshop.user.bean.RoleBean;
import com.bookshop.user.bean.RolePermissionBean;
import com.bookshop.user.bean.UserRoleBean;
import com.bookshop.user.dao.IRolePermissionDao;
import com.bookshop.user.service.IRolePermissionService;
@Service
public class RolePermissionServiceImpl implements IRolePermissionService {
	private IRolePermissionDao roleDao;
	@Autowired
	public void setRoleDao(IRolePermissionDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public List<RoleBean> getRoleList(Integer pageno) {
		return roleDao.getRoleList(pageno);
	}

	@Override
	public Integer getRoleCount() {
		return roleDao.getRoleCount();
	}

	@Override
	public RoleBean getRoleById(Integer id) {
		return roleDao.getRoleById(id);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void addRole(RoleBean roleBean) {
		roleDao.addRole(roleBean);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void deleteRole(Integer id) {
		roleDao.deleteRole(id);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateRole(RoleBean roleBean) {
		roleDao.updateRole(roleBean);
	}

	@Override
	public List<PermissionBean> getPermissionList(Integer pageno) {
		return roleDao.getPermissionList(pageno);
	}

	@Override
	public Integer getPermissionCount() {
		return roleDao.getPermissionCount();
	}

	@Override
	public PermissionBean getPermissionById(Integer id) {
		return roleDao.getPermissionById(id);
	}

	@Override
	public void addPermission(PermissionBean permissionBean) {
		roleDao.addPermission(permissionBean);
	}

/*	@Override
	public void deletePermission(Integer id) {
		roleDao.deletePermission(id);
	}
*/
	@Override
	public void updatePermission(PermissionBean permissionBean) {
		roleDao.updatePermission(permissionBean);
	}

	@Override
	public List<PermissionBean> getPermissionListAll() {
		return roleDao.getPermissionListAll();
	}

	@Override
	public PermissionBean getPermissionIdByName(String name) {
		return roleDao.getPermissionIdByName(name);
	}

	@Override
	public void addRolePermission(RolePermissionBean bean) {
		roleDao.addRolePermission(bean);
	}

	@Override
	public void deletePermissionByrpRoleId(Integer id) {
		roleDao.deletePermissionByrpRoleId(id);
	}

	@Override
	public RoleBean getRoleIdByName(String roleNmae) {
		return roleDao.getRoleIdByName(roleNmae);
	}

	@Override
	public List<RoleBean> getRoleListAll() {
		return roleDao.getRoleListAll();
	}

	@Override
	public List<RoleBean> getRoleNameListByType(String roleType) {
		return roleDao.getRoleNameListByType(roleType);
	}

	@Override
	public void addUserRole(UserRoleBean bean) {
		roleDao.addUserRole(bean);
	}

	@Override
	public void deleteRoleByurRoleId(Integer id) {
		roleDao.deleteRoleByurUserId(id);
	}


}
