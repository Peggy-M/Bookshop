package com.bookshop.order.service;

import java.util.List;

import com.bookshop.order.bean.CompanyDTO;
import com.bookshop.order.bean.OrderDTO;

public interface IOrderService {
	
	/**
	 * 更新订单状态
	 * @param orderId
	 * @param orderStatus
	 */
	void updateOrderStatus(Integer orderId,String orderStatus);
	
	/**
	 * 根据订单编号查询订单详情
	 * @param orderNumber
	 * @return
	 */
	OrderDTO getOrderByOrderNumber(String orderNumber);
	
	/**根据订单ID查询该订单详情
	 * @param id
	 * @return
	 */
	OrderDTO queryOrder(Integer id);
	
	/**跟据用户ID查询所有订单数量
	 * @param id
	 * @return
	 */
	int getUserOrderCount(Integer id);
	
	/**根据用户ID进行分页查询
	 * @param userId
	 * @param pageno
	 * @return
	 */
	List<OrderDTO> getUserOrder(Integer userId, Integer pageno);
	/**根据订单状态进行分页查询
	 * @param userId
	 * @param pageno
	 * @return
	 */
	List<OrderDTO> getStatusOrder(String status, Integer pageno);
	/**查询状态订单数量
	 * @return
	 */
	int getStatusOrderCount(String status);
	/**查询所有订单数量
	 * @return
	 */
	int getAllOrderCount();
	
	/**分页查询所有订单
	 * @param pageno
	 * @return
	 */
	List<OrderDTO> getAllOrder(Integer pageno);
	
	/**增加一条订单信息
	 * @param order
	 */
	void addOrderInfo(OrderDTO order);
	
	/**删除一条订单信息
	 * @param id
	 */
	void deleteOrderInfo(Integer id);
	
	/**
	 * 根据用户ID查询所有用户的订单
	 * @param id
	 * @return
	 */
	List<OrderDTO> getAllUserOrder(Integer id);

	/**
	 * @param dto
	 * 添加物流单号
	 */
	void updateBakById(OrderDTO dto);

	/**
	 * @param pageno
	 * 查询物流公司列表
	 */
	List<CompanyDTO> getCompanyList(Integer pageno);
	/**
	 * @return
	 * 获取公司数量
	 */
	Integer getCompanyCount();
	
	/**
	 * @param dto
	 * 增加物流公司
	 */
	void insertCompany(CompanyDTO dto);
	/**
	 * @param dto
	 * 修改物流公司
	 */
	void updateCompanyById(CompanyDTO dto);
	
	/**
	 * @param id
	 * 根据id删除公司
	 */
	void deleteCompanyById(Integer id);
	/**
	 * @param id
	 * @return
	 * 根据id查询公司
	 */
	CompanyDTO getCompanyById(Integer id);
}
