package com.bookshop.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.bean.PermissionBean;
import com.bookshop.user.bean.RoleBean;
import com.bookshop.user.bean.RolePermissionBean;
import com.bookshop.user.bean.UserRoleBean;
import com.bookshop.user.bean.UserRolePermDTO;
import com.bookshop.user.service.IRolePermissionService;
import com.bookshop.user.service.IUserService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/role")
public class RolePermissionController {
	private final static int PAGE_SIZE = 8;
	private IRolePermissionService roleService;
	private IUserService userService;
	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setRoleService(IRolePermissionService roleService) {
		this.roleService = roleService;
	}
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取角色列表
	 */
	@RequestMapping("/roleList.do")
	public String getRoleList(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = roleService.getRoleCount();
		List<RoleBean> roleList = roleService.getRoleList(pageno);
		if(roleList!=null){
			List<PermissionBean> permissionListAll = roleService.getPermissionListAll();
			model.addAttribute("permissionList", permissionListAll);
			List<UserRolePermDTO> userRolePermDTOs = new ArrayList<>();
			for(RoleBean role:roleList){
				UserRolePermDTO userRolePermDTO = new UserRolePermDTO();
				List<String> permissionList = userService.getPermissionByRole(role.getRoleName());
				Set<String> perSet = new HashSet<>(permissionList);
				userRolePermDTO.setPermList(perSet);
				Set<String> roleSet = new HashSet<>();
				roleSet.add(role.getRoleName());
				userRolePermDTO.setRoles(roleSet);
				userRolePermDTOs.add(userRolePermDTO);
			}
			model.addAttribute("userRolePermDTOs", userRolePermDTOs);
			model.addAttribute("roleList", roleList);
		}
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/user/role";
	}
	/**
	 * @param roleBean
	 * @return
	 * 增加角色
	 */
	@RequestMapping("/addRole.do")
	@ResponseBody
	public String addRole(String json,RoleBean roleBean){
		roleService.addRole(roleBean);
		RoleBean bean = roleService.getRoleIdByName(roleBean.getRoleName());
		String[] strList = json.substring(1, json.length()-1).replace("\"", "").split(",");
		for(String str:strList){
			RolePermissionBean rolePermissionBean = new RolePermissionBean();
			rolePermissionBean.setRpRoleId(bean.getRoleId());
			PermissionBean permissionBean = roleService.getPermissionIdByName(str);
			rolePermissionBean.setRpPermissionId(permissionBean.getPermissionId());
			roleService.addRolePermission(rolePermissionBean);
		}
		return "success";
	}
	
