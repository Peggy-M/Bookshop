package com.bookshop.cart.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.book.bean.BookBean;
import com.bookshop.book.service.IBookService;
import com.bookshop.cart.bean.CartDTO;
import com.bookshop.cart.service.ICartService;
import com.bookshop.frontbook.service.IFrontBookService;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.service.IUserService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private ICartService cartService;
	private IBookService bookService;
	private IUserService userService;
	private IFrontBookService frontBookService;
	private static final int PAGE_SIZE = 8;
	
	@Autowired
	public void setFrontBookService(IFrontBookService frontBookService) {
		this.frontBookService = frontBookService;
	}

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}

	@Autowired
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}
	
	/**查询所有的购物车信息（后台）
	 * @param model
	 * @return
	 */
	@RequestMapping("/query.do")
	public String getAllCart(Model model) {
		List<CartDTO> carts = cartService.queryAllCart();
		model.addAttribute("carts", carts);
		return "background/cart/cartlist";
	}
	
	/**根据用户ID分页查询所有购物车
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/cartlist.do")
	public String getUserCart(Integer id,Integer pageno,Model model) {
		if(pageno==null){
			pageno = 0;
		}
		List<CartDTO> carts = cartService.queryCartByUserId(id, pageno);
		model.addAttribute("carts", carts);
		int count = cartService.queryUserCartCount(id);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/cart/usercartlist";
	}
	
	/**根据当前购物车ID查询一条购物车信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/cartshow.do")
	public String queryOneCart(Integer userId,Model model) {
		CartDTO cart = cartService.queryCartById(userId);
		model.addAttribute("cart", cart);
		return "background/cart/cartlist";
	}
	
	/**分页查询所有的购物车信息
	 * @return
	 */
	@RequestMapping("/allcartlist.do")
	public String queryCartList(Integer pageno,Model model) {
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<CartDTO> cartList = cartService.queryCartListByPage(pageno);
		model.addAttribute("cartList", cartList);
		int count = cartService.queryCartCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/cart/cartlist";
	}
	
	/**添加购物车，并根据当前用户ID查询所有购物车信息(前端页面使用)
	 * @param cart
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/addcart.do")
	@ResponseBody
	public String  addCart(Integer bookId,CartDTO cart,Model model,HttpServletRequest request,HttpServletResponse response) {
		com.bookshop.frontbook.bean.BookBean bookBean = frontBookService.getBookByID(bookId);
		Integer status = bookBean.getBookStatus();
		if (status==5) {
			return "undercarriage";
		}
		//判断当前选择的书是否已存在用户购物车数据库内
		//根据用户登录的用户名获取用户Id
		Object userName = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(userName.toString());
		int userId = userBean.getUserId();
		
		//根据商品详情的图书ID查询到当前图书名
		BookBean book = bookService.selectBookById(bookId);
		String bookName = book.getBookName();
		
		//根据用户ID和当前图书名查询并判断
		CartDTO cartDTO = cartService.queryUserCart(userId, bookName);
		
		if(null != cartDTO){
			return "exist";
		}
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatdate = simpleDateFormat.format(date);
		cart.setCartBookAddtime(creatdate);
		
		cart.setCartUserId(userId);
		cart.setCartBookImage(book.getBookCover());
		cart.setCartBookName(bookName);
		cart.setCartBookNumber(1);
		cart.setCartBookPrice(book.getBookPrice());
		cart.setCartBookSellprice(book.getBookSellPrice());
		cart.setCartStatus(0);	//购物车状态:未提交
		
		cartService.addCart(cart);
		
		return "success";
	}
	
	
	/**
	 * 点击立即购买跳转到购物车
	 * @param bookId
	 * @param pageno
	 * @param cart
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/buy.do")
	@ResponseBody
	public String buyBook(Integer bookId,Integer pageno ,CartDTO cart,Model model,HttpServletRequest request,HttpServletResponse response) {
		//根据用户登录的用户名获取用户Id
		Object userName = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(userName.toString());
		int userId = userBean.getUserId();
		
		//根据商品详情的图书ID查询到当前图书名
		if(bookId==null){
			return "fail";
		}
		BookBean book = bookService.selectBookById(bookId);
		String bookName = book.getBookName();
		
		//根据用户ID和当前图书名查询并判断
		CartDTO cartDTO = cartService.queryUserCart(userId, bookName);
		
		if(null != cartDTO){
			//查询
			if(pageno == null){
				pageno = 0;
			}
			List<CartDTO> cartList = cartService.queryCartByUserId(userId, pageno);
			model.addAttribute("cartList", cartList);
			return "front/Cart";
		}
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatdate = simpleDateFormat.format(date);
		cart.setCartBookAddtime(creatdate);
		
		cart.setCartUserId(userId);
		cart.setCartBookImage(book.getBookCover());
		cart.setCartBookName(bookName);
		cart.setCartBookNumber(1);
		cart.setCartBookPrice(book.getBookPrice());
		cart.setCartBookSellprice(book.getBookSellPrice());
		cart.setCartStatus(0);	//购物车状态:未提交
		//加入购物车
		cartService.addCart(cart);
		
		//查询购物车
		if(pageno == null){
			pageno = 0;
		}
		
		List<CartDTO> cartList = cartService.queryCartByUserId(userId, pageno);
		model.addAttribute("cartList", cartList);
		
		return "front/Cart";
	}
	
	/**返回前端购物车页面
	 * @param cartId
	 * @param bookId
	 * @param pageno
	 * @param cart
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/showcart")
	public String showFrontCartList(Integer pageno ,CartDTO cart,Model model,HttpServletRequest request) {
		
		//根据用户登录的用户名获取用户Id
		Object userName = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(userName.toString());
		int userId = userBean.getUserId();
		
		if(pageno == null){
			pageno = 0;
		}
		List<CartDTO> cartList = cartService.queryCartByUserId(userId, pageno);
		model.addAttribute("cartList", cartList);
		return "front/Cart";
	}
	
	/**前端删除一条购物车
	 * @param cartId
	 * @param model
	 * @param request
	 * @param pageno
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteFront(Integer cartId) {
		
		cartService.deleteCart(cartId);
		
		return "success";
	}
	
	@RequestMapping("/deleteall")
	@ResponseBody
	public String deleteAllFront(HttpServletRequest request) {
		//根据用户登录的用户名获取用户Id
		Object userName = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(userName.toString());
		int id = userBean.getUserId();
		cartService.deleteAllCart(id);
		return "success";
	}
	
	/**
	 * 后台调用删除购物车操作
	 * @param cartId
	 * @param model
	 * @return
	 */
	@RequestMapping("/delete.do")
	public String deleteCart(Integer cartId,Model model) {
		cartService.deleteCart(cartId);
		List<CartDTO> cartList = cartService.queryCartListByPage(0);
		model.addAttribute("cartList", cartList);
		return "background/cart/cartlist";
	}
	
	/**更改购物车商品数量
	 * @param status
	 * @param cartId
	 * @param cartDTO
	 * @return
	 */
	@RequestMapping("/amount.do")
	@ResponseBody
	public String updateNum(String status,Integer cartId , CartDTO cartDTO) {
		//根据cartId获取当前购物车的商品数量
		CartDTO cart = cartService.queryCartById(cartId);
		int amount = cart.getCartBookNumber();
		
		//判断后，数量+1
		if(status.equals("add")){
			int amountAdd = amount+1;
			cartDTO.setCartBookNumber(amountAdd);
			cartService.updateAmount(cartDTO);
		}
		
		//判断后，数量-1
		if(status.equals("dec")){
			int amountDes = amount-1;
			cartDTO.setCartBookNumber(amountDes);
			cartService.updateAmount(cartDTO);
		}
		
		return "success";
	}
	
}
