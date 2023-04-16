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
                    <form  enctype="multipart/form-data" action="<%=basePath%>/role/userUpdateSave.do?id=${userBean.userId}" method="post" id="add_user_info">
			    		<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户名称:</span>
						  <input name="userName" type="text" id="add_user_name" class="form-control" placeholder="标题" aria-describedby="basic-addon1" maxlength="40" value="${userBean.userName}"/>
				          <p id="role_chack" style="margin-left: 70px;"></p>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户密码:</span>
						  <input name="userPassword" type="password" id="add_user_password" class="form-control" placeholder="密码" aria-describedby="basic-addon1" maxlength="40"/>
				          <p id="role_chack" style="margin-left: 70px;"></p>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户头像:</span>
				          <input name="userImage2" type="file" id="add_user_image" style="display: inline;" class="form-control" aria-describedby="basic-addon1" maxlength="40"/>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户电话:</span>
		                  <input name="userPhone" type="text" id="add_user_phone" class="form-control" placeholder="电话" aria-describedby="basic-addon1" maxlength="40" value="${userBean.userPhone}"/>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">真实姓名:</span>
                          <input name="userRealname" type="text" id="add_user_real_name" class="form-control" placeholder="真实姓名" aria-describedby="basic-addon1" maxlength="40" value="${userBean.userRealname}"/>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户邮箱:</span>
                          <input name="userEmail" type="text" id="add_user_email" class="form-control" placeholder="邮箱" aria-describedby="basic-addon1" maxlength="40" value="${userBean.userEmail}"/>
						</div>
						<div class="input-group">
						  <span class="input-group-addon" id="basic-addon1">用户状态:</span>
						  <select name="userStatus" class="userStatus">
						  <c:choose>
						  	<c:when test="${userBean.userStatus==0}">
                          		<option value="1">有效登陆
                          		<option value="0"  selected="selected">禁止登陆
                          	</c:when>
                          	<c:otherwise>
                          		<option value="1" selected="selected">有效登陆
                          		<option value="0">禁止登陆
                          	</c:otherwise>
                          </c:choose>
                          	
                          </select>
						</div>
						<shiro:lacksRole name="人力管理">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">用户部门:</span>
 						    <select class="user_type" name="roleType">
	                        	<option>请选择</option>
								<c:forEach items="${roleList}" var="roleList">
								<option value="${roleList.roleType}">${roleList.roleType}</option>
								</c:forEach>
						    </select>
						    <input type="hidden" value="${roleBean.roleType }" id="role_name">
						    <span class="input-group-addon" id="basic-addon1">用户职位:</span>
						    <select class="user_name">
	                         	<option>请选择</option>
	                         	<option>${roleBean.roleName}</option>
						    </select>
						    <input name="roleName" type="hidden" id="role_name_hid" value="${roleBean.roleName}">
						    <c:forEach var="userRoleList" items="${userRoleList}">
						    	<input id="user_role" type="hidden" value="${userRoleList}">
						    </c:forEach>						
						</div>
						</shiro:lacksRole>
						<br/>
			    	 </form>
			    	 <input class="btn btn-primary btn-sm" type="button" value="提交" id="user_update_submit"/>
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
        //动态生成职位
  		$(".user_type").change(function(){
      		var roleTypeVal =$(".user_type").find("option:selected").text();
  			$(".user_name").html("<option>请选择</option>");
      		if(roleTypeVal!="请选择"&&roleTypeVal!=null&&roleTypeVal!=""){
      		$.post(
  		    "<%=basePath %>/role/getRoleName.do",
  		   		{
  		   			typeName:roleTypeVal,
  	    		},
  	    		function(data){
  	    			var json = $.parseJSON(data);
  		    		var list = json.roleName;
  					var niw="";
  	    			for(var i=0;i<json.length;i++){
  	    				 niw+="<option>"+json[i].roleName+'</option>';
  	    			}
  	    			$(".user_name").html("<option>请选择</option>"+niw);
  	    			}
  	    			
  		    	) 
  			}
      	});
  		//将职位信息存入input标签
  		$(".user_name").change(function(){
  			var roleNameVal =$(".user_name").find("option:selected").text();
  			$("#role_name_hid").val(roleNameVal);
  		});
  	//用户名验证
		$("#add_user_name").blur(function(){
			$("#role_chack").html("");
			var name = $.trim($("#add_user_name").val());
			if(name!=null&&name!=""){
				$.post(
			    "<%=basePath %>/role/chackUserUpdate.do",
		   		{
		   			userName:name,
	    		},
	    		function(data){
	    			if(data == "success"){
	    				$("#role_chack").html("用户名验证通过");
	    				$("#role_chack").css("color","#bcbcbc");
	     			}else{
	     				$("#role_chack").html("用户名验证不通过");
	     				$("#role_chack").css("color","red");
		    		}
		    	}) 
			}
		});
		//新增
		$("#user_update_submit").click(function(){
			var roleNameVal =$(".user_type").find("option:selected").text();
			var userNameVal = $.trim($("#add_user_name").val());
			var userPhoneVal = $.trim($("#add_user_phone").val());
			var roleNameHidVal = $.trim($("#role_name_hid").val());
			var userImageVal = $.trim($("#add_user_image").val());
			var userEmailVal = $.trim($("#add_user_email").val());
			var userRealnameVal = $.trim($("#add_user_real_name").val());
			var roleChackVal = $("#role_chack").html();
			if(roleChackVal!="用户名验证不通过"){
				if(null!=userNameVal&&userNameVal!=""){
					if(null!=userPhoneVal&&userPhoneVal!=""&&userPhoneVal.match(/^\d+$/)){
						if(null!=userEmailVal&&userEmailVal!=""){
							if(null!=userRealnameVal&&userRealnameVal!=""){
								var bool = window.confirm("确定提交修改吗？")
								if(bool){
									$("#add_user_info").submit();
								}
							}else{
								alert("真实姓名不能为空");
							}
						}else{
							alert("邮箱不能为空");
						}
					}else{
						alert("电话不能为空或格式不正确");
					}
				}else{
					alert("用户名为空");
				}
			}else{
				alert("用户名不能重复");
			}
		});
		if($("#user_role").val()!=null&&$("#user_role").val()!=""){
			var roleTypeValUpdate = $("#user_role").val();
			$(".user_name").val(roleTypeValUpdate);
		}
		if($("#role_name").val()!=null&&$("#role_name").val()!=""){
			var roleNameValUpdate = $("#role_name").val();
			$(".user_type").val(roleNameValUpdate);
		}
    </script>
</body>

</html>
