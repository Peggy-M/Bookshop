package com.bookshop.book.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.book.bean.BookBean;
import com.bookshop.book.bean.BookGetThird;
import com.bookshop.book.bean.BookType;
import com.bookshop.book.service.IBookService;
import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;
import com.bookshop.type.service.IFirstTypeService;
import com.bookshop.type.service.ISecondTypeService;
import com.bookshop.type.service.IThirdTypeService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/book")
public class BookContrller {
	private IBookService bookService;
	private ISecondTypeService secondTypeServiceImpl;
	private IThirdTypeService thirdService;
	private IFirstTypeService firstTypeService;
	private final static int PAGE_SIZE = 5;
	@Autowired
	public void setFirstTypeService(IFirstTypeService firstTypeService) {
		this.firstTypeService = firstTypeService;
	}
	@Autowired
	public void setSecondTypeServiceImpl(ISecondTypeService secondTypeServiceImpl) {
		this.secondTypeServiceImpl = secondTypeServiceImpl;
	}
	@Autowired
	public void setThirdService(IThirdTypeService thirdService) {
		this.thirdService = thirdService;
	}
	@Autowired
	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}
	/**
	 * @param pageno 书页
	 * @param model
	 * @return
	 * 显示图书列表
	 */
	@RequestMapping("/list")
	public String getBookList(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getCount();
		List<BookBean> bookList = bookService.getBookList(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", bookList);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/book_list";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 普通图书列表
	 */
	@RequestMapping("/status0list")
	public String getBookStatus0(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(0);
		List<BookBean> beans = bookService.getBookStatu0(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status0";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 预售图书列表
	 */
	@RequestMapping("/status1list")
	public String getBookStatus1(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(1);
		List<BookBean> beans = bookService.getBookStatu1(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status1";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 精选图书列表
	 */
	@RequestMapping("/status2list")
	public String getBookStatus2(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(2);
		List<BookBean> beans = bookService.getBookStatu2(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status2";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 特惠图书列表
	 */
	@RequestMapping("/status3list")
	public String getBookStatus3(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(3);
		List<BookBean> beans = bookService.getBookStatu3(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status3";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 畅销图书列表
	 */
	@RequestMapping("/status4list")
	public String getBookStatus4(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(4);
		List<BookBean> beans = bookService.getBookStatu4(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status4";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 下架图书列表
	 */
	@RequestMapping("/status5list")
	public String getBookStatus5(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(5);
		List<BookBean> beans = bookService.getBookStatu5(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status5";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 *  网购爆品列表
	 */
	@RequestMapping("/status6list")
	public String getBookStatus6(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(6);
		List<BookBean> beans = bookService.getBookStatu6(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status6";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 热卖图书列表
	 */
	@RequestMapping("/status7list")
	public String getBookStatus7(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(7);
		List<BookBean> beans = bookService.getBookStatu7(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status7";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 限时抢购列表
	 */
	@RequestMapping("/status8list")
	public String getBookStatus8(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(8);
		List<BookBean> beans = bookService.getBookStatu8(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status8";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 热评商品列表
	 */
	@RequestMapping("/status9list")
	public String getBookStatus9(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = bookService.getBookStatusCount(9);
		List<BookBean> beans = bookService.getBookStatu9(pageno);
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		List<SecondTypeDTO> secondList = bookService.getSecondList();
		List<ThirdTypeDTO> thirdList = bookService.getThirdList();
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("bookList", beans);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/book/status9";
	}
	/**
	 * @param model
	 * @return
	 * 一级类目列表
	 */
	@RequestMapping("/add")
	public String getBookSave(Model model){
		 List<FirstTypeDTO> firstList = bookService.getFirstList();
		 model.addAttribute("firstList", firstList);
		 return "background/book/book_add";
	}
	/**
	 * @param dto
	 * @param response
	 * 由一级类目查询相对应的二级目录
	 */
	@RequestMapping("/checksecond")
	@ResponseBody
	public void saveBook(FirstTypeDTO dto,HttpServletResponse response){
		FirstTypeDTO bookFirst = bookService.getFirstIdByName(dto.getTypeName());
		Integer bookFirstId = bookFirst.getTypeId();
		List<SecondTypeDTO> listSecond = secondTypeServiceImpl.querySecondTypeById(bookFirstId);
		List<String> list = new ArrayList<>();
		for(SecondTypeDTO secondTypeDTO:listSecond){
			list.add(secondTypeDTO.getTypeName());
		}
		Gson gson = new Gson();
		BookType bookType = new BookType();
		bookType.setBookFirstId(bookFirstId);
		bookType.setBookSecond(list);
		String json = gson.toJson(bookType);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @param dto
	 * @param response
	 * 有二级类目查询对应的三级类目
	 */
	@RequestMapping("/checkthird")
	@ResponseBody
	public void saveBooksecond(SecondTypeDTO dto,HttpServletResponse response){
		SecondTypeDTO bookSecond = bookService.getSecondIdByName(dto.getTypeName());
		Integer bookSecondId = bookSecond.getTypeId();
		List<ThirdTypeDTO> listThird = thirdService.queryThirdTypeById(bookSecondId);
		List<String> list = new ArrayList<>();
		for(ThirdTypeDTO thirdTypeDTO:listThird){
			list.add(thirdTypeDTO.getTypeName());
		}
		Gson gson = new Gson();
		BookGetThird bookType = new BookGetThird();
		bookType.setBookSecondId(bookSecondId);
		bookType.setBookThird(list);
		String json = gson.toJson(bookType);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param dto
	 * @return
	 * 获取三级目录id
	 */
	@RequestMapping("/getid")
	@ResponseBody
	public Integer getThird(ThirdTypeDTO dto){
		ThirdTypeDTO bookThird = bookService.getThirdIdByName(dto.getTypeName());
		Integer bookThirdId = bookThird.getTypeId();
		return bookThirdId;
	}
	
	/**
	 * @param upload
	 * @param request
	 * @param response
	 * ckeditor富文本编辑器上传图片
	 */
	@RequestMapping("/upload.do")
	public void articleUpload(MultipartFile upload,HttpServletRequest request,HttpServletResponse response){
		String originalName = upload.getOriginalFilename();
		//获取文件名
		String reqName = request.getServletContext().getRealPath("/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		//获取你web部署的绝对路径
		String localNamePath = reqName + "upload"+File.separator+date;
		File file = new File(localNamePath);
		if(!file.exists()){
			file.mkdirs();
		}
		String localName = reqName + "upload"+File.separator+date+File.separator+originalName;
		//System.out.println(localName);
		//获取当前要上传文件的地址
		File file2 = new File(localName);
		//打开文件上传的管道
		try {
			upload.transferTo(file2);
			//上传文件
			String imageName = request.getContextPath()+"/upload/"+date+"/"+originalName;
			//获取文件的url地址
			response.setContentType("text/html;charset=UTF-8");
	        String callback = request.getParameter("CKEditorFuncNum");
	        PrintWriter out = response.getWriter();
	        out.println("<script type=\"text/javascript\">");
	        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageName + "',''" + ")");
	        out.println("</script>");
	        out.flush();
	        out.close();
			return;
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			response.getWriter().print("upload fail");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param bookCover1 图书封面
	 * @param bookBean 图书信息
	 * @param request
	 * @return
	 * 保存图书信息
	 */
	@RequestMapping("/saveBook")
	public String addBook(MultipartFile bookCover1, BookBean bookBean,HttpServletRequest request){
		bookService.insertBook(bookCover1,bookBean,request);
		return "background/book/book_list";
	}
	
	/**
	 * @param id
	 * @return
	 * 删除图书
	 */
	@RequestMapping("/deleteBook")
	@ResponseBody
	public String bookDelete(Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookService.deleteBook(id);
		return "success";
	}
	
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消预售
	 */
	@RequestMapping("/status1")
	@ResponseBody
	public String updateStatus1(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus1(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消精选
	 */
	@RequestMapping("/status2")
	@ResponseBody
	public String updateStatus2(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus2(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消特惠
	 */
	@RequestMapping("/status3")
	@ResponseBody
	public String updateStatus3(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus3(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消畅销
	 */
	@RequestMapping("/status4")
	@ResponseBody
	public String updateStatus4(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus4(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消下架
	 */
	@RequestMapping("/status5")
	@ResponseBody
	public String updateStatus5(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus5(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消 网购爆品
	 */
	@RequestMapping("/status6")
	@ResponseBody
	public String updateStatus6(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus6(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消热卖图书
	 */
	@RequestMapping("/status7")
	@ResponseBody
	public String updateStatus7(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus7(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消限时抢购
	 */
	@RequestMapping("/status8")
	@ResponseBody
	public String updateStatus8(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus8(bookBean);
		return "success";
	}
	/**
	 * @param bookBean
	 * @param id
	 * @return
	 * 将图书状态置为或取消热评商品
	 */
	@RequestMapping("/status9")
	@ResponseBody
	public String updateStatus9(BookBean bookBean,Integer id){
		if(id==null){
			return "background/book/book_list";
		}
		bookBean.setBookId(id);
		bookService.updateStatus9(bookBean);
		return "success";
	}
	@RequestMapping("/bookDetails")
	public String selectBookById(Integer id,Model model){
		if(id==null){
			return "background/book/book_list";
		}
		BookBean bean = bookService.selectBookById(id);
		FirstTypeDTO firstTypeDTO = firstTypeService.queryFirstTypeById(bean.getBookTyprFirst());
		SecondTypeDTO secondTypeDTO = bookService.getSecond(bean.getBookTypeSecond());
		ThirdTypeDTO thirdTypeDTO = bookService.getThird(bean.getBookTypeThird());
		model.addAttribute("bean", bean);
		model.addAttribute("firstTypeDTO", firstTypeDTO);
		model.addAttribute("secondTypeDTO", secondTypeDTO);
		model.addAttribute("thirdTypeDTO", thirdTypeDTO);
		return "background/book/book_details";
	}
	
	@RequestMapping("/bookupdate")
	public String updateBookById(Integer id,Model model){
		if(id==null){
			return "background/book/book_list";
		}
		List<FirstTypeDTO> firstList = bookService.getFirstList();
		model.addAttribute("firstList", firstList);
		BookBean bean = bookService.selectBookById(id);
		SecondTypeDTO secondTypeDTO = bookService.getSecond(bean.getBookTypeSecond());
		ThirdTypeDTO thirdTypeDTO = bookService.getThird(bean.getBookTypeThird());
		FirstTypeDTO firstTypeDTO = firstTypeService.queryFirstTypeById(bean.getBookTyprFirst());
		model.addAttribute("bean", bean);
		model.addAttribute("firstTypeDTO", firstTypeDTO);
		model.addAttribute("secondTypeDTO", secondTypeDTO);
		model.addAttribute("thirdTypeDTO", thirdTypeDTO);
		return "background/book/book_update";
	}
	@RequestMapping("/updateBook")
	public String updateBook(Integer id,MultipartFile bookCover1, BookBean bookBean,HttpServletRequest request){
		bookBean.setBookId(id);
		bookService.updateBook(id,bookCover1, bookBean, request);
		return "redirect:../background/book/book_list.jsp";
	}
}
