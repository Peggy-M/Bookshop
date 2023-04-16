package com.bookshop.user.controller;

import com.bookshop.address.bean.AddressDTO;
import com.bookshop.address.service.IAddressService;
import com.bookshop.cart.bean.CartDTO;
import com.bookshop.cart.service.ICartService;
import com.bookshop.order.bean.LogisticsDTO;
import com.bookshop.order.bean.OrderDTO;
import com.bookshop.order.service.IOrderService;
import com.bookshop.order.service.impl.OrderServiceImpl;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.dao.IUserDao;
import com.bookshop.user.service.IUserService;
import io.goeasy.GoEasy;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author XIAOSHUAI
 *	用户个人中心
 */
@Controller
@RequestMapping("/Member")
public class UserCenterController {
	private IUserDao userDao;
	private IOrderService orderService;
	private IUserService userService;
	private IAddressService addressService;
	private ICartService cartService;
	
	@Autowired
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	@Autowired
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}

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

	/**
	 * 点击我的账户进入用户中心首页
	 * @return
	 */
	@RequestMapping("/index.do")
	public String userAccount(HttpServletRequest request,Model model){
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		List<OrderDTO> orderList = orderService.getAllUserOrder(userId);
		model.addAttribute("orderList", orderList);
		
		return "front/Member/index";
	}
	
	/**
	 * 点击我的订单
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/allOrderList.do")
	public String userOrder(HttpServletRequest request,Model model){
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		List<OrderDTO> orderList = orderService.getAllUserOrder(userId);
		for (OrderDTO orderDTO : orderList) {
			String deliver = orderDTO.getOrderDeliver();
			if ("sf".equals(deliver)) {
				orderDTO.setOrderDeliver("顺丰");
			}else if ("sto".equals(deliver)) {
				orderDTO.setOrderDeliver("申通");
			}else if ("yt".equals(deliver)) {
				orderDTO.setOrderDeliver("圆通");
			}else if ("yd".equals(deliver)) {
				orderDTO.setOrderDeliver("韵达");
			}
		}
		model.addAttribute("orderList", orderList);
		
		return "front/Member/orderList";
	}
	
	/**
	 * 点击查看订单详情
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderDetails.do")
	public String orderDetails(Integer orderId,Model model){
		//订单
		OrderDTO orderDetails = orderService.queryOrder(orderId);
		String deliver = orderDetails.getOrderDeliver();
		model.addAttribute("deliver", deliver);		//快递公司代码
		if ("sf".equals(deliver)) {
			orderDetails.setOrderDeliver("顺丰");
		}else if ("sto".equals(deliver)) {
			orderDetails.setOrderDeliver("申通");
		}else if ("yt".equals(deliver)) {
			orderDetails.setOrderDeliver("圆通");
		}else if ("yd".equals(deliver)) {
			orderDetails.setOrderDeliver("韵达");
		}
		model.addAttribute("order", orderDetails);
		
		//收货地址
		Integer orderAddressId = orderDetails.getOrderAddressId();
		AddressDTO address = addressService.queryAddressById(orderAddressId);
		model.addAttribute("address",address);
		
		//商品信息
		String orderNumber = orderDetails.getOrderNumber();
		List<CartDTO> cartList = cartService.getCartByOrderNumber(orderNumber);
		model.addAttribute("cartList",cartList);
		
		//根据订单状态返回指定页面
		if (("已付款").equals(orderDetails.getOrderStatus())) {
			return "front/Member/orderDetails2";
		}
		if (("已发货").equals(orderDetails.getOrderStatus())) {
			return "front/Member/orderDetails3";
		}
		if (("已收货").equals(orderDetails.getOrderStatus())) {
			return "front/Member/orderDetails4";
		}
		
		return "front/Member/orderDetails";
	}
	
	/**
	 * 点击立即支付按钮
	 * @return
	 */
	@RequestMapping("/payNow.do")
	public String payNow(Integer orderId,Model model){
		OrderDTO orderDetails = orderService.queryOrder(orderId);
		String orderStatusOld = orderDetails.getOrderStatus();
		String orderStatus = "已付款";
		if ("未付款".equals(orderStatusOld)) {
			orderService.updateOrderStatus(orderId, orderStatus);
			//支付成功后进行通知
			GoEasy goEasy = new GoEasy("","BC-18bbf5b2eff64b288fdb86f0a4a210d1");
			goEasy.publish("my_channel", "您有新订单,请注意查看!");
		}
		
		//订单
		String deliver = orderDetails.getOrderDeliver();
		model.addAttribute("deliver", deliver);		//快递公司代码
		if ("sf".equals(deliver)) {
			orderDetails.setOrderDeliver("顺丰");
		}else if ("sto".equals(deliver)) {
			orderDetails.setOrderDeliver("申通");
		}else if ("yt".equals(deliver)) {
			orderDetails.setOrderDeliver("圆通");
		}else if ("yd".equals(deliver)) {
			orderDetails.setOrderDeliver("韵达");
		}
		model.addAttribute("order", orderDetails);
		
		//收货地址
		Integer orderAddressId = orderDetails.getOrderAddressId();
		AddressDTO address = addressService.queryAddressById(orderAddressId);
		model.addAttribute("address",address);
		
		//商品信息
		String orderNumber = orderDetails.getOrderNumber();
		List<CartDTO> cartList = cartService.getCartByOrderNumber(orderNumber);
		model.addAttribute("cartList",cartList);
		
		return "front/Member/orderDetails2";
	}
	
	/**
	 * 点击确认收货按钮
	 * @return
	 */
	@RequestMapping("/confirmAccept.do")
	public String confirmProduct(Integer orderId,Model model){
		
		//订单
		OrderDTO orderDetails = orderService.queryOrder(orderId);
		String orderStatus = "已收货";
		String orderStatusOld = orderDetails.getOrderStatus();	//数据库订单状态
		if (orderStatus.equals(orderStatusOld)) {
			return "front/Member/orderDetails4";
		}
		
		orderService.updateOrderStatus(orderId, orderStatus);
		String deliver = orderDetails.getOrderDeliver();
		model.addAttribute("deliver", deliver);		//快递公司代码
		if ("sf".equals(deliver)) {
			orderDetails.setOrderDeliver("顺丰");
		}else if ("sto".equals(deliver)) {
			orderDetails.setOrderDeliver("申通");
		}else if ("yt".equals(deliver)) {
			orderDetails.setOrderDeliver("圆通");
		}else if ("yd".equals(deliver)) {
			orderDetails.setOrderDeliver("韵达");
		}
		model.addAttribute("order", orderDetails);
		
		//收货地址
		Integer orderAddressId = orderDetails.getOrderAddressId();
		AddressDTO address = addressService.queryAddressById(orderAddressId);
		model.addAttribute("address",address);
		
		//商品信息
		String orderNumber = orderDetails.getOrderNumber();
		List<CartDTO> cartList = cartService.getCartByOrderNumber(orderNumber);
		model.addAttribute("cartList",cartList);
		
		return "front/Member/orderDetails4";
	}
	
	/**
	 * 显示当前用户地址簿
	 * @return
	 */
	@RequestMapping("/showAddress.do")
	public String showAddressList(HttpServletRequest request,Model model){
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		//查询当前用户地址簿
		List<AddressDTO> addressList = addressService.getUserAddressByUserId(userId);
		model.addAttribute("addressList",addressList);
		
		return "front/Member/addressList";
	}
	
	/**
	 * 修改地址信息
	 * @return
	 */
	@RequestMapping("/updateAddress.do")
	@ResponseBody
	public String updateAddress(AddressDTO address){
		addressService.updateAddress(address);
		
		return "success";
	}
	
	/**
	 * 显示修改地址对话框界面
	 * @return
	 */
	@RequestMapping("/update.do")
	public String showAddress(Integer addressId,Model model){
		AddressDTO address = addressService.queryAddressById(addressId);
		model.addAttribute("address",address);
		return "front/iframes/updateAddress";
	}
	
	/**
	 * 删除地址
	 * @return
	 */
	@RequestMapping("/deleteAddress.do")
	@ResponseBody
	public String deleteAddress(Integer addressId,Model model){
		addressService.deleteAddress(addressId);
		return "success";
	}
	
	/**
	 * 修改用户信息
	 * @return
	 */
	@RequestMapping("/updateUserInfo.do")
	@ResponseBody
	public String updateUserInfo(String userEmail,String userPhone,Model model,HttpServletRequest request){
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		LoginUserBean userInfo = userDao.getUserById(userId);
		userInfo.setUserEmail(userEmail);
		userInfo.setUserPhone(userPhone);
		
		userDao.updateUserInfoById(userInfo);
		
		return "success";
	}
	
	/**
	 * 点击我的资料跳转页面
	 * @return
	 */
	@RequestMapping("/userInfo.do")
	public String userInfo(Model model,HttpServletRequest request){
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		LoginUserBean userInfo = userDao.getUserById(userId);
		model.addAttribute("userInfo", userInfo);
		
		return "front/Member/updateUserInfo";
	}
	
	/**
	 * 点击修改密码
	 * @return
	 */
	@RequestMapping("/updatePassword.do")
	@ResponseBody
	public String updatePassword(String passwordOld,LoginUserBean userBean,HttpServletRequest request){
		Object userName = request.getSession().getAttribute("name");
		LoginUserBean userInfo = userService.getUserInfoByName(userName.toString());
		String password = userInfo.getUserPassword();
		userBean.setUserName(userName.toString());
		
		//加密
		String hashAlgorithmName = "MD5";
		ByteSource salt = ByteSource.Util.bytes(userName.toString());
		int hashIterations = 1024;
		SimpleHash simpleHash = new SimpleHash(hashAlgorithmName, passwordOld, salt, hashIterations);
		
		if (simpleHash.toString().equals(password)) {
			userService.updatePasswordById(userBean);
			return "success";
		}else{
			return "fail";			
		}
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
	        	System.out.println(name);
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
			return "front/iframes/logistics";
		}
		return null;
	}
}
