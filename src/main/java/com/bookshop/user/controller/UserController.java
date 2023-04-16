package com.bookshop.user.controller;


import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.service.IUserService;
   
@Controller
@RequestMapping("/user")
public class UserController {
	private IUserService serviceImpl;
	@Autowired
	public void setServiceImpl(IUserService serviceImpl) {
		this.serviceImpl = serviceImpl;
	}
	/**
	 * @param userBean
	 * @return
	 * 登陆
	 */
	@ResponseBody
	@RequestMapping("/login")
	public String getUser(LoginUserBean userBean){
//		String password = MD5Util.formatMD5String(userBean.getUserPassword());
		Subject subject = SecurityUtils.getSubject();
		if(!subject.isAuthenticated()){
			Integer status = serviceImpl.getStatusByName(userBean.getUserName());
			if(status!=null){
				if(status!=0){
					UsernamePasswordToken token = new UsernamePasswordToken(userBean.getUserName(),userBean.getUserPassword());
					try {
							subject.login(token);
						subject.getSession().setAttribute("name", userBean.getUserName());
						return "success";
					} catch (AuthenticationException e) {
						
					}
				}else{
					return "fail";
				}
			}else{
				return null;
			}
		}
		return null;
	}
	/**
	 * @param userBean
	 * @return
	 * 注册
	 */
	@ResponseBody
	@RequestMapping("/register")
	public String register(LoginUserBean userBean){
		if(null==userBean){
			return "front/login&register/front_register";
		}
		serviceImpl.insertUser(userBean);
		Subject subject = SecurityUtils.getSubject();
		subject.getSession().setAttribute("name", userBean.getUserName());
		return "success";
	}
	
	/**
	 * @param userBean
	 * @return
	 * 验证用户名是否存在
	 */
	@ResponseBody
	@RequestMapping("/check")
	public String checkUserName(LoginUserBean userBean){
		if(null==userBean.getUserName()||userBean.getUserName()==""){
			return "front/login&register/front_register";
		}
		LoginUserBean loginUserBean = serviceImpl.getUser(userBean);
		if(null==loginUserBean){
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 用户退出登录
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "success";
	}
	/**
	 * @param codeVal
	 * @param model
	 * @param session
	 * @return
	 * 检查登陆验证码
	 */
	@ResponseBody
	@RequestMapping("/checkCode")
	public String checkCode(String codeVal,Model model,HttpSession session){
		Object code = session.getAttribute("codeValue");
		if(null==codeVal||codeVal.toString().equals("")){
			return "fail";
		}else if(codeVal!=null&&codeVal.equalsIgnoreCase(code.toString())){
			return "success";
		}else{
			return "fail";
		}
	}
	/**
	 * @param userBean
	 * @return
	 * 后台更改密码
	 */
	@ResponseBody
	@RequestMapping("/updatePassword")
	public String updatePassword(LoginUserBean userBean) {
		serviceImpl.updatePasswordById(userBean);
		return "success";
	}
	/**
	 * @param mobile
	 * @return
	 * 注册短信
	 */
	@ResponseBody
	@RequestMapping("/mobileChack")
	public String mobile(String mobile){
		int mobile_code = (int)((Math.random()*9+1)*100000);
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		String code = serviceImpl.mobileChack(mobile,content);
		if("2".equals(code)){
			return Integer.valueOf(mobile_code).toString();
		}
		return null;
	}
	/**
	 * @param mobile
	 * @return
	 * 前端找回密码注册短信
	 */
	@ResponseBody
	@RequestMapping("/mobile")
	public String mobilePassword(String userName){
		String mobile = serviceImpl.getPhoneByName(userName);
		if(mobile==null||mobile==""){
			return null;
		}
		int mobile_code = (int)((Math.random()*9+1)*100000);
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		String code = serviceImpl.mobileChack(mobile,content);
		if("2".equals(code)){
			return Integer.valueOf(mobile_code).toString();
		}
		return null;
	}
	/**
	 * @param userBean
	 * @return
	 * 前端更改密码
	 */
	@ResponseBody
	@RequestMapping("/updatefrontPassword")
	public String updatePasswordfront(LoginUserBean userBean) {
		serviceImpl.updatePasswordById(userBean);
		return "success";
	}
}
