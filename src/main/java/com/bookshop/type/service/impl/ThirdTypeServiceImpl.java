package com.bookshop.type.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.type.bean.ThirdTypeDTO;
import com.bookshop.type.dao.IThirdTypeDAO;
import com.bookshop.type.service.IThirdTypeService;
@Service
public class ThirdTypeServiceImpl implements IThirdTypeService {
	private IThirdTypeDAO thirdTypeDAO;
	
	@Autowired
	public void setThirdTypeDAO(IThirdTypeDAO thirdTypeDAO) {
		this.thirdTypeDAO = thirdTypeDAO;
	}

	@Override
	public List<ThirdTypeDTO> queryThirdTypeById(Integer id) {
		return thirdTypeDAO.queryThirdTypeById(id);
	}

	@Override
	public int getThirdTypeCount() {
		return thirdTypeDAO.getThirdTypeCount();
	}

	@Override
	public List<ThirdTypeDTO> getThirdTypeByPage(Integer pageno) {
		return thirdTypeDAO.getThirdTypeByPage(pageno);
	}

	@Override
	public void addThirdType(ThirdTypeDTO thirdType) {
		thirdTypeDAO.addThirdType(thirdType);
	}

	@Override
	public void updateThirdType(ThirdTypeDTO thirdType) {
		thirdTypeDAO.updateThirdType(thirdType);
	}

	@Override
	public void deleteThirdType(Integer id) {
		thirdTypeDAO.deleteThirdType(id);
	}

	@Override
	public ThirdTypeDTO getThirdTypeByThirdId(Integer id) {
		return this.thirdTypeDAO.getThirdTypeByThirdId(id);
	}

}
