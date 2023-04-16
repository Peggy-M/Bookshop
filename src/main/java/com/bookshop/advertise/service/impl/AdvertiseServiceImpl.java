package com.bookshop.advertise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.advertise.bean.AdvertiseDTO;
import com.bookshop.advertise.dao.IAdvertiseDAO;
import com.bookshop.advertise.service.IAdvertiseService;
@Service
public class AdvertiseServiceImpl implements IAdvertiseService {
	private IAdvertiseDAO advertiseDAO;
	@Autowired
	public void setAdvertiseDAO(IAdvertiseDAO advertiseDAO) {
		this.advertiseDAO = advertiseDAO;
	}

	@Override
	public AdvertiseDTO queryAdvertiseById(Integer id) {
		return advertiseDAO.queryAdvertiseById(id);
	}

	@Override
	public List<AdvertiseDTO> queryAdvertiseListByPage(Integer pageno) {
		return advertiseDAO.queryAdvertiseListByPage(pageno);
	}

	@Override
	public int queryAdvertiseCount() {
		return advertiseDAO.queryAdvertiseCount();
	}

	@Override
	public void addAdvertise(AdvertiseDTO advertise) {
		advertiseDAO.addAdvertise(advertise);
	}

	@Override
	public void updateAdvertise(AdvertiseDTO advertise) {
		advertiseDAO.updateAdvertise(advertise);
	}

	@Override
	public void deleteAdvertise(Integer id) {
		advertiseDAO.deleteAdvertise(id);
	}

}
