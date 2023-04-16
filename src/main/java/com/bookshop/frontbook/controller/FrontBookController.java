package com.bookshop.frontbook.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.frontbook.bean.BookBean;
import com.bookshop.frontbook.bean.SecondTypeBean;
import com.bookshop.frontbook.bean.Type2aboutType1Bean;
import com.bookshop.frontbook.bean.TypeBean;
import com.bookshop.frontbook.service.IFrontBookService;

@Controller
@RequestMapping("/frontbook")
public class FrontBookController {

	@Autowired
	private IFrontBookService bookService;
	
	@Autowired
	public void setBookService(IFrontBookService bookService) {
		this.bookService = bookService;
	}
	
	
	
	/**
	 * 通过ID查看一本书的详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/Product")
	public String queryBookByID(Integer id,Model model){
		BookBean book = bookService.getBookByID(id);
		model.addAttribute("book", book);
		TypeBean type = bookService.getBookType(book.getBookTypeFirst(),book.getBookTypeSecond(),book.getBookTypeThird());
		model.addAttribute("type", type);
		return "front/product";
	}
	
	/**
	 * 通过书名查看一本书的详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/ProductByName")
	public String queryBookByID(String bookName,Model model){
		BookBean book = bookService.getBookByName(bookName);
		model.addAttribute("book", book);
		TypeBean type = bookService.getBookType(book.getBookTypeFirst(),book.getBookTypeSecond(),book.getBookTypeThird());
		model.addAttribute("type", type);
		return "front/product";
	}
	
	/**
	 * 首页图书展示
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping("/home")
	public String queryBookByStatus(Integer status,Model model){
		List<BookBean> boomlist = bookService.getHomeBook(6);
		List<BookBean> limitlist = bookService.getHomeBook(8);
		List<BookBean> hotlist = bookService.getHomeBook(9);
		List<BookBean> list2 = bookService.getHomeBook(2);
		List<BookBean> list3 = bookService.getHomeBook(3);
		List<BookBean> list4 = bookService.getHomeBook(4);
		model.addAttribute("boomlist", boomlist);
		model.addAttribute("limitbooks", limitlist);
		model.addAttribute("hotbooks", hotlist);
		model.addAttribute("books3", list3);
		model.addAttribute("books4", list4);
		model.addAttribute("books2", list2);
		List<BookBean> list6 = bookService.getBookByTypeFirst(17, 0);
		List<BookBean> list7 = bookService.getBookByTypeFirst(21, 0);
		List<BookBean> list8 = bookService.getBookByTypeFirst(22, 0);
		List<BookBean> list9 = bookService.getBookByTypeFirst(24, 0);
		List<BookBean> list10 = bookService.getBookByTypeFirst(25, 0);
		List<String> presslist = bookService.getPress();
		List<String> list22 = bookService.getBookNameByFirstType(22);
		List<String> list21 = bookService.getBookNameByFirstType(21);
		List<String> list20 = bookService.getBookNameByFirstType(20);
		List<String> list18 = bookService.getBookNameByFirstType(18);
		List<String> list17 = bookService.getBookNameByFirstType(17);
		List<String> list16 = bookService.getBookNameByFirstType(16);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);
		model.addAttribute("list10", list10);
		model.addAttribute("list22", list22);
		model.addAttribute("list21", list21);
		model.addAttribute("list20", list20);
		model.addAttribute("list18", list18);
		model.addAttribute("list17", list17);
		model.addAttribute("list16", list16);
		model.addAttribute("presslist", presslist);
		List<String> typeOneList = bookService.getTypeOneName();
		List<Type2aboutType1Bean> type2aboutType1Beanlist = new ArrayList<>();
		for (String typeName : typeOneList) {
			List<SecondTypeBean> typeSecondList = bookService.getTypeSecondByTypeFirst(typeName);
			Type2aboutType1Bean type2aboutType1Bean = new Type2aboutType1Bean();
			type2aboutType1Bean.setSecondtype(typeSecondList);
			type2aboutType1Bean.setTypeoneName(typeName);
			type2aboutType1Beanlist.add(type2aboutType1Bean);
		}
		model.addAttribute("type2aboutType1Beanlist", type2aboutType1Beanlist);
		return "front/home";	
	}
	
	/**
	 * 新书预售
	 * @param status
	 * @param pageNo
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/Special")
	public String queryPresaleBook(Integer status,Integer pageNo,Integer pageSize, Model model){
		if(pageNo==null){
			pageNo=1;
		}
		model.addAttribute("pageNo", pageNo);
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByStatus(status, pageNo, pageSize);
		model.addAttribute("books",list);
		int count = bookService.getCountByStatus(status);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		List<String> typeOneList = bookService.getTypeOneName();
		List<Type2aboutType1Bean> type2aboutType1Beanlist = new ArrayList<>();
		for (String typeName : typeOneList) {
			List<SecondTypeBean> typeSecondList = bookService.getTypeSecondByTypeFirst(typeName);
			Type2aboutType1Bean type2aboutType1Bean = new Type2aboutType1Bean();
			type2aboutType1Bean.setSecondtype(typeSecondList);
			type2aboutType1Bean.setTypeoneName(typeName);
			type2aboutType1Beanlist.add(type2aboutType1Bean);
		}
		model.addAttribute("type2aboutType1Beanlist", type2aboutType1Beanlist);
		return "front/presale";
	}
	
	
	/**
	 * 新书精选
	 * @param status
	 * @param pageNo
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/HotNewBooks")
	public String queryNewBook(Integer status,Integer pageNo,Integer pageSize, Model model){
		if(pageNo==null){
			pageNo=1;
		}
		model.addAttribute("pageNo", pageNo);
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByStatus(status, pageNo, pageSize);
		model.addAttribute("books",list);
		List<SecondTypeBean> tlist = bookService.getTypeTwoName();
		model.addAttribute("tlist", tlist);
		int count = bookService.getCountByStatus(status);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);
		List<String> typeOneList = bookService.getTypeOneName();
		List<Type2aboutType1Bean> type2aboutType1Beanlist = new ArrayList<>();
		for (String typeName : typeOneList) {
			List<SecondTypeBean> typeSecondList = bookService.getTypeSecondByTypeFirst(typeName);
			Type2aboutType1Bean type2aboutType1Bean = new Type2aboutType1Bean();
			type2aboutType1Bean.setSecondtype(typeSecondList);
			type2aboutType1Bean.setTypeoneName(typeName);
			type2aboutType1Beanlist.add(type2aboutType1Bean);
		}
		model.addAttribute("type2aboutType1Beanlist", type2aboutType1Beanlist);
		return "front/HotNewBooks";
	}
	
	/**
	 * 特惠图书
	 * @param status
	 * @param pageNo
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/ProductList")
	public String queryCountBook(Integer status,Integer pageNo,Integer pageSize, Model model){
		if(pageNo==null){
			pageNo=1;
		}
		model.addAttribute("pageNo", pageNo);
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByStatus(status, pageNo, pageSize);
		model.addAttribute("books",list);
		List<SecondTypeBean> tlist = bookService.getTypeTwoName();
		model.addAttribute("tlist", tlist);
		int count = bookService.getCountByStatus(status);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		List<String> typeOneList = bookService.getTypeOneName();
		List<Type2aboutType1Bean> type2aboutType1Beanlist = new ArrayList<>();
		for (String typeName : typeOneList) {
			List<SecondTypeBean> typeSecondList = bookService.getTypeSecondByTypeFirst(typeName);
			Type2aboutType1Bean type2aboutType1Bean = new Type2aboutType1Bean();
			type2aboutType1Bean.setSecondtype(typeSecondList);
			type2aboutType1Bean.setTypeoneName(typeName);
			type2aboutType1Beanlist.add(type2aboutType1Bean);
		}
		model.addAttribute("type2aboutType1Beanlist", type2aboutType1Beanlist);
		return "front/SpecialBooks";
	}
	
	/**
	 * 畅销图书
	 * @param status
	 * @param pageNo
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/TopIndex")
	public String queryTopBooks(Integer status,Integer pageNo,Integer pageSize, Model model){
		if(pageNo==null){
			pageNo=1;
		}
		model.addAttribute("pageNo", pageNo);
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByStatus(status, pageNo, pageSize);
		model.addAttribute("books",list);
		List<SecondTypeBean> tlist = bookService.getTypeTwoName();
		model.addAttribute("tlist", tlist);
		int count = bookService.getCountByStatus(status);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		List<String> typeOneList = bookService.getTypeOneName();
		List<Type2aboutType1Bean> type2aboutType1Beanlist = new ArrayList<>();
		for (String typeName : typeOneList) {
			List<SecondTypeBean> typeSecondList = bookService.getTypeSecondByTypeFirst(typeName);
			Type2aboutType1Bean type2aboutType1Bean = new Type2aboutType1Bean();
			type2aboutType1Bean.setSecondtype(typeSecondList);
			type2aboutType1Bean.setTypeoneName(typeName);
			type2aboutType1Beanlist.add(type2aboutType1Bean);
		}
		model.addAttribute("type2aboutType1Beanlist", type2aboutType1Beanlist);
		return "front/TopBooks";
	}
	
	/**
	 * 搜索功能
	 * @return
	 */
	@RequestMapping("/Search")
	public String search(String topKeywords,Model model){
		List<BookBean> list = bookService.search(topKeywords);
		model.addAttribute("books", list);
		return "front/presale";	
	}
	
