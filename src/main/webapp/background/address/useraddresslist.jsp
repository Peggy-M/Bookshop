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
<title>用户地址列表</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>

<body>
<table class="table table-bordered table-striped text-center bg-info">
                <br/>
				<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">收货人</th>
         <th class="text-center">所在地区</th>
         <th class="text-center">详细地址</th>
         <th class="text-center">手机号</th>
         <th class="text-center">邮政编号</th>
         <th class="text-center">用户ID</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${addressList}" var="address">
      <tr>
        <td>${address.addressId}</td>
        <td>${address.addressUserName}</td>
        <td>${address.addressArea}</td>
        <td>${address.addressDetails}</td>
        <td>${address.addressPhone}</td>
        <td>${address.addressPostcode}</td>
        <td>${address.addressUserId}</td>
        <td>
           <a href="javascrip:void(0);" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit">查看</a>
           <shiro:hasRole name="超级管理员">
           <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${address.addressId})">删除</a>
           </shiro:hasRole>
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
				<li><a href="<%=basePath%>/address/useraddress.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/address/useraddress.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/address/useraddress.do?pageno=${pageno+1}">&raquo;</a></li>
				  </c:if>
				  
				  <c:if test="${pageno >= count}">
				  <li class="disabled"><a>&raquo;</a></li>
				  </c:if>
			</ul>
		</div>

<script type="text/javascript">

//确认删除
function deleteItem(item,id){
	var bool = window.confirm("确定删除吗？" + item)
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/address/delete.do?id="+id;
		}
	}

</script>
</body>
</html>