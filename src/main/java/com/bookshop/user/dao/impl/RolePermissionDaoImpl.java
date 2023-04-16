package com.bookshop.user.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.user.bean.PermissionBean;
import com.bookshop.user.bean.RoleBean;
import com.bookshop.user.bean.RolePermissionBean;
import com.bookshop.user.bean.UserRoleBean;
import com.bookshop.user.dao.IRolePermissionDao;
@Repository
public class RolePermissionDaoImpl extends SqlSessionDaoSupport implements IRolePermissionDao {

	@Override
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public List<RoleBean> getRoleList(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.RoleBeanMapper.getRoleList",pageno);
	}

	@Override
	public Integer getRoleCount() {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.RoleBeanMapper.getRoleCount");
	}

	@Override
	public RoleBean getRoleById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.RoleBeanMapper.getRoleById", id);
	}

	@Override
	public void addRole(RoleBean roleBean) {
		this.getSqlSession().insert("com.bookshop.user.bean.RoleBeanMapper.addRole", roleBean);
	}

	@Override
	public void deleteRole(Integer id) {
		this.getSqlSession().delete("com.bookshop.user.bean.RoleBeanMapper.deleteRoleById", id);
	}

	@Override
	public void updateRole(RoleBean roleBean) {
		this.getSqlSession().update("com.bookshop.user.bean.RoleBeanMapper.updateRole", roleBean);
	}

	@Override
	public List<PermissionBean> getPermissionList(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.PermissionBeanMapper.getPermissionList",pageno);
	}

	@Override
	public Integer getPermissionCount() {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.PermissionBeanMapper.getPermissionCount");
	}

	@Override
	public PermissionBean getPermissionById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.PermissionBeanMapper.getPermissionById", id);
	}

	@Override
	public void addPermission(PermissionBean permissionBean) {
		this.getSqlSession().insert("com.bookshop.user.bean.PermissionBeanMapper.addPermission", permissionBean);
	}

	/*@Override
	public void deletePermission(Integer id) {
		this.getSqlSession().delete("com.bookshop.user.bean.PermissionBeanMapper.deletePermissionById", id);
	}
*/
	@Override
	public void updatePermission(PermissionBean permissionBean) {
		this.getSqlSession().update("com.bookshop.user.bean.PermissionBeanMapper.updatePermission", permissionBean);
	}

	@Override
	public List<PermissionBean> getPermissionListAll() {
		return this.getSqlSession().selectList("com.bookshop.user.bean.PermissionBeanMapper.getPermissionListAll");
	}

	@Override
	public PermissionBean getPermissionIdByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.PermissionBeanMapper.getPermissionByName", name);
	}

	@Override
	public void addRolePermission(RolePermissionBean bean) {
		this.getSqlSession().insert("com.bookshop.user.bean.RolePermissionBeanMapper.addRolePermission", bean);
	}

	@Override
	public void deletePermissionByrpRoleId(Integer id) {
		this.getSqlSession().delete("com.bookshop.user.bean.RolePermissionBeanMapper.deleteUrIdByUserId", id);
	}

	@Override
	public RoleBean getRoleIdByName(String roleNmae) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.RoleBeanMapper.getRoleIdByName", roleNmae);
	}

	@Override
	public List<RoleBean> getRoleListAll() {
		return this.getSqlSession().selectList("com.bookshop.user.bean.RoleBeanMapper.getRoleTypeListAll");
	}

	@Override
	public List<RoleBean> getRoleNameListByType(String roleType) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.RoleBeanMapper.getRoleNameByType",roleType);
	}

	@Override
	public void addUserRole(UserRoleBean bean) {
		this.getSqlSession().insert("com.bookshop.user.bean.UserRoleBeanMapper.addUserRole",bean );
	}

	@Override
	public void deleteRoleByurUserId(Integer id) {
		this.getSqlSession().delete("com.bookshop.user.bean.UserRoleBeanMapper.deleteUrIdByUserId", id);
	}
}
