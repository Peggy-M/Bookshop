package com.bookshop.user.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.bookshop.user.bean.LoginUserBean;
import com.bookshop.user.dao.IUserDao;
import com.bookshop.user.service.IUserService;
@Service
public class UserServiceImpl implements IUserService{
	private IUserDao userDao;
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	@Autowired
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	public LoginUserBean getUser(LoginUserBean userBean) {
		return userDao.getUserByNamePassword(userBean);
	}
	public List<String> getRoleByName(String name) {
		return userDao.getRoleByName(name);
	}
	public List<String> getPermissionByRole(String role) {
		return userDao.getPermissionByrole(role);
	}
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void insertUser(LoginUserBean userBean) {
		String hashAlgorithmName = "MD5";
		Object credentials = userBean.getUserPassword();
		ByteSource salt = ByteSource.Util.bytes(userBean.getUserName());
		int hashIterations = 1024;
		SimpleHash simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		userBean.setUserPassword(simpleHash.toString());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		userBean.setUserStatus(1);
		userBean.setUserRegisterTime(time);
		userDao.insertUser(userBean);
	}
	@Transactional(isolation=Isolation.SERIALIZABLE)
	public void updateLoginTime(LoginUserBean userBean) {
		userDao.updateLoginTime(userBean);
	}
	@Override
	public LoginUserBean getUserInfoByName(String name) {
		return userDao.getUserInfoByName(name);
	}
	@Override
	public List<LoginUserBean> getUserList(Integer pageno) {
		return userDao.getUserList(pageno);
	}
	@Override
	public void updatePasswordById(LoginUserBean userBean) {
		String hashAlgorithmName = "MD5";
		Object credentials = userBean.getUserPassword();
		ByteSource salt = ByteSource.Util.bytes(userBean.getUserName());
		int hashIterations = 1024;
		SimpleHash simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		userBean.setUserPassword(simpleHash.toString());
		userDao.updatePasswordById(userBean);
	}
	@Override
	public void updateUserInfoById(LoginUserBean userBean) {
		userDao.updateUserInfoById(userBean);
	}
	@Override
	public void deleteUserById(Integer id) {
		userDao.deleteUserById(id);
	}
	@Override
	public Integer getUserCount() {
		return userDao.getUserCount();
	}
	@Override
	public void insertUsertInfo(LoginUserBean bean,MultipartFile userImage2,HttpServletRequest request) {
		String filename = userImage2.getOriginalFilename();
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
		String userImagePath = "/upload/"+date+"/"+filename;
		
		//本地文件路径
		String filePath = locationUploadDir+File.separator+filename;
		
		
		File localfile = new File(filePath);
		try {
			userImage2.transferTo(localfile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String hashAlgorithmName = "MD5";
		Object credentials = "123456";
		ByteSource salt = ByteSource.Util.bytes(bean.getUserName());
		int hashIterations = 1024;
		SimpleHash simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		System.out.println(simpleHash);
		bean.setUserPassword(simpleHash.toString());
		bean.setUserImage(userImagePath);
		Date date1 = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date1);
		bean.setUserRegisterTime(time);
		userDao.insertUsertInfo(bean);
	}
	@Override
	public LoginUserBean getUserById(Integer id) {
		return userDao.getUserById(id);
	}
	@Override
	public void updateUserSave(Integer id,LoginUserBean loginUserBean, MultipartFile userImage2, HttpServletRequest request) {
		String filename = userImage2.getOriginalFilename();
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
		String userImagePath = "/upload/"+date+"/"+filename;
		
		//本地文件路径
		String filePath = locationUploadDir+File.separator+filename;
		
		
		File localfile = new File(filePath);
		LoginUserBean bean = userDao.getUserById(id);
		if(null!=filename&&filename!=""){
			try {
				userImage2.transferTo(localfile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			loginUserBean.setUserImage(userImagePath);
		}else{
			loginUserBean.setUserImage(bean.getUserImage());
		}
		if(null==loginUserBean.getUserPassword()||loginUserBean.getUserPassword()==""){
			loginUserBean.setUserPassword(bean.getUserPassword());
		}else{
			String hashAlgorithmName = "MD5";
			Object credentials = loginUserBean.getUserPassword();
			ByteSource salt = ByteSource.Util.bytes(loginUserBean.getUserName());
			int hashIterations = 1024;
			SimpleHash simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
			loginUserBean.setUserPassword(simpleHash.toString());
		}
		loginUserBean.setUserId(id);
		userDao.updateUserInfoById(loginUserBean);
	}
	@Override
	public void updateStatusById(LoginUserBean userBean) {
		if(userBean.getUserStatus()==1){
			userBean.setUserStatus(0);
		}else{
			userBean.setUserStatus(1);
		}
		userDao.updateStatusById(userBean);
	}
	@Override
	public String mobileChack(String mobile,String content) {
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");
	    String code ="";
		NameValuePair[] data = {//提交短信
				new NameValuePair("account", "C76454430"), 
			    new NameValuePair("password", "500ee9455c76555b39b10cd15e3cbdfc"), //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", mobile), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();

			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;	
		
	}

	@Override
	public String getPhoneByName(String name) {
		return userDao.getPhoneByName(name);
	}

	@Override
	public Integer getStatusByName(String name) {
		return userDao.getStatusByName(name);
	}
}
	
