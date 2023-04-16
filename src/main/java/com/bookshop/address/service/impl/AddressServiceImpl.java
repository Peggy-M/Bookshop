package com.bookshop.address.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.address.bean.AddressDTO;
import com.bookshop.address.dao.IAddressDAO;
import com.bookshop.address.service.IAddressService;
@Service
public class AddressServiceImpl implements IAddressService {
	private IAddressDAO addressDAO;
	@Autowired
	public void setAddressDAO(IAddressDAO addressDAO) {
		this.addressDAO = addressDAO;
	}

	@Override
	public int getUserAddressCount(Integer id) {
		return this.addressDAO.getUserAddressCount(id);
	}

	@Override
	public int getAddressCount() {
		return this.addressDAO.getAddressCount();
	}

	@Override
	public List<AddressDTO> getUserAddressByPage(Integer id, Integer pageno) {
		return this.addressDAO.getUserAddressByPage(id, pageno);
	}

	@Override
	public List<AddressDTO> getAddressByPage(Integer pageno) {
		return this.addressDAO.getAddressByPage(pageno);
	}

	@Override
	public void deleteAddress(Integer id) {
		this.addressDAO.deleteAddress(id);
	}

	@Override
	public void addAddress(AddressDTO addressDTO) {
		this.addressDAO.addAddress(addressDTO);
	}

	@Override
	public List<AddressDTO> getUserAddressByUserId(Integer id) {
		return this.addressDAO.getUserAddressByUserId(id);
	}

	@Override
	public AddressDTO queryAddressById(Integer id) {
		return addressDAO.queryAddressById(id);
	}

	@Override
	public void updateCartOrderNumberAndStatus(String orderNumber,Integer cartId) {
		addressDAO.updateCartOrderNumberAndStatus(orderNumber,cartId);
	}

	@Override
	public void updateAddress(AddressDTO address) {
		addressDAO.updateAddress(address);
	}

}
