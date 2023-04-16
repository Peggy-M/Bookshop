<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新增公告</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/layer/skin/default/layer.css" media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
<script src="<%=basePath %>/layer/layer.js"></script>
<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
 <style type="text/css">
 .top{
 	margin-top: 30px;
 }
  .top2{
 	margin-top: 15px;
 }
 </style>
</head>

<body>
    <!-- Main Content -->
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
                <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
                <!-- NOTE: To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
                    <form action="<%=basePath%>/advertise/add.do" method="post" id="contentForm">
			    		<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">公告标题:</span>
						  <input id="adTitle" name="adTitle" type="text" class="form-control" placeholder="标题" aria-describedby="basic-addon1" maxlength="40">
						</div>
						  <p id="mes" style="color:red;font-size: 12px" ></p>
						<br/>
			    		<textarea id="adContent" name="adContent" rows="40" class="col-sm-12"></textarea>
			    		<input type="hidden" id="#" name="#">
			    		
			    	 </form>
			    	 <input class="btn btn-primary btn-sm" type="button" value="提交" onclick="submit2()"/>
			    	 <input class="btn btn-primary btn-sm" type="button" value="取消" onclick="javascript:history.back()"/>
            </div>
        </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy; Your Website 2017</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery Version 3.1.1 -->
    
    <!-- Contact Form JavaScript -->
    <script src="<%=basePath %>/js/jqBootstrapValidation.js"></script>
    <script src="<%=basePath %>/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="<%=basePath %>/js/clean-blog.min.js"></script>

    <script src="<%=basePath %>/js/ckeditor.js"></script>
    
    
    <script type="text/javascript">
    			
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                var editor = CKEDITOR.replace('adContent',{ height: '440px' });

                function submit2(){

                	var title = $("#adTitle").val();
                	var content = CKEDITOR.instances.adContent.getData();
                	if (title == ""){
                    	alert("标题不能为空");
                    	return;
                    } else if(content == ""){
                    	alert("内容不能为空");
                    	return;
                    }
                	
                    $("#contentForm").submit();
           }
           
    </script>
</body>

</html>
