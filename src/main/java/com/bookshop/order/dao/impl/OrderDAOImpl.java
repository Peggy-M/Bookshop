package com.bookshop.order.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.order.bean.CompanyDTO;
import com.bookshop.order.bean.OrderDTO;
import com.bookshop.order.dao.IOrderDAO;
@Repository
public class OrderDAOImpl extends SqlSessionDaoSupport implements IOrderDAO {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public OrderDTO queryOrder(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.getOrderById", id);
	}

	@Override
	public int getUserOrderCount(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.getUserOrderCount", id);
	}

	@Override
	public List<OrderDTO> getUserOrder(Integer userId, Integer pageno) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("userId", userId);
		map.put("pageno", pageno);
		return this.getSqlSession().selectList("com.bookshop.order.bean.orderMapper.getOrderListByUserId", map);
	}

	@Override
	public int getAllOrderCount() {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.getAllOrderCount");
	}

	@Override
	public List<OrderDTO> getAllOrder(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.order.bean.orderMapper.getAllOrderByPage", pageno);
	}

	@Override
	public void addOrderInfo(OrderDTO order) {
		this.getSqlSession().insert("com.bookshop.order.bean.orderMapper.addOrderInfo", order);
	}

	@Override
	public void deleteOrderInfo(Integer id) {
		this.getSqlSession().delete("com.bookshop.order.bean.orderMapper.deleteOrderInfo", id);
	}

	/* 获取当前用户所有订单
	 * @see com.bookshop.order.dao.IOrderDAO#getAllUserOrder(java.lang.Integer)
	 */
	@Override
	public List<OrderDTO> getAllUserOrder(Integer id) {
		return this.getSqlSession().selectList("com.bookshop.order.bean.orderMapper.getUserOrder", id);
	}

	@Override
	public OrderDTO getOrderByOrderNumber(String orderNumber) {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.getOrderByOrderNumber", orderNumber);
	}

	@Override
	public void updateBakById(OrderDTO dto) {
		this.getSqlSession().update("com.bookshop.order.bean.orderMapper.updateBakById", dto);
	}

	@Override
	public List<OrderDTO> getPayedOrder(String orderStatus, Integer pageno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderStatus", orderStatus);
		map.put("pageno", pageno);
		return this.getSqlSession().selectList("com.bookshop.order.bean.orderMapper.getOrderListByUserStatus", map);
	}

	@Override
	public int getStatusOrderCount(String status) {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.getStatusOrderCount", status);
	}

	@Override
	public List<CompanyDTO> getCompanyList(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.order.bean.CompanyDTOMapper.getCompanyList", pageno);
	}

	@Override
	public Integer getCompanyCount() {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.CompanyDTOMapper.getCompanyCount");
	}

	@Override
	public void insertCompany(CompanyDTO dto) {
		this.getSqlSession().insert("com.bookshop.order.bean.CompanyDTOMapper.insertCompany", dto);
	}

	@Override
	public void updateCompanyById(CompanyDTO dto) {
		this.getSqlSession().update("com.bookshop.order.bean.CompanyDTOMapper.updateCompanyById", dto);
	}

	@Override
	public void deleteCompanyById(Integer id) {
		this.getSqlSession().delete("com.bookshop.order.bean.CompanyDTOMapper.deleteCompanyById", id);
	}

	@Override
	public CompanyDTO getCompanyById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.order.bean.CompanyDTOMapper.getCompanyById", id);
	}

	@Override
	public void updateOrderStatus(Integer orderId, String orderStatus) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("orderStatus", orderStatus);
		this.getSqlSession().selectOne("com.bookshop.order.bean.orderMapper.updateOrderStatus", map);
	}

}
