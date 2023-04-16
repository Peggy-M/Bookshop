package com.bookshop.address.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.bookshop.order.service.IOrderService;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.service.IUserService;

@Controller
@RequestMapping("/address")
public class AddressController {
	private IOrderService orderService;
	private IAddressService addressService;
	private ICartService cartService;
	private IUserService userService;
	private static final int PAGE_SIZE = 8;
	
	@Autowired
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	
	@Autowired
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}
	
	/**根据用户ID分页查询当前用户的地址信息
	 * @param id
	 * @param pageno
	 * @param model
	 * @return
	 */
	@RequestMapping("/useraddress.do")
	public String queryUserAddress(Integer id,Integer pageno,Model model,HttpServletRequest request) {
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<AddressDTO> addressList = addressService.getUserAddressByPage(id, pageno);
		model.addAttribute("addressList", addressList);
		int count = addressService.getUserAddressCount(id);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/address/useraddresslist";
	}
	
	/**分页查询所有用户的所有地址信息
	 * @param pageno
	 * @param model
	 * @return
	 */
	@RequestMapping("/addresslist.do")
	public String queryAddressList(Integer pageno,Model model) {
		if (pageno==null) {
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<AddressDTO> addressList = addressService.getAddressByPage(pageno);
		model.addAttribute("addressList", addressList);
		int count = addressService.getAddressCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage = count/PAGE_SIZE;
		}else {
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "background/address/addresslist";
	}
	
	
	/**后台删除使用
	 * @return
	 */
	@RequestMapping("/delete.do")
	public String deleteAddressForBack(Integer id,Model model) {
		addressService.deleteAddress(id);
		List<AddressDTO> addressList = addressService.getUserAddressByPage(id, 0);
		model.addAttribute("addressList", addressList);
		return "background/address/useraddresslist";
	}
	
	
	/**前端用户新增地址
	 * @return
	 */
	@RequestMapping("/addressadd.do")
	@ResponseBody
	public String insertUserAddress(HttpServletRequest request,AddressDTO address,Model model) {
		//根据用户登录信息获取用户ID
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		address.setAddressUserId(userId);
		
		addressService.addAddress(address);
		
		return "success";
	}
	
	
	/**
	 * 点击购物车结算按钮
	 * 根据用户ID查询出所有地址信息，供前端使用
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/orderconfirm.do")
	public String showUserAddress(Integer pageno,Model model,HttpServletRequest request) {
		//根据用户登录信息获取用户ID
		Object name = request.getSession().getAttribute("name");
		LoginUserBean userBean = userService.getUserInfoByName(name.toString());
		int userId = userBean.getUserId();
		
		//收货地址
		List<AddressDTO> addressList = addressService.getUserAddressByUserId(userId);
		model.addAttribute("addressList", addressList);
		
		//物流公司
		List<CompanyDTO> companyList = orderService.getCompanyList(0);
		model.addAttribute("companyList", companyList);
		
		if(pageno == null){
			pageno = 0;
		}
		List<CartDTO> cartList = cartService.queryCartByUserId(userId, pageno);
		model.addAttribute("cartList", cartList);
		
		return "front/OrderForm";
	}

}
