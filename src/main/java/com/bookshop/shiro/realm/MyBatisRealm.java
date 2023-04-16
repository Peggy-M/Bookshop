package com.bookshop.shiro.realm;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.bookshop.mongod.dao.IMongoDao;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.bean.UserRolePermDTO;
import com.bookshop.user.service.IUserService;

/**
 * @author 
 *	提供数据
 */
public class MyBatisRealm extends AuthorizingRealm {
	private IUserService UserServiceImpl;
	@Autowired
	public void setUserServiceImpl(IUserService userServiceImpl) {
		UserServiceImpl = userServiceImpl;
	}
//	private IMongoDao dao;
	@Autowired
//	public void setDao(IMongoDao dao) {
//		this.dao = dao;
//	}
	@Override
	public String getName() {
		return "MyBatisRealm";
	}
	
	/*
	 * 用来查询用户角色和权限
	 * 此方法执行条件：对角色或者权限进行校验时会触发执行
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Iterator<String> iterator = principals.iterator();
		String name = iterator.next();
//		UserRolePermDTO dto = dao.findRoleAndPerm(name);
		Set<String> roleSet = null;
		Set<String> permSet = new HashSet<>();
		/*if(null == dto){
			List<String> roleList = UserServiceImpl.getRoleByName(name);
			roleSet = new HashSet<String>(roleList);
			for(String roleBean:roleSet){
				List<String> permList = UserServiceImpl.getPermissionByRole(roleBean);
				permSet.addAll(permList);
			}
			UserRolePermDTO userRolePermDTO = new UserRolePermDTO();
			userRolePermDTO.setUserName(name);
			userRolePermDTO.setPermList(permSet);
			userRolePermDTO.setRoles(roleSet);
			dao.insert(userRolePermDTO);
		}else{
			//如果mongodb里面有数据
			roleSet = dto.getRoles();
			permSet = dto.getPermList();
		}*/
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setRoles(roleSet);
			info.setStringPermissions(permSet);
			return info;
		}

	/*
	 * 查询并提供用户信息
	 * 参数：传递进来的用户名和密码
	 * 返回值：登录成功返回用户信息AuthenticationInfo
	 * 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken userTaken = (UsernamePasswordToken) token;
		String password = new String(userTaken.getPassword());
		String userName = userTaken.getUsername();
		LoginUserBean loginUserBean = new LoginUserBean();
		loginUserBean.setUserName(userName);
		loginUserBean.setUserPassword(password);
		LoginUserBean userBean = UserServiceImpl.getUser(loginUserBean);
		if(null!=userBean){
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);
			userBean.setLastLoginTime(time);
			UserServiceImpl.updateLoginTime(userBean);
			ByteSource credentialsSalt = ByteSource.Util.bytes(userBean.getUserName());
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userBean.getUserName(),userBean.getUserPassword(),credentialsSalt, "MyBatisRealm");
			return info;
		}
		return null;
	}

}
