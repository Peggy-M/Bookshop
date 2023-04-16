package com.bookshop.type.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.dao.ISecondTypeDAO;
@Repository
public class SecondTypeDAOImpl extends SqlSessionDaoSupport implements ISecondTypeDAO {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public List<SecondTypeDTO> querySecondTypeById(Integer id) {
		return this.getSqlSession().selectList("com.bookshop.type.bean.secondTypeMapper.getSecondTypeById", id);
	}

	public int getSecondTypeCount() {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.secondTypeMapper.getSecondTypeCount");
	}

	public List<SecondTypeDTO> getSecondTypeByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.type.bean.secondTypeMapper.getSecondTypeByPage", pageno);
	}

	public void addSecondType(SecondTypeDTO secondType) {
		this.getSqlSession().insert("com.bookshop.type.bean.secondTypeMapper.addSecondType", secondType);
	}

	public void updateSecondType(SecondTypeDTO secondType) {
		this.getSqlSession().update("com.bookshop.type.bean.secondTypeMapper.updateSecondType", secondType);
	}

	public void deleteSecondType(Integer id) {
		this.getSqlSession().delete("com.bookshop.type.bean.secondTypeMapper.deleteSecondType", id);
	}

	@Override
	public SecondTypeDTO getSecondTypeBySecondTypeId(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.secondTypeMapper.getSecondTypeBySecondId", id);
	}

	@Override
	public List<SecondTypeDTO> getAllSecondType() {
		return this.getSqlSession().selectList("com.bookshop.type.bean.secondTypeMapper.getAllSecondType");
	}

}
