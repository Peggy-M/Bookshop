package com.bookshop.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bookshop.cart.bean.CartDTO;

public interface ICartService {
	
	/**
	 * 删除关联订单编号的购物车商品
	 * @param orderNumber
	 */
	void deleteCartByOrderNumber(String orderNumber);
	
	/**
	 * 根据订单编号查询关联商品
	 * @param orderNumber
	 * @return
	 */
	List<CartDTO> getCartByOrderNumber(String orderNumber);
	
	/**查询所有购物车信息
	 * @return
	 */
	List<CartDTO> queryAllCart();
	
	/**根据ID查询一条购物车内信息
	 * @param id
	 * @return
	 */
	CartDTO queryCartById(Integer id);
	
	/**根据用户ID查询所有购物车内信息
	 * @param id
	 * @return
	 */
	List<CartDTO> queryCartByUserId(Integer id,Integer pageno);
	
	/**查询所有购物车数量
	 * @return
	 */
	int queryCartCount();
	
	/**查询当前用户购物车数量
	 * @return
	 */
	int queryUserCartCount(Integer id);
	
	/**根据页码查询一列购物车信息
	 * @param pageno
	 * @return
	 */
	List<CartDTO> queryCartListByPage(Integer pageno);
	
	/**新增一条购物车信息
	 * @param cart
	 */
	void addCart(CartDTO cart);
	
	/**修改一条购物车信息
	 * @param cart
	 */
	void updateCart(CartDTO cart);
	
	/**根据ID删除一条购物车信息
	 * @param cart
	 */
	void deleteCart(Integer id);
	
	/**根据用户ID查询当前用户的所有购物车图书信息
	 * @param bookName
	 * @return
	 */
	List<CartDTO> queryCart(Integer userId);
	
	/**根据用户Id和书名查询当前购物车内是否有该书
	 * @param userId
	 * @param bookName
	 * @return
	 */
	CartDTO queryUserCart(Integer userId,String bookName);
	
	/**修改购物车商品的数量
	 * @param cart
	 */
	void updateAmount(CartDTO cart);
	
	/**删除当前用户所有购物车信息
	 * @param cart
	 */
	void deleteAllCart(Integer id);
}
