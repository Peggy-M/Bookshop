package com.bookshop.book.dao;

import java.util.List;

import com.bookshop.book.bean.BookBean;
import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;

/**
 * @author ganlisi
 *图书的查询、修改、删除、新增
 */
public interface IBookDao {
	/**
	 * @return
	 * 获取图书列表
	 */
	List<BookBean> getBookList(Integer pageno);
	/**
	 * @return
	 * 获取普通图书列表
	 */
	List<BookBean> getBookStatus0List(Integer pageno);
	/**
	 * @return
	 * 获取预售图书列表
	 */
	List<BookBean> getBookStatus1List(Integer pageno);
	/**
	 * @return
	 * 获取精选图书列表
	 */
	List<BookBean> getBookStatus2List(Integer pageno);
	/**
	 * @return
	 * 获取特惠图书列表
	 */
	List<BookBean> getBookStatus3List(Integer pageno);
	/**
	 * @return
	 * 获取畅销图书列表
	 */
	List<BookBean> getBookStatus4List(Integer pageno);
	/**
	 * @return
	 * 获取下架图书列表
	 */
	List<BookBean> getBookStatus5List(Integer pageno);
	/**
	 * @return
	 * 获取网购爆品图书列表
	 */
	List<BookBean> getBookStatus6List(Integer pageno);
	/**
	 * @return
	 * 获取热卖图书图书列表
	 */
	List<BookBean> getBookStatus7List(Integer pageno);
	/**
	 * @return
	 * 获取限时抢购列表
	 */
	List<BookBean> getBookStatus8List(Integer pageno);
	/**
	 * @return
	 * 获取热评商品列表
	 */
	List<BookBean> getBookStatus9List(Integer pageno);
	/**
	 * @return
	 * 图书不同状态数量
	 */
	Integer getBookStatusCount(Integer status);
	/**
	 * @param bookBean
	 * 添加图书
	 */
	void insertBook(BookBean bookBean);
	/**
	 * @return
	 * 图书总数
	 */
	Integer getBookCount();
	/**
	 * @return
	 * 获取一级类目列表
	 */
	List<FirstTypeDTO> getFirstList();
	/**
	 * @return
	 * 获取二级类目
	 */
	SecondTypeDTO getSecond(Integer id);
	/**
	 * @return
	 * 获取三级类目
	 */
	ThirdTypeDTO getThird(Integer id);
	/**
	 * @return
	 * 获取二级类目列表
	 */
	List<SecondTypeDTO> getSecondList();
	/**
	 * @return
	 * 获取三级类目列表
	 */
	List<ThirdTypeDTO> getThirdList();
	/**
	 * @param name
	 * @return
	 * 根据一级类目名查询id
	 */
	FirstTypeDTO getFirstIdByName(String name);
	/**
	 * @param name
	 * @return
	 * 根据二级类目名查询id
	 */
	SecondTypeDTO getSecondIdByName(String name);
	/**
	 * @param name
	 * @return
	 * 根据三级类目名查询id
	 */
	ThirdTypeDTO getThirdIdByName(String name);
	
	/**
	 * @param id
	 * 删除图书
	 */
	void deleteBook(Integer id);
	
	/**
	 * @param bookBean
	 * 更新图书状态
	 */
	void updateStatus(BookBean bookBean);
	
	/**
	 * @param id
	 * @return
	 * 根据id查询图书信息
	 */
	BookBean selectBookById(Integer id);
	
	/**
	 * @param bean
	 * 修改图书信息
	 */
	void updateBook(BookBean bean);
}
