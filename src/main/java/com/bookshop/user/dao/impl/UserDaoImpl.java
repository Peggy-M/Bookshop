package com.bookshop.user.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.dao.IUserDao;
@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements IUserDao {
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public LoginUserBean getUserByNamePassword(LoginUserBean userBean){
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.selectUserByNameAndPawd", userBean.getUserName());
	}

	public List<String> getRoleByName(String name) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.RoleBeanMapper.getRoleByName", name);
	}

	public List<String> getPermissionByrole(String name) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.PermissionBeanMapper.getPermByRoleName",name );
	}

	public void insertUser(LoginUserBean userBean) {
		this.getSqlSession().insert("com.bookshop.user.bean.LoginUserBeanMapper.insertUser", userBean);
	}

	public void updateLoginTime(LoginUserBean userBean) {
		this.getSqlSession().update("com.bookshop.user.bean.LoginUserBeanMapper.updateLoginTimeByName", userBean);
	}

	@Override
	public LoginUserBean getUserInfoByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.selectUserByName", name);
	}

	@Override
	public List<LoginUserBean> getUserList(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.user.bean.LoginUserBeanMapper.getUserList",pageno);
	}

	@Override
	public void updatePasswordById(LoginUserBean userBean) {
		this.getSqlSession().update("com.bookshop.user.bean.LoginUserBeanMapper.updatePasswordById", userBean);
	}

	@Override
	public void updateUserInfoById(LoginUserBean userBean) {
		this.getSqlSession().update("com.bookshop.user.bean.LoginUserBeanMapper.updateUserInfoById", userBean);
	}

	@Override
	public void deleteUserById(Integer id) {
		this.getSqlSession().delete("com.bookshop.user.bean.LoginUserBeanMapper.deleteById", id);
	}

	@Override
	public Integer getUserCount() {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.getUserCount");
	}

	@Override
	public void insertUsertInfo(LoginUserBean bean) {
		this.getSqlSession().insert("com.bookshop.user.bean.LoginUserBeanMapper.insertUserInfo", bean);
	}

	@Override
	public LoginUserBean getUserById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.selectUserById", id);
	}

	@Override
	public void updateStatusById(LoginUserBean userBean) {
		this.getSqlSession().update("com.bookshop.user.bean.LoginUserBeanMapper.updateStatusById", userBean);
	}

	@Override
	public String getPhoneByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.getPhoneByName", name);
	}

	@Override
	public Integer getStatusByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.user.bean.LoginUserBeanMapper.getStatusByName", name);
	}
	
}
