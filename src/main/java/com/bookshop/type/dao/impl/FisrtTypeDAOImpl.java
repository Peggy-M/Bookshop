package com.bookshop.type.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.dao.IFirstTypeDAO;
@Repository
public class FisrtTypeDAOImpl extends SqlSessionDaoSupport implements IFirstTypeDAO {
	
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	/**
	 * 根据ID查询一条一级类目
	 */
	public FirstTypeDTO queryFirstTypeById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.firstTypeMapper.getFirstTypeById", id);
	}
	
	/**
	 * 查询一级类目总数量
	 */
	public int getFirstTypeCount() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("com.bookshop.type.bean.firstTypeMapper.getFirstTypeCount");
	}
	
	/**
	 * 根据页码查询一列一级类目
	 */
	public List<FirstTypeDTO> getFirstTypeByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.type.bean.firstTypeMapper.getFirstTypeByPage", pageno);
	}

	
	/**
	 * 新增一条一级类目
	 * Isolation.REPEATABLE_READ表示允许重复读和避免脏读
	 */
	@Transactional(isolation=Isolation.REPEATABLE_READ)
	public void addFirstType(FirstTypeDTO firstType) {
		this.getSqlSession().insert("com.bookshop.type.bean.firstTypeMapper.addFirstType", firstType);
	}

	
	/**
	 * 修改一条一级类目
	 * Isolation.REPEATABLE_READ表示允许重复读和避免脏读
	 */
	@Transactional(isolation=Isolation.REPEATABLE_READ)
	public void updateFirstType(FirstTypeDTO firstType) {
		this.getSqlSession().update("com.bookshop.type.bean.firstTypeMapper.updateFirstType", firstType);
	}
	
	/**
	 * 删除一条一级类目
	 * Isolation.REPEATABLE_READ表示允许重复读和避免脏读
	 */
	@Transactional(isolation=Isolation.REPEATABLE_READ)
	public void deleteFirstType(Integer id) {
		this.getSqlSession().delete("com.bookshop.type.bean.firstTypeMapper.deleteFirstType", id);
	}

	/**
	 * 查询所有一级类目
	 */
	@Override
	public List<FirstTypeDTO> getAllFirstType() {
		return this.getSqlSession().selectList("com.bookshop.type.bean.firstTypeMapper.getALLFirstType");
	}

}
