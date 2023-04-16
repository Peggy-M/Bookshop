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
<title>一级类目</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>
<body>
	<c:if test="${null==roleList}">
		<script type="text/javascript">
			window.location.href = "<%=basePath %>/role/roleList.do";
		</script>
	</c:if> 
<table class="table table-bordered table-striped text-center bg-info">
    <br/>
    <div class="input-group line left">
        <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
        <input type="text" class="form-control" placeholder="输入关键字搜索" aria-describedby="basic-addon2">
    </div>
     <select class="form-control line left">
        <option></option>
    </select>
    <a href="#" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
    <a href="#" class=" btn btn-primary "><span class="glyphicon glyphicon-download"></span></a>
    <shiro:hasPermission name="新增职位">
    <a class=" btn btn-primary " data-toggle="modal" data-target="#add1" id="add_role_layers">添加</a>
     <!--添加-->
	    <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title" id="add11">添加职位</h4>
	                </div>
	                <form id="addinfo">
	                <div class="modal-body">
	                    <ul>
	                        <li>
	                            <label><span>部门名称 </span></label>
	                            <input name="roleType" type="text" id="add_role_type"/>
	                        </li>
	                        <li>
	                            <label><span>职位名称 </span></label>
	                            <input name="roleName" type="text" id="add_role_name"/>
	                            <p id="role_chack" style="margin-left: 70px;"></p>
	                        </li>
	                        <br/>
	                        <li style="height: 64px;">
	                            <label><span>权限选择 </span></label>
	                            <c:forEach items="${permissionList}" var="permissionList">
	                            	<input type="checkbox" name="permissionName" value="${permissionList.permissionName}" style="width: 10px;">
	                            	<span  style="width: 10px;">${permissionList.permissionName} </span>
	                            </c:forEach>
	                        </li>
	                    </ul>
	                </div>
	              </form>
	                <div class="modal-footer">
	                    <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
	                    <button id="add_role_submit" class="btn btn-primary btn-sm">提交</button>
	               </div>
                </div>
            </div>
        </div>
        </shiro:hasPermission>
	<br/>
	<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">部门</th>
         <th class="text-center">职位</th>
         <th class="text-center" style="width: 450px;">权限</th>
         <shiro:hasPermission name="修改职位">
         	<th class="text-center">操作</th>
         </shiro:hasPermission>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${roleList}" var="rolelist">
      <tr>
        <td>${rolelist.roleId}</td>
        <td>${rolelist.roleType}</td>
        <td>${rolelist.roleName}</td>
        <td>
        <c:forEach var="DTOs" items="${userRolePermDTOs}">
        	<c:forEach var="roles" items="${DTOs.roles }">
        		<c:if test="${rolelist.roleName==roles}">
        			<c:forEach var="permList" items="${DTOs.permList}">
        				${permList},
        			</c:forEach>
        		</c:if>
        	</c:forEach>
        </c:forEach>
        </td>
        <shiro:hasPermission name="修改职位">
        <td>
           <a role="form" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit${rolelist.roleId}" onclick="updateRoles(this,${rolelist.roleId})">编辑</a>
           <!--修改-->
           <div class="modal fade" id="edit${rolelist.roleId}" tabindex="-1" role="dialog" aria-labelledby="edit">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel1">编辑</h4>
                                    </div>
                                    <form>
                                    <div class="modal-body">
                                        <ul>
                                            <li>
                                                <label><span>部门名称</span></label>
                                                <input name="roleType" id="role_typr${rolelist.roleId}" type="text"/>
                                            </li>
                                            <li>
                                                <label><span>人员职位 </span></label>
                                                <input name="roleName" id="roel_name${rolelist.roleId}" type="text" onblur="roleNameChack(${rolelist.roleId})"/>
                                                <p id="role_update_chack${rolelist.roleId}"></p>
                                            </li>
                                             <br/>
                                             <li style="height: 64px;">
                                                <label><span>权限选择 </span></label>
                                                <c:forEach items="${permissionList}" var="permissionList">
                                                	<input type="checkbox" name="permissionNameUpdate${rolelist.roleId}" value="${permissionList.permissionName}${rolelist.roleId}" style="width: 10px;" class="permission_class_name${rolelist.roleId}">
                                                	<span  style="width: 10px;">${permissionList.permissionName} </span>
                                                </c:forEach>
                                            </li>
                                        </ul>
                                    </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button onclick="updateroleInfo(this,${rolelist.roleId})" class="btn btn-primary btn-sm">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
           
           <%-- <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${rolelist.roleId})">删除</a> --%>
        </td>
        </shiro:hasPermission>
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
				<li><a href="<%=basePath%>/role/roleList.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/role/roleList.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/role/roleList.do?pageno=${pageno+1}">&raquo;</a></li>
				  </c:if>
				  
				  <c:if test="${pageno >= count}">
				  <li class="disabled"><a>&raquo;</a></li>
				  </c:if>
			</ul>
		</div>

