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
<title>订单列表</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>

<body>
<table class="table table-bordered table-striped text-center bg-info">
                <br/>
                <div class="input-group line left">
                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
                    <input name="id" id="id" type="text" class="form-control" placeholder="输入用户ID搜索" aria-describedby="basic-addon2">
                </div>
                <a onclick="query()" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
				<br/>
				<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">订单号</th>
         <th class="text-center">下单时间</th>
         <th class="text-center">订单金额(元)</th>
         <th class="text-center">订单状态</th>
         <th class="text-center">送货方式</th>
         <th class="text-center">收获地址ID</th>
         <th class="text-center">用户ID</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${orderList}" var="order">
      <tr>
        <td>${order.orderId}</td>
        <td><a href="<%=basePath%>/order/getOrderDetails.do?id=${order.orderId}">${order.orderNumber}</a></td>
        <td>${order.orderCreateTime}</td>
        <td>${order.orderPrice/100}</td>
        <td>${order.orderStatus}</td>
       <c:forEach items="${comList}" var="comList">
        	<c:if test="${comList.companyCom==order.orderDeliver}">
        		<td>${comList.companyName}</td>
        	</c:if>
        </c:forEach>
        <td>${order.orderAddressId}</td>
        <td>${order.orderUserId}</td>
        <td>
        <shiro:hasRole name="超级管理员">
           <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${order.orderId})">删除</a>
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
				<li><a href="<%=basePath%>/order/allorderlist.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/order/allorderlist.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/order/allorderlist.do?pageno=${pageno+1}">&raquo;</a></li>
				  </c:if>
				  
				  <c:if test="${pageno >= count}">
				  <li class="disabled"><a>&raquo;</a></li>
				  </c:if>
			</ul>
		</div>
<script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script> 
	<script type="text/javascript">
	var goEasy = new GoEasy({ 
	    appkey: 'BC-18bbf5b2eff64b288fdb86f0a4a210d1' 
	});
	goEasy.subscribe({ 
	    channel: 'my_channel', 
	    onMessage: function(message){ 
	        alert('Meessage received:'+message.content); 
	    } 
	}); 
	
	</script>
<script type="text/javascript">

//确认删除
function deleteItem(item,id){
	var bool = window.confirm("确定删除吗？" + item)
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/order/delete.do?id="+id;
		}
	}

//根据用户ID查询所有订单
function query(){
	var userId = $("#id").val();
	window.location.href="<%=basePath%>/order/orderlist.do?userId="+userId;
}
</script>
</body>
</html>