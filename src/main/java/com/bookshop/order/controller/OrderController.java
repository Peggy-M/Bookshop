package com.bookshop.order.controller;

import java.io.IOException;
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

import com.bookshop.address.bean.AddressDTO;
import com.bookshop.address.service.IAddressService;
import com.bookshop.cart.bean.CartDTO;
import com.bookshop.cart.service.ICartService;
import com.bookshop.order.bean.CompanyDTO;
import com.bookshop.order.bean.LogisticsDTO;
import com.bookshop.order.bean.OrderDTO;
import com.bookshop.order.service.IOrderService;
import com.bookshop.order.service.impl.OrderServiceImpl;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.service.IUserService;
import com.bookshop.utils.GenerateNum;
import com.google.gson.Gson;

import io.goeasy.GoEasy;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/order")
public class OrderController {
	private IOrderService orderService;
	private IUserService userService;
	private IAddressService addressService;
	private ICartService cartService;
	
	@Autowired
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}

	private static final int PAGE_SIZE = 8;
	
	@Autowired
	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}


	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	
	/**分页查询所有订单信息
	 * @param pageno
	 * @param model
	 * @return
	 */
	@RequestMapping("/allorderlist.do")
	public String queryAllOrderByPage(Integer pageno,Model model){
		if(pageno == null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<OrderDTO> orderList = orderService.getAllOrder(pageno);
		model.addAttribute("orderList", orderList);
		List<CompanyDTO> comList = orderService.getCompanyList(0);
		model.addAttribute("comList", comList);
		int count = orderService.getAllOrderCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/order/orderlist";
	}
	
	/**根据用户ID分页查询所有订单
	 * @return
	 */
	@RequestMapping("/orderlist.do")
	public String queryUserOrderByPage(Integer userId,Integer pageno,Model model) {
		if(pageno == null){
			pageno = 1;
		}
		pageno = (pageno-1)*PAGE_SIZE;
		model.addAttribute("pageno", pageno);
		List<OrderDTO> userOrderList = orderService.getUserOrder(userId, pageno);
		model.addAttribute("userOrderList", userOrderList);
		List<CompanyDTO> comList = orderService.getCompanyList(0);
		model.addAttribute("comList", comList);
		int count = orderService.getUserOrderCount(userId);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/order/userOrderlist";
	}
	
	/**根据订单ID删除当前订单，返回所有订单页面
	 * @param id
	 * @param model
	 * @return orderlist
	 */
	@RequestMapping("/delete.do")
	public String deleteOrder(Integer id,Model model) {
		orderService.deleteOrderInfo(id);
		List<OrderDTO> orderList = orderService.getAllOrder(0);
		model.addAttribute("orderList", orderList);
		return "background/order/orderlist";
	}
	
	/**
		前端取消订单按钮
	 * @param id
	 * @param model
	 * @return orderlist
	 */
	@RequestMapping("/cancelOrder.do")
	@ResponseBody
	public String cancelOrder(Integer orderId,Model model) {
		OrderDTO order = orderService.queryOrder(orderId);
		cartService.deleteCartByOrderNumber(order.getOrderNumber());
		
		orderService.deleteOrderInfo(orderId);
		
		return "success";
	}
	
	/**根据订单ID删除当前订单，返回用户订单查询页面
	 * @param userId
	 * @param orderId
	 * @param model
	 * @return userOrderlist
	 */
	@RequestMapping("/deleteUserOrder.do")
	public String deleteUserOrder(Integer userId,Integer orderId,Model model) {
		orderService.deleteOrderInfo(orderId);
		List<OrderDTO> userOrderList = orderService.getUserOrder(userId, 0);
		model.addAttribute("userOrderList", userOrderList);
		return "background/order/userOrderlist";
	}
	
	/**前端添加订单
	 * @param order
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/addorder.do")
	public String addOrder(OrderDTO order,Model model,HttpServletRequest request) {
		//订单编号
		String orderNum = GenerateNum.getInstance().generateOrder();
		order.setOrderNumber(orderNum);
		
		//订单创建时间
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatdate = simpleDateFormat.format(date);
		order.setOrderCreateTime(creatdate);
		
		//订单状态（未付款）
		String status = "未付款";		//提交订单后的默认状态
		order.setOrderStatus(status);
		
		//根据用户登录信息获取用户ID
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		order.setOrderUserId(userId);
		
		//提交订单
		orderService.addOrderInfo(order);
		
		OrderDTO orderDTO = orderService.getOrderByOrderNumber(orderNum);
		model.addAttribute("orderDTO", orderDTO);
		
		List<CartDTO> cartList = cartService.queryCartByUserId(userId, 0);
		
		//更新当前订单商品关联订单号
		//修改购物车商品状态(已提交)
		for (CartDTO cartDTO : cartList) {
			Integer cartId = cartDTO.getCartId();
			addressService.updateCartOrderNumberAndStatus(orderNum,cartId);
		}
		
		return "front/OrderPay";
	}
	
	
	/**前端显示用户订单列表(暂未使用)
	 * @return
	 */
	@RequestMapping("/showorder.do")
	public String showUserOrder(Model model,HttpServletRequest request) {
		//根据用户登录信息获取用户ID
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		List<OrderDTO> orderList = orderService.getAllUserOrder(userId);
		model.addAttribute("orderList", orderList);
		
		return "";
	}
	/**
	 * @return
	 * 查询物流信息
	 */
	@RequestMapping("/getLogistis.do")
	public String getLogistisMesg(Model model,Integer orderId,String id,String company){
		JSONObject object1 = OrderServiceImpl.getRequest1(id, company);
		if(object1!=null){
			JSONArray array = object1.getJSONArray("list");
	        List<LogisticsDTO> dtoList = new ArrayList<>();
	        for (int i = 0; i <array.size(); i++) {
	        	JSONObject interestJsonObj = array.getJSONObject(i);
	        	String name = interestJsonObj.getString("remark");
	        	String date = interestJsonObj.getString("datetime");
	        	String zone = interestJsonObj.getString("zone");
	        	LogisticsDTO dto = new LogisticsDTO();
	        	dto.setRemark(name);
	        	dto.setDatetime(date);
	        	dto.setZone(zone);
	        	dtoList.add(dto);
	        }
	        OrderDTO orderDTO = orderService.queryOrder(orderId);
	        model.addAttribute("orderDTO", orderDTO);
	        LoginUserBean bean = userService.getUserById(orderDTO.getOrderUserId());
	        AddressDTO dto = addressService.queryAddressById(orderDTO.getOrderAddressId());
	        model.addAttribute("bean", bean);
	        model.addAttribute("dto", dto);
	        model.addAttribute("company", object1.get("company"));
	        model.addAttribute("com", object1.get("com"));
	        model.addAttribute("no", object1.get("no"));
	        model.addAttribute("status", object1.get("status"));
	        model.addAttribute("dtoList", dtoList);
			return "background/logistics";
		}
		return null;
	}
	/**
	 * @param id
	 * @param model
	 * @return
	 * 订单详情
	 */
	@RequestMapping("/getOrderDetails.do")
	public String orderDetails(Integer id,Model model){
		OrderDTO orderDTO = orderService.queryOrder(id);
        model.addAttribute("orderDTO", orderDTO);
        LoginUserBean bean = userService.getUserById(orderDTO.getOrderUserId());
        AddressDTO dto = addressService.queryAddressById(orderDTO.getOrderAddressId());
        List<CartDTO> cartList = cartService.getCartByOrderNumber(orderDTO.getOrderNumber());
        model.addAttribute("cartList", cartList);
        model.addAttribute("bean", bean);
        model.addAttribute("dto", dto);
		return "background/order/orderdetails";
	}
	
	/**
	 * @param dto
	 * @return
	 * 更新物流订单号和将订单更新为已发货
	 */
	@ResponseBody
	@RequestMapping("/updateBak.do")
	public String updateBakById(OrderDTO dto){
		dto.setOrderStatus("已发货");
		orderService.updateBakById(dto);
		return "success";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取已付款的订单
	 */
	@RequestMapping("/payedOrder.do")
	public String getStatusOrder(Integer pageno,Model model){
		if(pageno == null){
			pageno = 1;
		}
		pageno = (pageno-1)*PAGE_SIZE;
		model.addAttribute("pageno", pageno);
		List<OrderDTO> orderList = orderService.getStatusOrder("已付款", pageno);
		List<CompanyDTO> comList = orderService.getCompanyList(0);
		model.addAttribute("comList", comList);
		model.addAttribute("orderList", orderList);
		int count = orderService.getStatusOrderCount("已付款");
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/order/payedorder";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取已发货的订单
	 */
	@RequestMapping("/oldOrder.do")
	public String getStatuOldOrder(Integer pageno,Model model){
		if(pageno == null){
			pageno = 1;
		}
		pageno = (pageno-1)*PAGE_SIZE;
		model.addAttribute("pageno", pageno);
		List<OrderDTO> orderList = orderService.getStatusOrder("已发货", pageno);
		List<CompanyDTO> comList = orderService.getCompanyList(0);
		model.addAttribute("orderList", orderList);
		model.addAttribute("comList", comList);
		int count = orderService.getStatusOrderCount("已发货");
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/order/oldpay";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取已发货的订单
	 */
	@RequestMapping("/Ordered.do")
	public String getStatuOrdered(Integer pageno,Model model){
		if(pageno == null){
			pageno = 1;
		}
		pageno = (pageno-1)*PAGE_SIZE;
		model.addAttribute("pageno", pageno);
		List<OrderDTO> orderList = orderService.getStatusOrder("已收货", pageno);
		List<CompanyDTO> comList = orderService.getCompanyList(0);
		model.addAttribute("orderList", orderList);
		model.addAttribute("comList", comList);
		int count = orderService.getStatusOrderCount("已收货");
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/order/ordered";
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 物流公司列表
	 */
	@RequestMapping("/companyList.do")
	public String getCompanyList(Integer pageno,Model model){
		if(pageno == null){
			pageno = 1;
		}
		pageno = (pageno-1)*PAGE_SIZE;
		model.addAttribute("pageno", pageno);
		List<CompanyDTO> CompanyList = orderService.getCompanyList(pageno);
		model.addAttribute("CompanyList", CompanyList);
		int count = orderService.getCompanyCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp == 0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/company";
	}
	
	/**
	 * @param dto
	 * @return
	 * 增加物流公司
	 */
	@RequestMapping("/addcompany.do")
	public String addCompany(CompanyDTO dto){
		orderService.insertCompany(dto);
		return "background/company";
	}
	
	/**
	 * @param id
	 * @param response
	 * 根据id获取公司信息
	 */
	@ResponseBody
	@RequestMapping("/getcompany.do")
	public void updateGetCompany(Integer id,HttpServletResponse response){
		CompanyDTO companyDTO = orderService.getCompanyById(id);
		Gson gson = new Gson();
		String json = gson.toJson(companyDTO);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * @param dto
	 * @return
	 * 更新物流公司
	 */
	@ResponseBody
	@RequestMapping("/updatecompany.do")
	public String updateCompany(CompanyDTO dto){
		orderService.updateCompanyById(dto);
//		GoEasy goEasy = new GoEasy("BC-18bbf5b2eff64b288fdb86f0a4a210d1");
//		goEasy.publish("my_channel", "Hello, GoEasy!");
		return "success";
	}
	
	/**
	 * @param id
	 * @return
	 * 删除物流公司
	 */
	@RequestMapping("/deletecompany.do")
	public String deleteCompany(Integer id){
		orderService.deleteCompanyById(id);
		return "background/company";
	}
}
