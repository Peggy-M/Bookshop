package com.bookshop.frontbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.frontbook.bean.BookBean;
import com.bookshop.frontbook.bean.SecondTypeBean;
import com.bookshop.frontbook.bean.TypeBean;
import com.bookshop.frontbook.dao.IFrontBookDao;
import com.bookshop.frontbook.service.IFrontBookService;

@Service
public class FrontBookServiceImpl implements IFrontBookService{
	private IFrontBookDao bookdao;

	@Autowired
	public void setBookdao(IFrontBookDao bookdao) {
		this.bookdao = bookdao;
	}

	@Override
	public BookBean getBookByID(Integer id) {
		
		return bookdao.getBookByID(id);
	}
	
	@Override
	public BookBean getBookByName(String bookName) {
		
		return bookdao.getBookByName(bookName);
	}

	@Override
	public List<BookBean> getBookByAuthor(String author,Integer pageNo) {
		
		return bookdao.getBookByAuthor(author,pageNo);
	}

	@Override
	public List<BookBean> getBookByPress(String press,Integer pageNo) {
	
		return bookdao.getBookByPress(press,pageNo);
	}

	@Override
	public List<BookBean> getBookBySales(Integer sales) {
	
		return bookdao.getBookBySales(sales);
	}

	@Override
	public List<BookBean> getBookByDiscount(Integer discount) {
		
		return bookdao.getBookByDiscount(discount);
	}

	@Override
	public List<BookBean> getBookByPublishTime(String publishtime) {
		
		return bookdao.getBookByPublishTime(publishtime);
	}

	@Override
	public List<BookBean> getBookByStatus(Integer status, Integer pageNo, Integer pageSize) {
		
		return bookdao.getBookByStatus(status, pageNo, pageSize);
	}

	@Override
	public List<BookBean> getBookByNumber(Integer number) {
		
		return bookdao.getBookByNumber(number);
	}

	@Override
	public List<BookBean> getHomeBook(Integer status) {
		
		return bookdao.getHomeBook(status);
	}

	@Override
	public Integer getCountByStatus(Integer status) {
		
		return bookdao.getbookcount(status);
	}

	@Override
	public TypeBean getBookType(Integer typeFirstId, Integer typeSecondId, Integer typeThirdId) {
		
		return bookdao.getbooktype(typeFirstId, typeSecondId, typeThirdId);
	}

	@Override
	public List<BookBean> search(String name) {
		
		return bookdao.search(name);
	}

	@Override
	public Integer getCountByAuthor(String author) {
		return bookdao.getCountByAuthor(author);
	}
	
	@Override
	public Integer getCountByPress(String press) {
		return bookdao.getCountByPress(press);
	}



	@Override
	public List<BookBean> getBookByTypeThird(Integer typeNo,Integer pageNo) {
		return bookdao.getBookByBookTypeThird(typeNo,pageNo);
	}

	@Override
	public List<BookBean> getBookByTypeSecond(Integer typeNo,Integer pageNo) {
		return bookdao.getBookByBookTypeSecond(typeNo, pageNo);
	}
	
	@Override
	public List<BookBean> getBookByTypeFirst(Integer typeNo,Integer pageNo) {
		return bookdao.getBookByBookTypeFirst(typeNo, pageNo);
	}

	@Override
	public Integer getCountByTypeThird(Integer typeNo) {
		return bookdao.getCountByTypeThird(typeNo);
	}

	@Override
	public Integer getCountByTypeSecond(Integer typeNo) {
		return bookdao.getCountByTypeSecond(typeNo);
	}

	@Override
	public List<String> getTypeOneName() {
		return bookdao.getTypeOneName();
	}

	@Override
	public List<SecondTypeBean> getTypeTwoName() {
		return bookdao.getTypeTwoName();
	}

	@Override
	public List<String> getTypeThreeName() {
		return bookdao.getTypeThreeName();
	}

	@Override
	public List<String> getPress() {
		return bookdao.getpress();
	}

	@Override
	public List<String> getBookNameByFirstType(Integer typeNo) {
		return bookdao.getBookNameByFirstType(typeNo);
	}

	@Override
	public List<SecondTypeBean> getTypeSecondByTypeFirst(String typeName) {
		return bookdao.getTypeSecondByTypeFirst(typeName);
	}

	

}
