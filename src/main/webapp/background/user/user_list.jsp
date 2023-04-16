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
	<title>公告列表</title>
	<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
	<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
	<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>
	<body>
	<c:if test="${null==userList}">
		<script type="text/javascript">
			window.location.href = "<%=basePath %>/role/userList.do";
		</script>
	</c:if> 
		<table class="table table-bordered table-striped text-center bg-info">
	        <br/>
	        <div class="input-group line left">
	            <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
	            <input name="typeFirstId" id="typeFirstId" type="text" class="form-control" placeholder="输入发布日期搜索" aria-describedby="basic-addon2">
	        </div>
	        <a onclick="query(typeFirstId)" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
	        <a class=" btn btn-primary " data-toggle="modal" data-target="#add1" id="add_role_layers">添加</a>
	           <!--添加-->
			    <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
			        <div class="modal-dialog" role="document">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                    <h4 class="modal-title" id="add11">添加用户</h4>
			                </div>
			                <form id="add_user_info" enctype="multipart/form-data" action="<%=basePath %>/role/addUser.do" method="post">
				                <div class="modal-body">
				                    <ul>
				                        <li>
				                            <label><span>用户名称</span></label>
				                            <input name="userName" type="text" id="add_user_name"/>
				                            <p id="role_chack" style="margin-left: 70px;"></p>
				                        </li>
				                        <br/>
				                        <li>
				                            <label><span>用户头像</span></label>
				                            <input name="userImage2" type="file" id="add_user_image" style="display: inline;"/>
				                        </li>
				                        <li>
				                            <label><span>用户电话</span></label>
				                            <input name="userPhone" type="text" id="add_user_phone"/>
				                        </li>
				                        <li>
				                            <label><span>用户邮箱</span></label>
				                            <input name="userEmail" type="text" id="add_user_email"/>
				                        </li>
				                        <li>
				                            <label><span>真实姓名</span></label>
				                            <input name="userRealname" type="text" id="add_user_real_name"/>
				                        </li>
				                        <li>
				                            <label><span>用户状态</span></label>
				                            <select name="userStatus" class="userStatus">
				                            	<option value="1" selected="selected">有效登陆
				                            	<option value="0">禁止登陆
				                            </select>
				                        </li>
				                        <shiro:lacksRole name="人力管理">
				                        <li style="height: 64px;">
				                            <label><span>部门选择 </span></label>
				                            <select class="user_type" name="roleType">
						                         	<option>请选择</option>
													<c:forEach items="${roleList}" var="roleList">
													<option value="${roleList.roleType}">${roleList.roleType}</option>
													</c:forEach>
											</select>
											<label><span>职位选择 </span></label>
											<select class="user_name">
						                         	<option>请选择</option>
											</select>
											<input name="roleName" type="hidden" id="role_name_hid">
				                        </li>
				                        </shiro:lacksRole>
				                    </ul>
				                </div>
			              </form>
			                <div class="modal-footer">
			                    <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
			                    <button id="add_user_submit" class="btn btn-primary btn-sm">提交</button>
			               </div>
		                </div>
		            </div>
		        </div>
			<br/>
			<br/>
			<thead>
		      <tr class="info">
		         <th class="text-center">用户序号</th>
		         <th class="text-center">用户名称</th>
		         <th class="text-center">用户电话</th>
		         <th class="text-center">用户邮箱</th>
		         <th class="text-center">真实姓名</th>
		         <th class="text-center">注册时间</th>
		         <th class="text-center">用户状态</th>
		         <th class="text-center">操作</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${userList}" var="userList">
		      <tr>
		        <td>${userList.userId}</td>
		        <td><a href="<%=basePath%>/role/userDetails.do?id=${userList.userId}">${userList.userName}</a></td>
		        <td>${userList.userPhone}</td>
		        <td>${userList.userEmail}</td>
		        <td>${userList.userRealname}</td>
		        <td>${userList.userRegisterTime}</td>
		        <c:if test="${userList.userStatus==1}">
		        	<td>登陆有效</td>
		        </c:if>
		        <c:if test="${userList.userStatus==0}">
		        	<td>登陆禁止</td>
		        </c:if>
		        <td>
		           <a class="btn btn-primary btn-sm" href="<%=basePath %>/role/userUpdateGetInfo.do?id=${userList.userId}">编辑</a>
		           <%-- <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${userList.userId})">删除</a> --%>
		           <c:if test="${userList.userStatus==1}">
		           	<a class="btn btn-primary btn-sm" onclick="updateStatusItem(this,${userList.userId},${userList.userStatus})">禁止登陆</a>
		           </c:if>
		           <c:if test="${userList.userStatus==0}">
		           	<a class="btn btn-primary btn-sm" onclick="updateStatusItem(this,${userList.userId},${userList.userStatus})">解禁登陆</a>
		           </c:if>
		        </td>
		      </tr>
		      </c:forEach>
		      
		</table>
	      <!-- Pager -->
	                    
	      <div class="pagination" style="float: right;">
				<ul class="pagination right">
					<c:if test="${pageno <= 1}">
					<li class="disabled"><a>&laquo;</a></li>
					</c:if>
					
					<c:if test="${pageno >1}">
					<li><a href="<%=basePath%>/role/userList.do?pageno=${pageno-1}">&laquo;</a></li>
					</c:if>
					
					<c:forEach var="item" begin="1" end="${count }" step="1">
						<c:choose>
						    <c:when test="${item==pageno }">
						    <li class="active"><a>${item }</a></li>
						    </c:when>
						    <c:otherwise>
						    <li><a href="<%=basePath%>/role/userList.do?pageno=${item}">${item }</a></li>
						    </c:otherwise>
						</c:choose>
						    	
					</c:forEach>
					  <c:if test="${pageno < count}">
					  <li><a href="<%=basePath%>/role/userList.do?pageno=${pageno+1}">&raquo;</a></li>
					  </c:if>
					  
					  <c:if test="${pageno >= count}">
					  <li class="disabled"><a>&raquo;</a></li>
					  </c:if>
				</ul>
			</div>
	
		<script type="text/javascript">
		//用户名验证
		$("#add_user_name").blur(function(){
			var name = $.trim($("#add_user_name").val());
			if(name!=null&&name!=""){
				$.post(
			    "<%=basePath %>/role/chackUser.do",
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
		//清空添加窗
		$("#add_role_layers").click(function(){
			$("#add_user_name").val("");
			$("#add_user_image").val("");
			$("#add_user_phone").val("");
			$("#add_user_email").val("");
			$("#role_name_hid").val("");
			$(".userStatus").val("1");
			$("#add_user_real_name").val("");
			$(".user_type").val("请选择");
			$(".user_name").val("请选择");
			$("#role_chack").html("");
		});
		//将职位信息存入input标签
		$(".user_name").change(function(){
			var roleNameVal =$(".user_name").find("option:selected").text();
			$("#role_name_hid").val(roleNameVal);
		});
		//确认删除
		function deleteItem(item,userId){
			var bool = window.confirm("确定删除吗？" + item)
			if(bool){
				$.post(
			    "<%=basePath%>/role/deleteUser.do",
			   		{
			   			id:userId
		    		},
		    		function(data){
						alert(data);
						window.location.reload();
					});
				}
			};
		//新增
		$("#add_user_submit").click(function(){
			var roleNameVal =$(".user_type").find("option:selected").text();
			var userNameVal = $.trim($("#add_user_name").val());
			var userPhoneVal = $.trim($("#add_user_phone").val());
			var roleNameHidVal = $.trim($("#role_name_hid").val());
			var userImageVal = $.trim($("#add_user_image").val());
			var userEmailVal = $.trim($("#add_user_email").val());
			var userRealnameVal = $.trim($("#add_user_real_name").val());
			var roleChackVal = $("#role_chack").html();
			if(null!=roleChackVal&&roleChackVal!=""&&roleChackVal!="用户名验证不通过"){
				if(null!=userNameVal&&userNameVal!=""){
					if(null!=userPhoneVal&&userPhoneVal!=""&&userPhoneVal.match(/^\d+$/)){
						if(null!=userImageVal&&userImageVal!=""){
							if(null!=userEmailVal&&userEmailVal!=""){
								if(null!=userRealnameVal&&userRealnameVal!=""){
									var bool = window.confirm("确定新增吗？")
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
							alert("图像不能为空");
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
		function updateStatusItem(item,userId,userStatus){
			
			var bool = window.confirm("确定修改状态吗？")
			if(bool){
				$.post(
			    "<%=basePath%>/role/userStatusUpdate.do",
			   		{
			    		userStatus:userStatus,
			   			userId:userId
		    		},
		    		function(data){
						alert(data);
						window.location.reload();
					});
				}
		}
		</script>
	</body>
</html>