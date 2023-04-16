package com.bookshop.book.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.book.bean.BookBean;
import com.bookshop.book.dao.IBookDao;
import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;
@Repository
public class BookDaoImpl extends SqlSessionDaoSupport implements IBookDao{
	
	@Override
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public List<BookBean> getBookList(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookList",pageno);
	}
	@Override
	public List<BookBean> getBookStatus0List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus0List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus1List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus1List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus2List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus2List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus3List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus3List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus4List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus4List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus5List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus5List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus6List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus6List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus7List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus7List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus8List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus8List", pageno);
	}
	@Override
	public List<BookBean> getBookStatus9List(Integer pageno) {
		return this.getSqlSession().selectList("com.bookshop.book.bean.BookBeanMapper.selectBookStatus9List", pageno);
	}
	@Override
	public Integer getBookStatusCount(Integer status) {
		return this.getSqlSession().selectOne("com.bookshop.book.bean.BookBeanMapper.getBookStatusCount",status);
	}
	
	@Override
	public void insertBook(BookBean bookBean) {
		this.getSqlSession().insert("com.bookshop.book.bean.BookBeanMapper.insertBook", bookBean);
	}
	@Override
	public List<FirstTypeDTO> getFirstList() {
		return this.getSqlSession().selectList("com.bookshop.type.bean.firstTypeMapper.selectFirstList");
	}
	@Override
	public SecondTypeDTO getSecond(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.secondTypeMapper.selectSecond",id);
	}
	@Override
	public ThirdTypeDTO getThird(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.thirdTypeMapper.selectThird",id);
	}
	@Override
	public FirstTypeDTO getFirstIdByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.firstTypeMapper.selectIdByName", name);
	}
	@Override
	public SecondTypeDTO getSecondIdByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.secondTypeMapper.selectSecondIdByName", name);
	}
	@Override
	public ThirdTypeDTO getThirdIdByName(String name) {
		return this.getSqlSession().selectOne("com.bookshop.type.bean.thirdTypeMapper.selectThirdIdByName", name);
	}
	@Override
	public Integer getBookCount() {
		return this.getSqlSession().selectOne("com.bookshop.book.bean.BookBeanMapper.getBookCount");
	}
	@Override
	public void deleteBook(Integer id) {
		this.getSqlSession().delete("com.bookshop.book.bean.BookBeanMapper.deleteBook", id);
	}
	@Override
	public void updateStatus(BookBean bookBean) {
		this.getSqlSession().update("com.bookshop.book.bean.BookBeanMapper.updateStatus",bookBean);
	}
	@Override
	public BookBean selectBookById(Integer id) {
		return this.getSqlSession().selectOne("com.bookshop.book.bean.BookBeanMapper.selectBookById", id);
	}
	@Override
	public List<SecondTypeDTO> getSecondList() {
		return this.getSqlSession().selectList("com.bookshop.type.bean.secondTypeMapper.selectSecondList");
	}
	@Override                                  
	public List<ThirdTypeDTO> getThirdList() {
		return this.getSqlSession().selectList("com.bookshop.type.bean.thirdTypeMapper.selectThirdList");
	}
	@Override
	public void updateBook(BookBean bean) {
		this.getSqlSession().update("com.bookshop.book.bean.BookBeanMapper.updateBook", bean);
	}
	
}