	/**
	 * @param roleBean
	 * @return
	 * 检查角色名是否重复
	 */
	@RequestMapping("/chackRole.do")
	@ResponseBody
	public String chackRole(RoleBean roleBean){
		RoleBean bean = roleService.getRoleIdByName(roleBean.getRoleName());
		if(bean==null){
			return "success";
		}
		return "fail";
	}
	/**
	 * @param roleBean
	 * @return
	 * 检查角色名是否重复
	 */
	@RequestMapping("/chackRoleUodate.do")
	@ResponseBody
	public String chackRoleUpdate(RoleBean roleBean){
		RoleBean bean = roleService.getRoleIdByName(roleBean.getRoleName());
		if(bean==null){
			return "success";
		}else if(bean!=null&&roleBean.getRoleId().equals(bean.getRoleId())){
			return "success";
		}else{
			return "fail";
		}
	}
	/**
	 * @param id
	 * @param response
	 * 根据id查询角色
	 */
	@RequestMapping("/getRoleJson.do")
	@ResponseBody
	public void getRoleById(Integer id,HttpServletResponse response){
		RoleBean roleBean = roleService.getRoleById(id);
		Gson gson = new Gson();
		String json = gson.toJson(roleBean);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * @param id
	 * @return
	 * 根据id删除角色
	 */
	@RequestMapping("/deleteRole.do")
	@ResponseBody
	public String deleteRole(Integer id){
		roleService.deleteRole(id);
		return "success";
	}
	/**
	 * @param id
	 * @param roleBean
	 * @return
	 * 修改角色
	 */
	@RequestMapping("/getRole.do")
	@ResponseBody
	public String updateRole(String json,HttpServletRequest request,Integer id,RoleBean roleBean){
		/*Gson gson = new Gson();
		System.out.println(gson.toJson(json));*/
		String[] strList = json.substring(1, json.length()-1).replace("\"", "").split(",");
		roleService.deletePermissionByrpRoleId(id);
		for(String str:strList){
			RolePermissionBean bean = new RolePermissionBean();
			bean.setRpRoleId(id);
			PermissionBean permissionBean = roleService.getPermissionIdByName(str);
			bean.setRpPermissionId(permissionBean.getPermissionId());
			roleService.addRolePermission(bean);
		}
		roleBean.setRoleId(id);
		roleService.updateRole(roleBean);
		return "success";
	}
	
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取权限列表
	 */
	@RequestMapping("/permissionList.do")
	public String getPermissionList(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = roleService.getPermissionCount();
		List<PermissionBean> permissionList = roleService.getPermissionList(pageno);
		model.addAttribute("roleList", permissionList);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/user/permission_list";
	}
	/**
	 * @param permissionBean
	 * @return
	 * 添加权限
	 */
	@RequestMapping("/addPermission.do")
	@ResponseBody
	public String addPermssion(PermissionBean permissionBean){
		roleService.addPermission(permissionBean);
		return "success";
	}
	/**
	 * @param id
	 * @param response
	 * 根据id查询权限
	 */
	@RequestMapping("/getPermissionJson.do")
	@ResponseBody
	public void getPermissionById(Integer id,HttpServletResponse response){
		PermissionBean permissionBean = roleService.getPermissionById(id);
		Gson gson = new Gson();
		String json = gson.toJson(permissionBean);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param id
	 * @return
	 * 根据id删除权限
	 */
	/*@RequestMapping("/deletePermission.do")
	@ResponseBody
	public String deletePermission(Integer id){
		roleService.deletePermission(id);
		return "success";
	}*/
	/**
	 * @param id
	 * @param permissionBean
	 * @return
	 * 修改权限
	 */
	@RequestMapping("/getPermission.do")
	@ResponseBody
	public String updatePermission(Integer id,PermissionBean permissionBean){
		permissionBean.setPermissionId(id);;
		roleService.updatePermission(permissionBean);
		return "success";
	}
	
	/**
	 * @param roleName
	 * @param response
	 * 根据角色获得权限
	 */
	@RequestMapping("/getPermissionList.do")
	@ResponseBody
	public void getPermissionNameByRoleName(String roleName,HttpServletResponse response){
		List<String> strList = userService.getPermissionByRole(roleName);
		System.out.println(strList);
		if(strList!=null){
			Set<String> strSet = new HashSet<>();
			strSet.addAll(strList);
			Gson gson = new Gson();
			UserRolePermDTO dto = new UserRolePermDTO();
			dto.setPermList(strSet);
			String strGson = gson.toJson(dto);
			response.setContentType("text/html;charset=UTF-8");
			try {
				response.getWriter().write(strGson);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * @param pageno
	 * @param model
	 * @return
	 * 获取用户列表
	 */
	@RequestMapping("/userList.do")
	public String getUserList(Integer pageno,Model model){
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		int count = userService.getUserCount();
		List<LoginUserBean> userList = userService.getUserList(pageno);
		List<RoleBean> roleList = roleService.getRoleListAll();
		model.addAttribute("userList", userList);
		model.addAttribute("roleList", roleList);
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/user/user_list";
	}
	
	/**
	 * @param roleBean
	 * @return
	 * 检查用户名是否重复
	 */
	@RequestMapping("/chackUser.do")
	@ResponseBody
	public String chackUser(LoginUserBean userBean){
		LoginUserBean bean = userService.getUser(userBean);
		if(bean==null){
			return "success";
		}
		return "fail";
	}
	/**
	 * @param userBean
	 * @return
	 * 在修改页面检查用户名是否重复
	 */
	@RequestMapping("/chackUserUpdate.do")
	@ResponseBody
	public String chackUserUPdate(LoginUserBean userBean){
		LoginUserBean bean = userService.getUser(userBean);
		if(bean==null){
			return "success";
		}else if(bean!=null&&bean.getUserName().equals(userBean.getUserName())){
			return "success";
		}else {
			return "fail";
		}
	}
	/**
	 * @param typeName
	 * @param response
	 * 获取用户角色
	 */
	@RequestMapping("/getRoleName.do")
	@ResponseBody
	public void getRoleName(String typeName,HttpServletResponse response){
		List<RoleBean> roleNameList = roleService.getRoleNameListByType(typeName);
		Gson gson = new Gson();
		String json = gson.toJson(roleNameList);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param id
	 * @return
	 * 删除角色
	 */
	@RequestMapping("/deleteUser.do")
	@ResponseBody
	public String deleteUser(Integer id){
		userService.deleteUserById(id);
		return "success";
	}
	/**
	 * @param bean
	 * @param roleBean
	 * @param userImage2
	 * @param request
	 * @return
	 * 增加用户信息
	 */
	@RequestMapping("/addUser.do")
	public String addUserInfo(LoginUserBean bean,RoleBean roleBean,MultipartFile userImage2,HttpServletRequest request){
		userService.insertUsertInfo(bean, userImage2, request);
		if(roleBean.getRoleType()!=null&&roleBean.getRoleType()!=null&&roleBean!=null&&!"请选择".equals(roleBean.getRoleName())&&!"请选择".equals(roleBean.getRoleType())){
			RoleBean beans = roleService.getRoleIdByName(roleBean.getRoleName());
			LoginUserBean loginUserBean = userService.getUserInfoByName(bean.getUserName());
			UserRoleBean userRoleBean = new UserRoleBean();
			userRoleBean.setUrRoleId(beans.getRoleId());
			userRoleBean.setUrUserId(loginUserBean.getUserId());
			roleService.addUserRole(userRoleBean);
		}
		return "background/user/user_list";
	}
	/**
	 * @param id
	 * @param model
	 * @return
	 * 获取用户信息传到修改页面
	 */
	@RequestMapping("/userUpdateGetInfo.do")
	public String userUpdate(Integer id,Model model){
		LoginUserBean userBean = userService.getUserById(id);
		List<String> userRoleList = userService.getRoleByName(userBean.getUserName());
		if(userRoleList!=null&&userRoleList.size()!=0){
			RoleBean roleBean = roleService.getRoleIdByName(userRoleList.get(0));
			model.addAttribute("userRoleList", userRoleList);
			model.addAttribute("roleBean", roleBean);
		}
		List<RoleBean> roleList = roleService.getRoleListAll();
		model.addAttribute("roleList", roleList);
		model.addAttribute("userBean", userBean);
		return "background/user/add_user";
	}
	/**
	 * @param roleBean
	 * @param id
	 * @param loginUserBean
	 * @param userImage2
	 * @param request
	 * @return
	 * 保存用户信息修改
	 */
	@RequestMapping("/userUpdateSave.do")
	public String userUpdateSave(RoleBean roleBean,Integer id,LoginUserBean loginUserBean,MultipartFile userImage2,HttpServletRequest request){
		userService.updateUserSave(id, loginUserBean, userImage2, request);
		if(roleBean.getRoleType()!=null&&roleBean.getRoleType()!=null&&roleBean!=null&&!"请选择".equals(roleBean.getRoleName())&&!"请选择".equals(roleBean.getRoleType())){
			RoleBean bean = roleService.getRoleIdByName(roleBean.getRoleName());
			UserRoleBean userRoleBean = new UserRoleBean();
			userRoleBean.setUrUserId(id);
			userRoleBean.setUrRoleId(bean.getRoleId());
			roleService.deleteRoleByurRoleId(id);
			roleService.addUserRole(userRoleBean);
		}
		return "background/user/user_list";
	}
	
	/**
	 * @param id
	 * @param model
	 * @return
	 * 用户信息
	 */
	@RequestMapping("/userDetails.do")
	public String userDetails(Integer id,Model model){
		LoginUserBean userBean = userService.getUserById(id);
		List<String> userRoleList = userService.getRoleByName(userBean.getUserName());
		if(userRoleList!=null&&userRoleList.size()!=0){
			RoleBean roleBean = roleService.getRoleIdByName(userRoleList.get(0));
			List<String> permissionStr = userService.getPermissionByRole(userRoleList.get(0));
			model.addAttribute("roleBean", roleBean);
			model.addAttribute("permissionStr", permissionStr);
			model.addAttribute("userRoleList", userRoleList);
		}
		model.addAttribute("userBean", userBean);
		return "background/user/user_info";
	}
	@ResponseBody
	@RequestMapping("/userStatusUpdate.do")
	public String userStatusUpdate(LoginUserBean userBean){
		userService.updateStatusById(userBean);
		return "success";
	}
	/**
	 * @param id
	 * @param model
	 * @return
	 * 用户信息
	 */
	@RequestMapping("/myDetails.do")
	public String myDetails(String name,Model model){
		LoginUserBean userBean = userService.getUserInfoByName(name);
		List<String> userRoleList = userService.getRoleByName(name);
		if(userRoleList!=null&&userRoleList.size()!=0){
			RoleBean roleBean = roleService.getRoleIdByName(userRoleList.get(0));
			List<String> permissionStr = userService.getPermissionByRole(userRoleList.get(0));
			model.addAttribute("roleBean", roleBean);
			model.addAttribute("permissionStr", permissionStr);
			model.addAttribute("userRoleList", userRoleList);
		}
		model.addAttribute("userBean", userBean);
		return "background/user/myinfo";
	}
	
}
