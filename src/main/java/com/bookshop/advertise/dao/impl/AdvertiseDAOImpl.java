package com.bookshop.advertise.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.advertise.bean.AdvertiseDTO;
import com.bookshop.advertise.dao.IAdvertiseDAO;
@Repository
public class AdvertiseDAOImpl extends SqlSessionDaoSupport implements IAdvertiseDAO {
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public AdvertiseDTO queryAdvertiseById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.advertise.bean.advertiseMapper.getAdvertiseById", id);
	}

	@Override
	public List<AdvertiseDTO> queryAdvertiseListByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.advertise.bean.advertiseMapper.getAdvertiseByPage", pageno);
	}

	@Override
	public int queryAdvertiseCount() {
		return this.getSqlSession().selectOne("com.bookshop.advertise.bean.advertiseMapper.getAdvertiseCount");
	}

	@Override
	public void addAdvertise(AdvertiseDTO advertise) {
		this.getSqlSession().insert("com.bookshop.advertise.bean.advertiseMapper.addAdvertise", advertise);
	}

	@Override
	public void updateAdvertise(AdvertiseDTO advertise) {
		this.getSqlSession().update("com.bookshop.advertise.bean.advertiseMapper.updateAdvertise", advertise);
	}

	@Override
	public void deleteAdvertise(Integer id) {
		this.getSqlSession().delete("com.bookshop.advertise.bean.advertiseMapper.deleteAdvertiseById", id);
	}

}
