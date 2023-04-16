<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<% String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书商城后台管理系统登陆</title>
</head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<%=basePath %>/img/logo.png"/>
    <title>物资管理调度系统</title>
    <link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
    <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
    <style>
        html,body {
            height: 100%;
        }
        .box {
            /*filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /!*  IE *!/*/
            /*background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/
            /*background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/
            /*background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/
            /*background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/
            /*background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);*/
            background-image:url("<%=basePath %>/img/bg-login.png");
            background-repeat: no-repeat;
            background-size: 100%;
            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }
        .login-box {
            width: 100%;
            max-width:500px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }
        @media screen and (min-width:500px){
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width:500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }
        .login-content {
            height: 300px;
            width: 100%;
            max-width:500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }


        .input-group {
            margin: 0px 0px 30px 0px !important;
        }
        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }
        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }
        .login-title h1 {
            margin-top: 10px !important;
        }
        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }
        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }
        .text-white{
            color: white;
        }
    </style>
    <script type="text/javascript">
		function init(){
			if(window.top.location!=window.self.location){
				window.top.location = window.self.location;
			}
		}
		init();
	</script>
</head>
<body>
<div class="box">
    <br/>
    <h1 class="text-center text-white"><span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;图书商城管理系统</h1>
    <div class="login-box">
        <div class="login-title text-center">
            <h1><small>登录</small></h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="username" class="form-control" placeholder="用户名">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" id="password" name="password" class="form-control" placeholder="密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-4 " style="margin: 0 37%;">
                            <a  class="btn btn-sm btn-info">
                            	<span class="glyphicon glyphicon-off"></span> 
                            	<input class="btn btn-sm btn-info" type="button" value="登陆" id="back_submit">
                            </a>
                        </div>
                    </div>
                   <!--  <div class="form-group">
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin">
                            	<small>忘记密码？</small> 
                            	<a data-toggle="modal" data-target="#add1" id="add_role_layers" style="cursor: pointer;">
                            		<small>找回</small>
                            	</a>
         					</p>
                        </div> -->
                        <!-- <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>还没注册?</small> <a href="register.html" ><small>注册</small></a>
                            </p>
                        </div> -->
		        	</form>
             	</div>
            </div>
        </div>
    </div>

<script src="<%=basePath %>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath %>/js/bootstrap.js"></script>
<script>
    /*Bootlint工具用于对页面中的HTML标签以及Bootstrapclass的使用进行检测
    (function () {
        var s = document.createElement("script");
        s.onload = function () {
            bootlint.showLintReportForCurrentDocument([]);
        };
        s.src = "js/bootlint.js";
        document.body.appendChild(s)
    })();*/
</script>
<script type="text/javascript">
		$("#back_submit").click(function (){
	    	 var userPasswordVal = $("#password").val();
	    	 var userNameVal = $("#username").val();
	    		if(userNameVal==""){
	    			alert("用户名不能为空,请重新填写");
	    			return;
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
	    					window.location.href="<%=basePath %>/background/index.jsp";
	     					}else if(data == "fail"){
	     						alert("此账户已被锁，请联系管理员");
	     					}else{
	    						alert("用户名或密码错误,请重新输入");
	    					}
	    				}) 
	    	}});
		</script>
</body>
</html>