<script type="text/javascript">
//添加编辑模态框
$('#add').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var recipient = button.data('whatever');
    var modal = $(this);
    modal.find('.modal-title').text('' + recipient);
    modal.find('.modal-body input').val(recipient)
});
	//角色名验证
	$("#add_role_name").blur(function(){
		$("#role_chack").html("");
		var name = $.trim($("#add_role_name").val());
		if(name!=null&&name!=""){
			$.post(
			    "<%=basePath %>/role/chackRole.do",
		   		{
		   			roleName:name,
	    		},
	    		function(data){
	    			if(data == "success"){
	    				$("#role_chack").html("角色名验证通过");
	    				$("#role_chack").css("color","#bcbcbc");
	     			}else{
	     				$("#role_chack").html("角色名验证不通过");
	     				$("#role_chack").css("color","red");
		    		}
		    	}) 
		}
	});
	//角色名更新验证
	function roleNameChack(id){
		$("#role_update_chack"+id).html("");
		var name = $.trim($("#roel_name"+id).val());
		if(name!=null&&name!=""){
			$.post(
			    "<%=basePath %>/role/chackRoleUodate.do",
		   		{
		   			roleName:name,
		   			roleId:id
	    		},
	    		function(data){
	    			if(data == "success"){
	    				$("#role_update_chack"+id).html("角色名验证通过");
	    				$("#role_update_chack"+id).css("color","#bcbcbc");
	     			}else{
	     				$("#role_update_chack"+id).html("角色名验证不通过");
	     				$("#role_update_chack"+id).css("color","red");
		    		}
		    	}) 
		}
	};
	//清空弹窗
	$("#add_role_layers").click(function(){
		$("#add_role_type").val("");
		$("#add_role_name").val("");
		$("#role_chack").html("");
		$(":checkbox[name='permissionName']").removeAttr("checked");
	});
//新增确认提交
	$("#add_role_submit").click(function(){
		var roleTypeVal = $.trim($("#add_role_type").val());
		var roleNameVal = $.trim($("#add_role_name").val());
		var name = $.trim($("#role_chack").html());
		var permissionVal = $(":checkbox[name='permissionName']:checked").map(function(){
	         return $(this).val();
	     }).get();
		var json = JSON.stringify(permissionVal);
		if(name!="角色名验证不通过"&&name!=null&&name!=""){
			if(roleTypeVal!=null&&roleTypeVal!=""){
				if(roleNameVal!=null&&roleNameVal!=""){
				var bool = window.confirm("确认提交吗？");
					if (bool){
					$.post(
						"<%=basePath%>/role/addRole.do",
						{
							roleType:roleTypeVal,
							roleName:roleNameVal,
							json:json
						},function(data){
							alert(data);
							window.location.reload();
						});
					}
				}else{
					alert("职位不能为空,请重新输入");
				}
			}else{
				alert("部门不能为空,请重新输入");
			}
		}else{
			alert("职位不能重复,请重新输入");
		}
	});
//删除
function deleteItem(item,roleId){
	var bool = window.confirm("确定删除吗？" + item);
	if (bool){
		var aTag = item;
		$.post(
				"<%=basePath%>/role/deleteRole.do?id="+roleId,
			{
					
			},function(data){
				alert(data);
				window.location.reload();
			})
		}
	};
//编辑添加原信息
function updateRoles(item,roleId){
	$.post(
		"<%=basePath %>/role/getRoleJson.do",
			{
				id:roleId
			},
			function(data){
				/* $("[name='permissionNameUpdate"+roleId+"']").removeAttr("checked"); */
				/* $(".permission_class_name"+roleId).removeAttr("checked"); */
				var json = $.parseJSON(data);
				$("#role_typr"+roleId).val(json.roleType);
				$("#roel_name"+roleId).val(json.roleName);
				$.post(
					"<%=basePath %>/role/getPermissionList.do",
					{
						roleName:$("#roel_name"+roleId).val(),
						id:roleId
					},
					function(data){
						var jsonNew = $.parseJSON(data);
						var str = jsonNew.permList;
					    for(var i=0;i<str.length;i++){
					        $(":checkbox[value='"+str[i]+roleId+"']").attr("checked",true);
						 }; 
					});
			});
};

//编辑确认提交
function updateroleInfo(item,roleId){
	var roleTypeVal = $.trim($("#role_typr"+roleId).val());
	var roleNameVal = $.trim($("#roel_name"+roleId).val());
	var permissionVal = $(":checkbox[name='permissionNameUpdate"+roleId+"']:checked").map(function(){
         return $(this).next().text();
     }).get();
	var json = JSON.stringify(permissionVal);
	var name = $.trim($("#role_update_chack"+roleId).html());
	if(roleTypeVal!=null&&roleTypeVal!=""){
		if(roleNameVal!=null&&roleNameVal!=""){
			if(name!="角色名验证不通过"){
				if(json!=""&&json!="[]"&&json!=null){
					var bool = window.confirm("确认提交吗？");
					if (bool){
						$.post(
							"<%=basePath%>/role/getRole.do",
							{
								roleType:roleTypeVal,
								roleName:roleNameVal,
								json:json,
								id:roleId
							},function(data){
								alert(data);
								window.location.reload();
							}
						);
					}
				}else{
					alert("权限不能为空,请重新输入");
				}
			}else{
				alert("职位不能重复,请重新输入");
			}
		}else{
			alert("职位不能为空,请重新输入");
		}
	}else{
		alert("部门不能为空,请重新输入");
	}
};
</script>
</body>
</html>