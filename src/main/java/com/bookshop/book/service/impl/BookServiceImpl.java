package com.bookshop.book.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.book.bean.BookBean;
import com.bookshop.book.dao.IBookDao;
import com.bookshop.book.service.IBookService;
import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;
@Service
public class BookServiceImpl implements IBookService {
	private IBookDao bookDao;
	@Autowired
	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}
	
	@Override
	public List<BookBean> getBookList(Integer pageno) {
		return bookDao.getBookList(pageno);
	}
	
	@Override
	public List<BookBean> getBookStatu0(Integer pageno) {
		return bookDao.getBookStatus0List(pageno);
	}
	
	public List<BookBean> getBookStatu1(Integer pageno){
		return bookDao.getBookStatus1List(pageno);
	}
	public List<BookBean> getBookStatu2(Integer pageno){
		return bookDao.getBookStatus2List(pageno);
	}
	public List<BookBean> getBookStatu3(Integer pageno){
		return bookDao.getBookStatus3List(pageno);
	}
	public List<BookBean> getBookStatu4(Integer pageno){
		return bookDao.getBookStatus4List(pageno);
	}
	@Override
	public List<BookBean> getBookStatu6(Integer pageno) {
		return bookDao.getBookStatus6List(pageno);
	}

	@Override
	public List<BookBean> getBookStatu7(Integer pageno) {
		return bookDao.getBookStatus7List(pageno);
	}

	@Override
	public List<BookBean> getBookStatu8(Integer pageno) {
		return bookDao.getBookStatus8List(pageno);
	}

	@Override
	public List<BookBean> getBookStatu9(Integer pageno) {
		return bookDao.getBookStatus9List(pageno);
	}
	

	@Override
	public List<BookBean> getBookStatu5(Integer pageno) {
		return bookDao.getBookStatus5List(pageno);
	}
	
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void insertBook(MultipartFile bookCover1,BookBean bookBean,HttpServletRequest request) {
		String filename = bookCover1.getOriginalFilename();
		String localDir = request.getServletContext().getRealPath("/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		//本地绝对路径
		String locationUploadDir = localDir+"upload"+File.separator+date;
		File localFilePath = new File(locationUploadDir);
		if (!localFilePath.exists()) {
			localFilePath.mkdirs();
		}
		//数据库路径
		String bookImagePath = "/upload/"+date+"/"+filename;
		
		//本地文件路径
		String filePath = locationUploadDir+File.separator+filename;
		
		
		File localfile = new File(filePath);
		try {
			bookCover1.transferTo(localfile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bookBean.setBookCover(bookImagePath);
		Date date1 = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date1);
		bookBean.setBookPrimeDate(time);
		bookDao.insertBook(bookBean);
	}
	public Integer getCount(){
		return bookDao.getBookCount();
	}
	@Override
	public List<FirstTypeDTO> getFirstList() {
		return bookDao.getFirstList();
	}
	@Override
	public SecondTypeDTO getSecond(Integer id) {
		return bookDao.getSecond(id);
	}
	@Override
	public ThirdTypeDTO getThird(Integer id) {
		return bookDao.getThird(id);
	}
	@Override
	public FirstTypeDTO getFirstIdByName(String name) {
		return bookDao.getFirstIdByName(name);
	}
	@Override
	public SecondTypeDTO getSecondIdByName(String name) {
		return bookDao.getSecondIdByName(name);
	}
	@Override
	public ThirdTypeDTO getThirdIdByName(String name) {
		return bookDao.getThirdIdByName(name);
	}
	@Override
	public void deleteBook(Integer id){
		bookDao.deleteBook(id);
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus1(BookBean bookBean) {
		if(bookBean.getBookStatus()!=1){
			bookBean.setBookStatus(1);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus2(BookBean bookBean) {
		if(bookBean.getBookStatus()!=2){
			bookBean.setBookStatus(2);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus3(BookBean bookBean) {
		if(bookBean.getBookStatus()!=3){
			bookBean.setBookStatus(3);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus4(BookBean bookBean) {
		if(bookBean.getBookStatus()!=4){
			bookBean.setBookStatus(4);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus5(BookBean bookBean) {
		if(bookBean.getBookStatus()!=5){
			bookBean.setBookStatus(5);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	@Override
	public Integer getBookStatusCount(Integer status) {
		return bookDao.getBookStatusCount(status);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus6(BookBean bookBean) {
		if(bookBean.getBookStatus()!=6){
			bookBean.setBookStatus(6);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus7(BookBean bookBean) {
		if(bookBean.getBookStatus()!=7){
			bookBean.setBookStatus(7);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus8(BookBean bookBean) {
		if(bookBean.getBookStatus()!=8){
			bookBean.setBookStatus(8);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}

	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateStatus9(BookBean bookBean) {
		if(bookBean.getBookStatus()!=9){
			bookBean.setBookStatus(9);
		}else{
			bookBean.setBookStatus(0);
		}
		bookDao.updateStatus(bookBean);
	}
	public BookBean selectBookById(Integer id){
		return bookDao.selectBookById(id);
	}
	@Override
	public List<SecondTypeDTO> getSecondList() {
		return bookDao.getSecondList();
	}
	@Override
	public List<ThirdTypeDTO> getThirdList() {
		return bookDao.getThirdList();
	}
	@Override
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateBook(Integer id,MultipartFile bookCover1,BookBean bookBean,HttpServletRequest request) {
		String filename = bookCover1.getOriginalFilename();
		String localDir = request.getServletContext().getRealPath("/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		//本地绝对路径
		String locationUploadDir = localDir+"upload"+File.separator+date;
		File localFilePath = new File(locationUploadDir);
		if (!localFilePath.exists()) {
			localFilePath.mkdirs();
		}
		//数据库路径
		String bookImagePath = "/upload/"+date+"/"+filename;
		
		//本地文件路径
		String filePath = locationUploadDir+File.separator+filename;
		
		
		File localfile = new File(filePath);
		if(null!=filename&&filename!=""){
			try {
				bookCover1.transferTo(localfile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			bookBean.setBookCover(bookImagePath);
		}else{
			BookBean bean = bookDao.selectBookById(id);
			bookBean.setBookCover(bean.getBookCover());
		}
		Date date1 = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date1);
		bookBean.setBookPrimeDate(time);
		bookDao.updateBook(bookBean);
	}
}
