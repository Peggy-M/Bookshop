package com.bookshop.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.cart.bean.CartDTO;
import com.bookshop.cart.dao.ICartDAO;
import com.bookshop.cart.service.ICartService;
@Service
public class CartServiceImpl implements ICartService {
	private ICartDAO cartDAO;
	@Autowired
	public void setCartDAO(ICartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}

	@Override
	public CartDTO queryCartById(Integer id) {
		return cartDAO.queryCartById(id);
	}

	@Override
	public int queryCartCount() {
		return cartDAO.queryCartCount();
	}

	@Override
	public List<CartDTO> queryCartListByPage(Integer pageno) {
		return cartDAO.queryCartListByPage(pageno);
	}

	@Override
	public void addCart(CartDTO cart) {
		cartDAO.addCart(cart);
	}

	@Override
	public void updateCart(CartDTO cart) {
		cartDAO.updateCart(cart);
	}

	@Override
	public void deleteCart(Integer id) {
		cartDAO.deleteCart(id);
	}

	@Override
	public List<CartDTO> queryAllCart() {
		return cartDAO.queryAllCart();
	}

	@Override
	public List<CartDTO> queryCartByUserId(Integer id,Integer pageno) {
		return cartDAO.queryCartByUserId(id, pageno);
	}

	@Override
	public int queryUserCartCount(Integer id) {
		return cartDAO.queryUserCartCount(id);
	}

	@Override
	public List<CartDTO> queryCart(Integer userId) {
		return cartDAO.queryCart(userId);
	}

	@Override
	public CartDTO queryUserCart(Integer userId, String bookName) {
		return cartDAO.queryUserCart(userId, bookName);
	}

	@Override
	public void updateAmount(CartDTO cart) {
		cartDAO.updateAmount(cart);
	}

	@Override
	public void deleteAllCart(Integer id) {
		cartDAO.deleteAllCart(id);
	}

	@Override
	public List<CartDTO> getCartByOrderNumber(String orderNumber) {
		return cartDAO.getCartByOrderNumber(orderNumber);
	}

	@Override
	public void deleteCartByOrderNumber(String orderNumber) {
		cartDAO.deleteCartByOrderNumber(orderNumber);
	}

}
