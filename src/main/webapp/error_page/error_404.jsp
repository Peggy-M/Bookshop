<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%String basePath = request.getContextPath(); %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="zh_CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>页面没有找到！！！</title>
	
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			background: #efefef;
			font-family: Georgia, Times, Verdana, Geneva, Arial, Helvetica,
				sans-serif;
		}
		#mother {
			margin: 100px auto auto auto;
			width: 943px;
			height: 572px;
			position: relative;
		}
		#errorBox {
			background: url(<%=basePath %>/error_page/404_bg.png) no-repeat top left;
			width: 943px;
			height: 572px;
			margin: auto;
		}
		#errorText {
			color: #39351e;
			padding: 146px 0 0 446px
		}
		#errorText p {
			width: 303px;
			font-size: 14px;
			line-height: 26px;
		}
		.link { /*background:#f90;*/
			height: 50px;
			width: 145px;
			float: left;
		}
		#home {
			margin: 20px 0 0 444px;
		}
		#contact {
			margin: 20px 0 0 25px;
		}
		h1 {
			font-size: 40px;
			margin-bottom: 35px;
		}
</style>
</head>
	<body>
		<div id="mother">
			<div id="errorBox">
				<div id="errorText">
					<h1>Sorry..页面没有找到！</h1>
					<p>
						似乎你所寻找的网页已移动或丢失了。
						<p>或者也许你只是键入错误了一些东西。</p>
						请不要担心，这没事。如果该资源对你很重要，请与管理员联系。
					</p>

					<p>
						火星不太安全，我可以免费送你回地球
					</p>
				</div>
				<a href="<%=basePath %>/frontbook/home" title="点击返回首页">
					<div class="link" id="home"></div>
				</a>
				<a href="javascript:void(0);" title="联系管理员">
					<div class="link" id="contact"></div>
				</a>
			</div>
		</div>
	</body>
</html>