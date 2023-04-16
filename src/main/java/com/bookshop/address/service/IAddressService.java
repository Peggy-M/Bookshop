package com.bookshop.address.service;

import java.util.List;

import com.bookshop.address.bean.AddressDTO;

public interface IAddressService {
	
	/**
	 * 修改地址
	 * @param address
	 */
	void updateAddress(AddressDTO address);
	
	/**
	 * 点击结算后修改购物车商品状态(已提交)和订单编号
	 * @param cartId
	 */
	void updateCartOrderNumberAndStatus(String orderNumber,Integer cartId);
	
	/**根据用户ID查询用户的地址信息数量
	 * @param id
	 * @return
	 */
	int getUserAddressCount(Integer id);
	
	/**查询所有用户的地址信息数量
	 * @param id
	 * @return
	 */
	int getAddressCount();
	
	/**根据用户ID进行分页查询
	 * @param id
	 * @param pageno
	 * @return
	 */
	List<AddressDTO> getUserAddressByPage(Integer id,Integer pageno);
	
	/**分页查询所有用户地址信息
	 * @param pageno
	 * @return
	 */
	List<AddressDTO> getAddressByPage(Integer pageno);
	
	/**根据地址ID删除一条地址
	 * @param id
	 */
	void deleteAddress(Integer id);
	
	/**
	 * 根据地址ID查询地址信息
	 * @param id
	 */
	AddressDTO queryAddressById(Integer id);

	/**根据前端用户输入进行存储
	 * @param addressDTO
	 */
	void addAddress(AddressDTO addressDTO);
	
	/**根据用户ID进行查询,前端使用
	 * @param id
	 * @param pageno
	 * @return
	 */
	List<AddressDTO> getUserAddressByUserId(Integer id);
}
