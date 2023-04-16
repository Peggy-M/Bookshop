package com.bookshop.mongod.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.bookshop.mongod.dao.IMongoDao;
import com.bookshop.user.bean.UserRolePermDTO;
//@Repository
public class MongoDBDaoImpl implements IMongoDao{
	private MongoTemplate mongo;
	private static final String COLLECTION_NAME = "user";
	@Autowired
	public void setMongo(MongoTemplate mongo) {
		this.mongo = mongo;
	}


	@Override
	public void insert(UserRolePermDTO userRolePermDTO) {
		mongo.insert(userRolePermDTO, COLLECTION_NAME);
	}

	@Override
	public UserRolePermDTO findRoleAndPerm(String userNmae) {
		Query query = new Query(Criteria.where("userName").is(userNmae));
		return mongo.findOne(query, UserRolePermDTO.class,COLLECTION_NAME);
	}

}
