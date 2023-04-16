package com.bookshop.frontbook.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.frontbook.bean.BookBean;
import com.bookshop.frontbook.bean.SecondTypeBean;
import com.bookshop.frontbook.bean.TypeBean;
import com.bookshop.frontbook.dao.IFrontBookDao;

@Repository
public class FrontBookDaoImpl extends SqlSessionDaoSupport implements IFrontBookDao {
	
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
	
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public BookBean getBookByID(Integer id) {

		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectByID", id);
	}
	
	@Override
	public BookBean getBookByName(String bookName) {
		
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectByName", bookName);
	}

	@Override
	public List<BookBean> getBookByAuthor(String author,Integer pageNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("author", author);
		map.put("pageNo", pageNo);
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByAuthor", map);
	}

	@Override
	public List<BookBean> getBookByPress(String press,Integer pageNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("press", press);
		map.put("pageNo", pageNo);
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByPress", map);
	}

	@Override
	public List<BookBean> getBookBySales(Integer sales) {
		
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectBySales", sales);
	}

	@Override
	public List<BookBean> getBookByDiscount(Integer discount) {
		
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByDiscount", discount);
	}

	@Override
	public List<BookBean> getBookByPublishTime(String publishtime) {
		
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByPublishTime", publishtime);
	}

	@Override
	public List<BookBean> getBookByStatus(Integer status,Integer pageNo,Integer pageSize) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bookStatus", status);
		map.put("pageNo", pageNo);
		map.put("pageSize", pageSize);	
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByStatus", map);
	}

	@Override
	public List<BookBean> getBookByNumber(Integer number) {
		
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByNumber", number);
	}

	@Override
	public List<BookBean> getHomeBook(Integer status) {
		
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectHomeByStatus", status);
	}

	@Override
	public Integer getbookcount(Integer status) {
		
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectCountByCount", status);
	}

	@Override
	public TypeBean getbooktype(Integer typeFirstId, Integer typeSecondId, Integer typeThirdId) {
		String typename1 = this.getSqlSession().selectOne("com.bookshop.frontbook.bean.TypeBeanMapper.selectFirst", typeFirstId);
		String typename2 = this.getSqlSession().selectOne("com.bookshop.frontbook.bean.TypeBeanMapper.selectSecond", typeSecondId);
		String typename3 = this.getSqlSession().selectOne("com.bookshop.frontbook.bean.TypeBeanMapper.selectThird", typeThirdId);
		TypeBean type = new TypeBean();
		type.setTypeFirst(typename1);
		type.setTypeSecond(typename2);
		type.setTypeThird(typename3);
		return type;
		
	}

	@Override
	public List<BookBean> search(String name) {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.search", name);
	}

	@Override
	public Integer getCountByAuthor(String author) {
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectCountByAuthor", author);
	}

	@Override
	public Integer getCountByPress(String press) {
		
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectCountByPress", press);
	}

	@Override
	public List<BookBean> getBookByBookTypeThird(Integer typeNo,Integer pageNo) {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByBookTypeThird", typeNo);
	}

	@Override
	public List<BookBean> getBookByBookTypeSecond(Integer typeNo,Integer pageNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("typeNo", typeNo);
		map.put("pageNo", pageNo);
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByBookTypeSecond", map);
	}
	
	@Override
	public List<BookBean> getBookByBookTypeFirst(Integer typeNo,Integer pageNo) {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectByBookTypeFirst", typeNo);
	}

	@Override
	public Integer getCountByTypeThird(Integer typeNo) {
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectCountByTypeThird", typeNo);
	}

	@Override
	public Integer getCountByTypeSecond(Integer typeNo) {
		return this.getSqlSession().selectOne("com.bookshop.frontbook.bean.BookBeanMapper.selectCountByTypeSecond",typeNo);
	}

	@Override
	public List<String> getTypeOneName() {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectTypeFirst");
	}

	@Override
	public List<SecondTypeBean> getTypeTwoName() {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.TypeBeanMapper.selectTypeSecond");
	}

	@Override
	public List<String> getTypeThreeName() {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.TypeBeanMapper.selectTypeThird");
	}

	@Override
	public List<String> getpress() {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectPress");
	}

	@Override
	public List<String> getBookNameByFirstType(Integer typeNo) {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectBookNameByFirstType", typeNo);
	}

	@Override
	public List<SecondTypeBean> getTypeSecondByTypeFirst(String typeName) {
		return this.getSqlSession().selectList("com.bookshop.frontbook.bean.BookBeanMapper.selectTypeSecondByTypeFirst", typeName);
	}

	

	


}