	/**
	 * 通过作者查询书
	 * @param author
	 * @param model
	 * @return
	 */
	@RequestMapping("/QueryByAuthor")
	public String queryBookByAuthor(String author,Integer pageNo,Model model){
		if(pageNo == null){
			pageNo = 1;
		}
		model.addAttribute("pageNo", pageNo);
		int pageSize = 10;
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByAuthor(author, pageNo);
		model.addAttribute("books",list);
		int count = bookService.getCountByAuthor(author);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		return "front/SpecialBooks";
		
	}
	
	/**
	 * 通过出版社查书
	 * @param author
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryByPress")
	public String queryBookByPress(String press,Integer pageNo,Model model){
		if(pageNo == null){
			pageNo = 1;
		}
		model.addAttribute("pageNo", pageNo);
		int pageSize = 20;
		pageNo = (pageNo-1)*pageSize;
		List<BookBean> list = bookService.getBookByPress(press, pageNo);
		model.addAttribute("books",list);
		int count = bookService.getCountByPress(press);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		return "front/SpecialBooks";
		
	}
	
	/**
	 * 查询一个三级分类的书的总数
	 * @param pageNo
	 * @param typeNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryByTypeThird")
	public String queryBookByTypeThird(Integer pageNo,Integer typeNo,Model model){		
		if(pageNo == null){
			pageNo = 1;
		}
		int pageSize = 30;
		pageNo = (pageNo-1)*pageSize;
		model.addAttribute("pageNo", pageNo);
		List<BookBean> list = bookService.getBookByTypeThird(typeNo,pageNo);
		model.addAttribute("books",list);
		int count = bookService.getCountByTypeThird(typeNo);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		return "front/ProductList";
		
	}
	
	/**
	 * 查询一个二级分类的书的总数
	 * @param pageNo
	 * @param typeNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryByTypeSecond")
	public String queryBookByTypeSecond(Integer pageNo,Integer typeNo,Model model,String typeName){		
		if(pageNo == null){
			pageNo = 1;
		}
		int pageSize = 30;
		pageNo = (pageNo-1)*pageSize;
		model.addAttribute("pageNo", pageNo);
		List<BookBean> list = bookService.getBookByTypeSecond(typeNo, pageNo);
		model.addAttribute("books",list);
		List<SecondTypeBean> tlist = bookService.getTypeTwoName();
		model.addAttribute("tlist", tlist);
		model.addAttribute("typeName", typeName);
		int count = bookService.getCountByTypeSecond(typeNo);
		int temp = count%pageSize;
		int totalpage = 0;
		if(temp==0){
			totalpage = count/pageSize;
		}else{
			totalpage = (count/pageSize)+1;
		}
		model.addAttribute("count", totalpage);	
		return "front/type";
		
	}


}
