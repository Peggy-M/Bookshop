package com.bookshop.book.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.bookshop.book.bean.BookBean;
import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;

public interface IBookService {
	/**
	 * @return
	 * 查询所有图书列表
	 */
	List<BookBean> getBookList(Integer pageno);
	/**
	 * @return
	 * 图书不同状态数量
	 */
	Integer getBookStatusCount(Integer status);
	/**
	 * @param bookBean
	 * 添加图书
	 */
	void insertBook(MultipartFile bookCover1,BookBean bookBean,HttpServletRequest request);
	/**
	 * @return
	 * 获取图书总数
	 */
	Integer getCount();
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
	 * 将图书状态置为预售
	 */
	void updateStatus1(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为精选
	 */
	void updateStatus2(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为特惠
	 */
	void updateStatus3(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为畅销
	 */
	void updateStatus4(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为下架
	 */
	void updateStatus5(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为网购爆品
	 */
	void updateStatus6(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为热卖图书
	 */
	void updateStatus7(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为限时抢购
	 */
	void updateStatus8(BookBean bookBean);
	/**
	 * @param bookBean
	 * 将图书状态置为热评商品
	 */
	void updateStatus9(BookBean bookBean);
	
	/**
	 * @param id
	 * @return
	 * 根据id查询图书信息
	 */
	BookBean selectBookById(Integer id);

	/**
	 * @param bookCover1
	 * @param bookBean
	 * @param request
	 */
	void updateBook(Integer id,MultipartFile bookCover1,BookBean bookBean,HttpServletRequest request);
	/**
	 * @param pageno
	 * @return
	 * 普通图书列表
	 */
	List<BookBean> getBookStatu0(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 预售图书列表
	 */
	List<BookBean> getBookStatu1(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 精选图书列表
	 */
	List<BookBean> getBookStatu2(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 特惠图书列表
	 */
	List<BookBean> getBookStatu3(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 畅销图书列表
	 */
	List<BookBean> getBookStatu4(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 下架图书列表
	 */
	List<BookBean> getBookStatu5(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 网购爆品图书列表
	 */
	List<BookBean> getBookStatu6(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 热卖图书列表
	 */
	List<BookBean> getBookStatu7(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 限时抢购列表
	 */
	List<BookBean> getBookStatu8(Integer pageno);
	/**
	 * @param pageno
	 * @return
	 * 热评商品列表
	 */
	List<BookBean> getBookStatu9(Integer pageno);
	
}
