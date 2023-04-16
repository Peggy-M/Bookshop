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
			window.location.href = "<%=basePath %>/role/permissionList.do";
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
    <shiro:hasRole name="超级管理员">
    <a href="#" class=" btn btn-primary " data-toggle="modal" data-target="#add1">添加</a>
     <!--添加-->
	    <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title" id="add11">添加权限</h4>
	                </div>
	                <form id="addinfo">
	                <div class="modal-body">
	                    <ul>
	                        <li>
	                            <label><span>权限名称 </span></label>
	                            <input name="permissionName" type="text" id="add_permission_name"/>
	                        </li>
	                        <li>
	                            <label><span>权限描述 </span></label>
	                            <input name="permissionDetails" type="text" id="add_permission_details"/>
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
        </shiro:hasRole>
	<br/>
	<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">权限名称</th>
         <th class="text-center">权限描述</th>
         <shiro:hasRole name="超级管理员">
         	<th class="text-center">操作</th>
         </shiro:hasRole>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${roleList}" var="roleList">
      <tr>
        <td>${roleList.permissionId}</td>
        <td>${roleList.permissionName}</td>
        <td>${roleList.permissionDetails}</td>
        <shiro:hasRole name="超级管理员">
        <td>
           <a href="javascrip:void(0);" role="form" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit${roleList.permissionId}" onclick="updateRole(this,${roleList.permissionId})">编辑</a>
           <!--修改-->
           <div class="modal fade" id="edit${roleList.permissionId}" tabindex="-1" role="dialog" aria-labelledby="edit">
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
                                                <label><span>权限名称</span></label>
                                                <input name="permissionName" id="permission_name${roleList.permissionId}" type="text"/>
                                            </li>
                                            <li>
                                                <label><span>权限描述 </span></label>
                                                <input name="permissionDetails" id="permission_details${roleList.permissionId}" type="text"/>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                    </form>
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button onclick="updateroleInfo(this,${roleList.permissionId})" class="btn btn-primary btn-sm">保存</button>
                                </div>
                            </div>
                        </div>
           
          <%--  <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${roleList.permissionId})">删除</a> --%>
        </td>
        </shiro:hasRole>
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
				<li><a href="<%=basePath%>/role/permissionList.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/role/permissionList.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/role/permissionList.do?pageno=${pageno+1}">&raquo;</a></li>
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
})
//新增确认提交
	$("#add_role_submit").click(function(){
		var roleTypeVal = $("#add_permission_name").val();
		var roleNameVal = $("#add_permission_details").val();
		if(roleTypeVal!=null&&roleTypeVal!=""){
			if(roleNameVal!=null&&roleNameVal!=""){
				var bool = window.confirm("确认提交吗？");
				if (bool){
				$.post(
					"<%=basePath%>/role/addPermission.do",
					{
						permissionName:roleTypeVal,
						permissionDetails:roleNameVal
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
	});
//删除
<%-- function deleteItem(item,roleId){
	var bool = window.confirm("确定删除吗？" + item);
	if (bool){
		var aTag = item;
		$.post(
				"<%=basePath%>/role/deletePermission.do?id="+roleId,
			{
					
			},function(data){
				alert(data);
				window.location.reload();
			})
		}
	}; --%>
//编辑添加原信息
function updateRole(item,roleId){
	$.post(
		"<%=basePath %>/role/getPermissionJson.do?id="+roleId,
			{
				
			},
			function(data){
				var json = $.parseJSON(data);
				$("#permission_name"+roleId).val(json.permissionName);
				$("#permission_details"+roleId).val(json.permissionDetails);
			});
}


//编辑确认提交
function updateroleInfo(item,roleId){
	var roleTypeVal = $("#permission_name"+roleId).val();
	var roleNameVal = $("#permission_details"+roleId).val();
	if(roleTypeVal!=null&&roleTypeVal!=""){
		if(roleNameVal!=null&&roleNameVal!=""){
			var bool = window.confirm("确认提交吗？");
			if (bool){
			$.post(
				"<%=basePath%>/role/getPermission.do?id="+roleId,
				{
					permissionName:roleTypeVal,
					permissionDetails:roleNameVal
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
};
</script>
</body>
</html>