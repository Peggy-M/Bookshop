package com.bookshop.frontbook.service;

import java.util.List;

import com.bookshop.frontbook.bean.BookBean;
import com.bookshop.frontbook.bean.SecondTypeBean;
import com.bookshop.frontbook.bean.TypeBean;

public interface IFrontBookService {
	/**
	 * 通过id查书
	 * 
	 * @param id
	 * @return
	 */
	BookBean getBookByID(Integer id);
	
	/**
	 * 通过书名查书
	 * @param bookName
	 * @return
	 */
	BookBean getBookByName(String bookName);

	/**
	 * 通过作者查书
	 * 
	 * @param author
	 * @return
	 */
	List<BookBean> getBookByAuthor(String author,Integer pageNo);

	/**
	 * 通过出版社查书
	 * 
	 * @param press
	 * @return
	 */
	List<BookBean> getBookByPress(String press,Integer pageNo);

	/**
	 * 通过销量查询
	 * 
	 * @param sales
	 * @return
	 */
	List<BookBean> getBookBySales(Integer sales);

	/**
	 * 通过折扣查询
	 * 
	 * @param discount
	 * @return
	 */
	List<BookBean> getBookByDiscount(Integer discount);

	/**
	 * 通过出版时间查询
	 * 
	 * @param publishtime
	 * @return
	 */
	List<BookBean> getBookByPublishTime(String publishtime);

	/**
	 * 通过状态查询(0普通 1预收 2精选 3特惠 4畅销)
	 * 
	 * @param status
	 * @return
	 */
	List<BookBean> getBookByStatus(Integer status, Integer pageNo, Integer pageSize);

	/**
	 * 通过库存查询（只显示有货）
	 * 
	 * @param number
	 * @return
	 */
	List<BookBean> getBookByNumber(Integer number);
	
	/**
	 * 显示首页的书
	 * @param status
	 * @return
	 */
	List<BookBean> getHomeBook(Integer status);
	
	/**
	 * 查询同一状态的书的总数
	 * @param status
	 * @return
	 */
	Integer getCountByStatus(Integer status);
	
	/**
	 * 查询图书的分类
	 * @param typeFirstId
	 * @param typeSecondId
	 * @param typeThirdId
	 * @return
	 */
	TypeBean getBookType(Integer typeFirstId,Integer typeSecondId,Integer typeThirdId);
	
	/**
	 * 搜索功能
	 * @param name
	 * @return
	 */
	List<BookBean> search(String name);
		
	
	/**
	 * 查询一个作者的所有书的总数
	 * @param author
	 * @return
	 */
	Integer getCountByAuthor(String author);
	
	/**
	 * 查询一个出版社的所有书
	 * @param press
	 * @return
	 */
	Integer getCountByPress(String press);
	
	/**
	 * 查询三级分类图书
	 * @param typeNo
	 * @return
	 */
	List<BookBean> getBookByTypeThird(Integer typeNo,Integer pageNo);
	
	/**
	 * 查询二级分类图书
	 * @param typeNo
	 * @return
	 */
	List<BookBean> getBookByTypeSecond(Integer typeNo,Integer pageNo);
	
	/**
	 * 查询一级分类图书
	 * @param typeNo
	 * @return
	 */
	List<BookBean> getBookByTypeFirst(Integer typeNo,Integer pageNo);
	
	/**
	 * 查询一个三级分类的所有书
	 * @param typeNo
	 * @return
	 */
	Integer getCountByTypeThird(Integer typeNo);
	
	/**
	 * 查询一个二级分类的所有书
	 * @param typeNo
	 * @return
	 */
	Integer getCountByTypeSecond(Integer typeNo);

	/**
	 * 查询所有一级分类
	 * @return
	 */
	List<String> getTypeOneName();
	
	/**
	 * 查询所有二级分类
	 * @return
	 */
	List<SecondTypeBean> getTypeTwoName();
	
	/**
	 * 查询所有三级分类
	 * @return
	 */
	List<String> getTypeThreeName();
	
	/**
	 * 查询出版社
	 * @return
	 */
	List<String> getPress();
	
	/**
	 * 查询一级类目下的书名
	 * @return
	 */
	List<String> getBookNameByFirstType(Integer typeNo);
	
	/**
	 * 查询某个一级类目下的所有二级类目
	 * @return
	 */
	List<SecondTypeBean> getTypeSecondByTypeFirst(String typeName);
}
