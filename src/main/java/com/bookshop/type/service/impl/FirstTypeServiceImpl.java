package com.bookshop.type.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.dao.IFirstTypeDAO;
import com.bookshop.type.service.IFirstTypeService;
@Service
public class FirstTypeServiceImpl implements IFirstTypeService {
	private IFirstTypeDAO firstTypeDAO;
	
	@Autowired	
	public void setFirstTypeDAO(IFirstTypeDAO firstTypeDAO) {
		this.firstTypeDAO = firstTypeDAO;
	}
	
	/**
	 * 根据ID查询一条一级目录
	 */
	public FirstTypeDTO queryFirstTypeById(Integer id) {
		return firstTypeDAO.queryFirstTypeById(id);
	}

	/**
	 * 查询一级类目总数量
	 */
	public int getFirstTypeCount() {
		return firstTypeDAO.getFirstTypeCount();
	}

	/**
	 * 根据页码查询一列一级类目
	 */
	public List<FirstTypeDTO> getFirstTypeByPage(Integer pageno) {
		return firstTypeDAO.getFirstTypeByPage(pageno);
	}

	/**
	 * 新增一条一级类目
	 */
	public void addFirstType(FirstTypeDTO firstType) {
		firstTypeDAO.addFirstType(firstType);
	}

	/**
	 * 修改一条一级类目
	 */
	public void updateFirstType(FirstTypeDTO firstType) {
		firstTypeDAO.updateFirstType(firstType);
	}
	
	/**
	 * 删除一条一级类目
	 */
	public void deleteFirstType(Integer id) {
		firstTypeDAO.deleteFirstType(id);
	}

	@Override
	public List<FirstTypeDTO> getAllFirstType() {
		return firstTypeDAO.getAllFirstType();
	}

}
