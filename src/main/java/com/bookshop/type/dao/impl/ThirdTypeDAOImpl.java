package com.bookshop.type.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.type.bean.ThirdTypeDTO;
import com.bookshop.type.dao.IThirdTypeDAO;
@Repository
public class ThirdTypeDAOImpl extends SqlSessionDaoSupport implements IThirdTypeDAO {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public List<ThirdTypeDTO> queryThirdTypeById(Integer id) {
		return this.getSqlSession().selectList("com.bookshop.type.bean.thirdTypeMapper.getThirdTypeById", id);
	}

	public int getThirdTypeCount() {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.thirdTypeMapper.getThirdTypeCount");
	}

	public List<ThirdTypeDTO> getThirdTypeByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.type.bean.thirdTypeMapper.getThirdTypeByPage", pageno);
	}

	public void addThirdType(ThirdTypeDTO thirdType) {
		this.getSqlSession().insert("com.bookshop.type.bean.thirdTypeMapper.addThirdType", thirdType);
	}

	public void updateThirdType(ThirdTypeDTO thirdType) {
		this.getSqlSession().update("com.bookshop.type.bean.thirdTypeMapper.updateThirdType", thirdType);
	}

	public void deleteThirdType(Integer id) {
		this.getSqlSession().delete("com.bookshop.type.bean.thirdTypeMapper.deleteThirdType", id);
	}

	@Override
	public ThirdTypeDTO getThirdTypeByThirdId(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.thirdTypeMapper.getThirdTypeByThirdId", id);
	}

}
