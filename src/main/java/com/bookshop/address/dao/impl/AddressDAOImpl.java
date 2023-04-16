package com.bookshop.address.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.address.bean.AddressDTO;
import com.bookshop.address.dao.IAddressDAO;
@Repository
public class AddressDAOImpl extends SqlSessionDaoSupport implements IAddressDAO {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public int getUserAddressCount(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.address.bean.addressMapper.getUserAddressCount", id);
	}

	@Override
	public int getAddressCount() {
		return this.getSqlSession().selectOne("com.bookshop.address.bean.addressMapper.getAddressCount");
	}

	@Override
	public List<AddressDTO> getUserAddressByPage(Integer id, Integer pageno) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("addressUserId", id);
		map.put("pageno", pageno);
		return this.getSqlSession().selectList("com.bookshop.address.bean.addressMapper.getUserAddressByPage", map);
	}

	@Override
	public List<AddressDTO> getAddressByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.address.bean.addressMapper.getAddressByPage", pageno);
	}

	@Override
	public void deleteAddress(Integer id) {
		this.getSqlSession().delete("com.bookshop.address.bean.addressMapper.deleteAddress", id);
	}

	@Override
	public void addAddress(AddressDTO addressDTO) {
		this.getSqlSession().insert("com.bookshop.address.bean.addressMapper.addAddress", addressDTO);
	}

	@Override
	public List<AddressDTO> getUserAddressByUserId(Integer id) {
		return this.getSqlSession().selectList("com.bookshop.address.bean.addressMapper.getUserAddressByUserId", id);
	}

	@Override
	public AddressDTO queryAddressById(Integer addressId) {
		return this.getSqlSession().selectOne("com.bookshop.address.bean.addressMapper.queryAddressById", addressId);
	}

	@Override
	public void updateCartOrderNumberAndStatus(String orderNumber, Integer cartId) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("orderNumber", orderNumber);
		map.put("cartId", cartId);
		this.getSqlSession().update("com.bookshop.address.bean.addressMapper.updateCartOrderNumberAndStatus", map);
	}

	@Override
	public void updateAddress(AddressDTO address) {
		this.getSqlSession().update("com.bookshop.address.bean.addressMapper.updateAddress", address);
	}

}
