<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<% String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户注册_提交注册信息_图书书城 </title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/login.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/reset.css">
		<script type="text/javascript" src="<%=basePath %>/js/jquery-1.2.6.min.js.下载"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath %>/js/jquery.form.js.下载"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath %>/js/Register.js"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath %>/js/login.js"></script>
		<link href="<%=basePath %>/css/header.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="login-top contain">
			<div class="fr">已有账号&nbsp;<a href="<%=basePath %>/front/login&register/front_login.jsp">请登录</a></div>
			<a href=""><img src="<%=basePath %>/img/20161208022939348.jpg" width="200" height="30" alt="广购书城" border="0"></a>
			<span>欢迎注册广购书页！尽享多重优惠服务。</span>
		</div>
		<div class="contain">
			<div class="register">
				<div class="pLeft">
					<form style="margin:0;">
						<input type="hidden" name="parentId" value="">
						<input type="hidden" name="userMID" value="0">
						<input type="hidden" value="" name="returnUrl" id="returnUrlT">
						<input type="hidden" name="isUseEmail" value="true">
						<div class="item">
							<span><em>*</em>&nbsp;用户名</span>
							<input type="text" id="Email" name="Email" onfocus="showMsg(&#39;emailMsg&#39;);">
							<p class="emailMsg" id="emailMsg"><i></i>用户名，用于密码找回</p>
						</div>
						<div class="item">
							<span><em>*</em>&nbsp;设置密码</span>
							<input type="password" name="password" id="password" onblur="checkPwd1();" onfocus="showMsg(&#39;pwdMsg&#39;);">
							<p class="pwdMsg" id="pwdMsg"><i></i>您的密码可以由大小写英文字母、数字组成，长度6-16</p>
						</div>
						<div class="item">
							<span><em>*</em>&nbsp;确认密码</span>
							<input type="password" name="password2" id="password2" onblur="checkPwd2();">
							<p class="pwd1Msg" id="pwd1Msg"><i></i>您输入的密码不一样，请重新输入！</p>
						</div>
						<div class="item">
							<span>手机号码</span>
							<input type="text" placeholder="建议使用常用手机" id="MobilePhone" name="MobilePhone">
							<p><em>温馨提示：</em>填写手机号码后将收到我们的促销短信、发货通知</p>
						</div>
						<div class="item">
							<span><em>*</em>&nbsp;手机验证码</span>
							<input style="display: inline;width:103px;" type="text" placeholder="请输入验证码" id="validateCode" name="validateCode" onblur="checkMobileCode();">
							<input style="display: inline;width:160px;" id="zphone" type="button" value=" 发送手机验证码 " onClick="get_mobile_code();">
							<p id="code_chack_view">手机验证码验证</p>
							<input type="hidden" id="mobile_code_hid">
							<%-- <script type="text/javascript">
							function changeCode() {
								var i = Math.random();			
								var url = '<%=basePath%>/code/ValidateCode?id='+i;
								$('#ValidateCode').attr('src',url);
							}
							</script> --%>
						</div>
						<div class="item">
							<label>
							<input type="checkbox" checked="checked" onclick="validateInput(this);" id="protocolCheckbox">&nbsp;&nbsp;<a href="">我已阅读并同意《广购书业服务条款》</a>
							</label>
						</div>
						<div class="item">
							<input class="submit" type="button" value="立即注册" id="register_submit">
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			//用户名验证
			$("#Email").blur(function(){
				$("#emailMsg").html("用户名，用于密码找回");
				var name = $.trim($("#Email").val());
				if(name!=null&&name!=""){
					$.post(
					    "<%=basePath %>/user/check",
					   		{
					   			userName:name,
				    		},
				    		function(data){
				    			if(data == "success"){
				    				$("#emailMsg").html("用户名验证通过");
				    				$("#emailMsg").css("color","#bcbcbc");
				     			}else{
				     				$("#emailMsg").html("用户名验证不通过");
				     				$("#emailMsg").css("color","red");
					    		}
					    	}) 
				}
			});
			$("#register_submit").click(function (){
					var name = $.trim($("#Email").val());
					var password = $.trim($("#password").val());
					var password2 = $.trim($("#password2").val());
					var phone = $.trim($("#MobilePhone").val());
					var chackVal = $("#code_chack_view").html();
					if(chackVal!=null&&chackVal!=""&&chackVal!="验证码错误"&&chackVal!="手机验证码验证"){
						if($("#emailMsg").html()=="用户名验证通过"&&name!=null){
							if($("#pwdMsg").html()!="密码长度必须为6-16个字符，请重新输入！"&&password!=null){
								if($("#pwd1Msg").html()!="您输入的密码不一样，请重新输入！"&&password2!=null&&password==password2){
									if(null!=phone&&phone!=""){
										 $.post(
									    	"<%=basePath %>/user/register",
									    		{
									    			userName:name,
									    			userPassword:password,
									    			userPhone:phone
									    		},
									    		function(data){
									    			if(data == "success"){
									    				window.location.href="<%=basePath %>/frontbook/home";
									     			}else{
									    				alert("注册失败");
									    			}
									    		}) 
									}else{
										alert("手机号不能为空，请重新输入");
									}
								}else{
									alert("两次密码不一致，请重新输入");
								}
							}else{
								alert("密码格式不正确，请重新填写");
							}
						}else{
							alert("用户名重复，请重新填写");
						}
					}else{
						alert("短信验证码错误，请重新填写");
					}
			});
			//发送验证码请求
			function get_mobile_code(){
				var mobileVal = jQuery.trim($('#MobilePhone').val());
				if(mobileVal!=null&&mobileVal!=""){
			        $.post('<%=basePath %>/user/mobileChack', 
			        		{
			        			mobile:mobileVal
			        		}, 
			        function(msg) {
						if(msg!=null&&msg!=""){
							RemainTime();
							$("#mobile_code_hid").val(msg);
						}else{
							$("#code_chack_view").html("验证码发送失败，请检查手机号是否正确");
							$("#code_chack_view").css("color","red");
						}
			        });
				}else{
					alert("手机号不可为空");
				}
			};
			var iTime = 59;
			var Account;
			function RemainTime(){
				document.getElementById('zphone').disabled = true;
				var iSecond,sSecond="",sTime="";
				if (iTime >= 0){
					iSecond = parseInt(iTime%60);
					iMinute = parseInt(iTime/60)
					if (iSecond >= 0){
						if(iMinute>0){
							sSecond = iMinute + "分" + iSecond + "秒";
						}else{
							sSecond = iSecond + "秒";
						}
					}
					sTime=sSecond;
					if(iTime==0){
						clearTimeout(Account);
						sTime='获取手机验证码';
						iTime = 59;
						document.getElementById('zphone').disabled = false;
					}else{
						Account = setTimeout("RemainTime()",1000);
						iTime=iTime-1;
					}
				}else{
					sTime='没有倒计时';
				}
				document.getElementById('zphone').value = sTime;
			}
		function checkMobileCode(){
			$("#code_chack_view").html("手机验证码验证");
			var codeVal = $("#mobile_code_hid").val();
			var codeNewVal = $("#validateCode").val();
			if(codeVal!=null&&codeNewVal!=null&&codeNewVal!=""&&codeVal!=""){
				if(codeVal==codeNewVal){
					$("#code_chack_view").html("验证码成功");
				}else{
					$("#code_chack_view").html("验证码错误");
					$("#code_chack_view").css("color","red");
				}
			}
		}
		</script>
	</body>
</html>