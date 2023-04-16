<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<% String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网上购书商城登陆界面</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/login.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/reset.css">
		<script type="text/javascript" src="<%=basePath %>/js/jquery-1.2.6.min.js.下载"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath %>/js/jquery.form.js.下载"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath %>/js/login.js"></script>
		<link href="<%=basePath %>/css/header.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="login-top contain">
		<a href="<%=basePath %>/frontbook/home" class="rback">&lt;&lt;返回首页</a>
		<a href="<%=basePath %>/frontbook/home">
			<img src="<%=basePath %>/img/20161208022939348.jpg" width="200" height="30" alt="购书商城" border="0">
		</a>
		 
		 
		<span>欢迎登录</span>
		</div>
		<div class="laybg" >
			<form class="form-login">
				<h6><a href="<%=basePath %>/front/login&register/front_register.jsp" class="fr">立即注册&gt;</a>账户登录</h6>
				<input type="hidden" value="" name="returnUrl" id="returnUrl">
				<input type="hidden" value="0" name="ggq" id="ggq">
			 
				<div class="item">
					<input class="account" type="text" placeholder="账户/邮箱" onfocus="clean(&#39;loginId&#39;)" onblur="review(&#39;loginId&#39;)"  name="userName" id="loginId" style="color: rgb(51, 51, 51);">
				</div>
				<div class="item">
					<input class="password" type="password" placeholder="密码" name="userPassword" id="password">
				</div>
				<div class="item">
					<input class="verify" type="text" style="width:103px;" placeholder="" id="validateCode" name="validateCode">
					<div class="verifyImg">
						<img src="<%=basePath %>/code/ValidateCode" name="ValidateCode" id="ValidateCode" onclick="changeCode()" title="换一张">
					</div>
					<p class="noticeVerfy"><a href="javascript:;" onclick="changeCode()">看不清，换一张</a><span id="check_code_result"></span></p>
					<p class="codeMsg" id="codeMsg"> </p>
					
					<script type="text/javascript">
						function changeCode() {
							var i = Math.random();			
							var url = '<%=basePath%>/code/ValidateCode?id='+i;
							$('#ValidateCode').attr('src',url);
						}
					</script>
				</div>
				<div class="item">
					<a class="fr" href="<%=basePath%>/front/login&register/password.jsp">忘记登录密码?</a>
					<!-- <label>
						<input type="checkbox" name="auto">自动登录
					</label> -->
				</div>
				<div class="item">
				<input class="submit" type="button" value="登录" id="login_submit">
				</div>
				<!-- <div class="item itemPay">
				<a href="http://www.gg1994.com/alipay_union_login/alipay_auth_authorize.jsp"><i class="alipay"></i>支付宝登录</a>
			</div> -->
			</form>
		</div>
		<%-- <iframe id="loginIfram" name="loginIfram" style="display:none;" onload="loginIfrm()" src="<%=basePath %>/saved_resource.html"></iframe>
		 
		<div id="footer">
		 
		 <style type="text/css">#myfooter{text-align:center;margin:20px 0px;}#myfooter a:link,#myfooter a:visited{color:#333;text-decoration:none;}#myfooter a:hover{color:#c00;text-decoration:underline;}#myfooter a:active{color:#900;}</style>
		<div id="myfooter"> 
		<div style="margin: 15px 0px 10px; text-align: center">友情链接：<a href="http://www.gzxhcbfx.com/" target="_blank">广州新华出版发行集团</a>&nbsp;| <a href="http://www.yangchengbookfair.com/" target="_blank">广州新华书店</a>&nbsp;| <a href="http://book.sina.com.cn/" target="_blank">新浪读书</a>&nbsp;|&nbsp;<a href="http://www.zy.com/" target="_blank">卓越教育</a>&nbsp;|&nbsp;<a href="http://www.bitpress.com.cn/index/dzindex.php" target="_blank">北京理工大学出版社</a>&nbsp;<br>
		&nbsp; <a target="_blank" href="http://www.cqph.com/">重庆出版社</a>&nbsp;|&nbsp;<a target="_blank" href="http://life.szonline.net/">深圳生活指南</a>&nbsp;|&nbsp;<a target="_blank" href="http://www.xmupress.com/">厦门大学出版社</a>&nbsp;|&nbsp;<a target="_blank" href="http://www.zjwycbs.cn/">浙江文艺出版</a>&nbsp;|&nbsp;<a target="_blank" href="http://www.cucp.com.cn/">中国传媒大学出版社</a> |&nbsp;<a target="_blank" href="http://www.bookask.com/">书问搜索</a> |&nbsp;<a target="_blank" href="http://shop.kongfz.com/">购书网站</a> |&nbsp;<a target="_blank" href="http://esf.gz.fang.com/">广州二手房</a> <a target="_blank" href="http://www.gg1994.com/Special/link/">更多-&gt;</a></div>
		<div><a rel="nofollow" href="http://www.gg1994.com/Info/ShowInfo.do?id=898309">关于网站</a> | <a rel="nofollow" href="http://www.gg1994.com/Info/ShowInfo.do?id=898311">公司简介</a>  | <a rel="nofollow" href="http://www.gg1994.com/Info/ShowInfo.do?id=898312">法律声明</a> | <a rel="nofollow" href="http://www.gg1994.com/Info/ShowInfo.do?id=898313">联系我们</a>  </div>
		<div style="margin: 15px 0px 5px; text-align: center">广州购书中心有限公司 版权所有&#169; 2010 经营许可证：粤B2-20040295 <a rel="nofollow" href="http://www.miibeian.gov.cn/" target="_blank">粤ICP备10095868号</a></div>
		  <a rel="nofollow" href="https://ss.knet.cn/verifyseal.dll?sn=2010122200100003455&amp;ct=df&amp;pa=328989"><img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/seallogo.png" alt=""></a>   <a target="_blank" href="http://www.eccsp.org/sitecn/aspx/certificationD.aspx?pid=1222"><img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/startimg.jpg" width="128" height="48" alt=""></a> <img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/footer_img.gif" alt=""> &nbsp;&nbsp; <a rel="nofollow" href="http://www.gzjd.gov.cn/newgzjd/baojing/110.jsp?catid=318" target="_blank"><img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/ktjc.gif" style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px" alt=""> </a><a target="_blank" href="http://www.ghwsx.gov.cn/gholportal/home.aspx"><img width="100" height="75" border="0" longdesc="http://www.ghwsx.gov.cn/gholportal/home.aspx" alt="广货网上行" src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/ghwsxlogo2.jpg"></a>
		<img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/dyh.jpg" width="100px" hight="100px" style="margin-left:0px;">
		<img src="./登录_广购书城 – 广州购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选_files/fwh.jpg" width="100px" hight="100px" style="margin-left:10px;">
		</div>
		      
		</div> --%>
		<script type="text/javascript">
		$("#login_submit").click(function (){
	    	 var userPasswordVal = $.trim($("#password").val());
	    	 var userNameVal = $.trim($("#loginId").val());
	    	 var userCodeVal = $.trim($("#check_code_result").html());
	    	 //验证码
	    	 var validateCodeVal = $("#validateCode").val();
			 $.post(
   				"<%=basePath %>/user/checkCode",
   				{
   					codeVal:validateCodeVal
   				},
   				function(data){
   					if(data == "success"){
	   					$("#check_code_result").html("验证码验证成功");
   						$("#check_code_result").css("color","#bcbcbc");
   						if(userNameVal==""){
   			    			alert("用户名不能为空,请重新填写");
   			    		}else if(userPasswordVal==""){
   			    			alert("密码不能为空,请重新填写");
   			    		}else{ 
   				    		 $.post(
   				    			"<%=basePath %>/user/login",
   				    				{
   				    					userName:userNameVal,
   				    					userPassword:userPasswordVal
   				    				},
   				    				function(data){
   				    					if(data == "success"){
   				    						window.location.href="<%=basePath %>/frontbook/home";
   				     					}else if(data == "fail"){
   				     						alert("此账户已被锁，请联系客服");
   				     					}else{
   				    						alert("用户名或密码错误,请重新输入");
   				    					}
   				    				}); 
   			    		}
    				}else{
    					$("#check_code_result").html("验证码验证错误");
   						$("#check_code_result").css("color","red");
   					}
   				}); 
	    	});
		</script>
	</body>
</html>