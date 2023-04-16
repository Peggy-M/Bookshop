package com.bookshop.cart.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.cart.bean.CartDTO;
import com.bookshop.cart.dao.ICartDAO;
@Repository
public class CartDAOImpl extends SqlSessionDaoSupport implements ICartDAO {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public CartDTO queryCartById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.cart.bean.cartMapper.getCartById", id);
	}

	@Override
	public int queryCartCount() {
		return this.getSqlSession().selectOne("com.bookshop.cart.bean.cartMapper.getCartCount");
	}

	@Override
	public List<CartDTO> queryCartListByPage(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.cart.bean.cartMapper.getCartListByPage", pageno);
	}

	@Override
	public void addCart(CartDTO cart) {
		this.getSqlSession().insert("com.bookshop.cart.bean.cartMapper.addCart", cart);
	}

	@Override
	public void updateCart(CartDTO cart) {
		this.getSqlSession().update("com.bookshop.cart.bean.cartMapper.updateCart", cart);
	}

	@Override
	public void deleteCart(Integer id) {
		this.getSqlSession().delete("com.bookshop.cart.bean.cartMapper.deleteCart", id);
	}

	@Override
	public List<CartDTO> queryAllCart() {
		return this.getSqlSession().selectList("com.bookshop.cart.bean.cartMapper.getAllCart");
	}

	@Override
	public List<CartDTO> queryCartByUserId(Integer id,Integer pageno) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("cartUserId", id);
		map.put("pageno", pageno);
		return this.getSqlSession().selectList("com.bookshop.cart.bean.cartMapper.getCartListByUserId", map);
	}

	@Override
	public int queryUserCartCount(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.cart.bean.cartMapper.getUserCartCount", id);
	}

	@Override
	public List<CartDTO> queryCart(Integer userId) {
		return this.getSqlSession().selectList("com.bookshop.cart.bean.cartMapper.getUserCartByUserId", userId);
	}

	@Override
	public CartDTO queryUserCart(Integer userId, String bookName) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cartUserId", userId);
		map.put("cartBookName", bookName);
		return this.getSqlSession().selectOne("com.bookshop.cart.bean.cartMapper.getCartBookByUserIdAndBookName", map);
	}

	@Override
	public void updateAmount(CartDTO cart) {
		this.getSqlSession().update("com.bookshop.cart.bean.cartMapper.updateCartAmount", cart);
	}

	@Override
	public void deleteAllCart(Integer id) {
		this.getSqlSession().delete("com.bookshop.cart.bean.cartMapper.deleteAllCart", id);
	}

	@Override
	public List<CartDTO> getCartByOrderNumber(String orderNumber) {
		return this.getSqlSession().selectList("com.bookshop.cart.bean.cartMapper.getCartByOrderNumber", orderNumber);
	}

	@Override
	public void deleteCartByOrderNumber(String orderNumber) {
		this.getSqlSession().delete("com.bookshop.cart.bean.cartMapper.deleteCartByOrderNumber", orderNumber);
	}
	
}
