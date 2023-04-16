package com.bookshop.type.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.dao.ISecondTypeDAO;
import com.bookshop.type.service.ISecondTypeService;
@Service
public class SecondTypeServiceImpl implements ISecondTypeService {
	private ISecondTypeDAO secondTypeDAO;
	
	@Autowired
	public void setSecondTypeDAO(ISecondTypeDAO secondTypeDAO) {
		this.secondTypeDAO = secondTypeDAO;
	}

	public List<SecondTypeDTO> querySecondTypeById(Integer id) {
		return secondTypeDAO.querySecondTypeById(id);
	}

	public int getSecondTypeCount() {
		return secondTypeDAO.getSecondTypeCount();
	}

	public List<SecondTypeDTO> getSecondTypeByPage(Integer pageno) {
		return secondTypeDAO.getSecondTypeByPage(pageno);
	}

	public void addSecondType(SecondTypeDTO secondType) {
		secondTypeDAO.addSecondType(secondType);
	}

	public void updateSecondType(SecondTypeDTO secondType) {
		secondTypeDAO.updateSecondType(secondType);
	}

	public void deleteSecondType(Integer id) {
		secondTypeDAO.deleteSecondType(id);
	}

	@Override
	public SecondTypeDTO getSecondTypeBySecondTypeId(Integer id) {
		return secondTypeDAO.getSecondTypeBySecondTypeId(id);
	}

	@Override
	public List<SecondTypeDTO> getAllSecondType() {
		return secondTypeDAO.getAllSecondType();
	}

}
