<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <%-- <link href="<%=basePath %>/css/main.css" rel="stylesheet"> --%>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<div class="container">
		  <div class="form-group">
		    <label for="exampleInputEmail1">收 货 人：</label>
		    <input type="text" id="addressName" class="form-control" id="exampleInputEmail1" placeholder="">
		  </div>
		  <div class="form-inline">
		    <label for="exampleInputPassword1">所在地区：</label>
			  <div data-toggle="distpicker">
				<div class="form-inline col-xs-4">
				  <label class="sr-only" for="province1">Province</label>
				  <select class="form-control" id="province1"></select>
				</div>
				<div class="form-inline col-xs-4">
				  <label class="sr-only" for="city1">City</label>
				  <select class="form-control" id="city1"></select>
				</div>
				<div class="form-inline col-xs-4">
				  <label class="sr-only" for="district1">District</label>
				  <select class="form-control" id="district1"></select>
				</div>
			  </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">详细地址：</label>
		    <input type="text" id="addressDetail" class="form-control" id="exampleInputEmail1" placeholder="">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">手机号码：</label>
		    <input type="text" id="phoneNumber" class="form-control" id="exampleInputEmail1" placeholder="">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">邮政编码：</label>
		    <input type="text" id="postalcode" class="form-control" id="exampleInputEmail1" placeholder="">
		  </div>
		  <button id="submit" type="button" class="btn btn-primary btn-lg btn-block">新增</button>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>/js/distpicker.data.js"></script>
    <script src="<%=basePath %>/js/main.js"></script>
    <script src="<%=basePath %>/js/distpicker.js"></script>
    
    <script type="text/javascript">
    	$('#submit').click(function() {
    		var addressName = $.trim($('#addressName').val());	//收货人
    		var province1 = $.trim($('#province1 option:selected').val());	//省
    		var city1 = $.trim($('#city1 option:selected').val());	//市
    		var district1 = $.trim($('#district1 option:selected').val());	//区
    		var addressDetail = $.trim($('#addressDetail').val());	//详细地址
    		var phoneNumber = $.trim($('#phoneNumber').val());	//手机号码
    		var postalcode = $.trim($('#postalcode').val());	//邮政编码
    		var result = addressName==""||province1==""||city1==""||district1==""||addressDetail==""||phoneNumber==""||postalcode=="";
    		if (result==true) {
    			alert('收货信息不全');
			}else {
    			var url = '<%=basePath%>/address/addressadd.do';
    			var addressArea = province1+city1+district1;
				$.post(
					url,
					{
						addressUserName:addressName,
						addressArea:addressArea,
						addressDetails:addressDetail,
						addressPhone:phoneNumber,
						addressPostcode:postalcode
					},
					function(data) {
						if (data=='success') {
							alert('新增成功');							
							window.parent.close();
						}
					}
				);
			}
		});
    </script>
  </body>
</html>