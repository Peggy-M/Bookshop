package com.bookshop.mongod.dao;

import com.bookshop.user.bean.UserRolePermDTO;

public interface IMongoDao {
	/**
	 * @param userRolePermDTO
	 * 写入mongodb
	 */
	void insert(UserRolePermDTO userRolePermDTO);
	
	/**
	 * @param userNmae
	 * @return
	 * 根据姓名查询权限和角色
	 */
	UserRolePermDTO findRoleAndPerm(String userNmae);
}
