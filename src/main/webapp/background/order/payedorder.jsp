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
<c:if test="${null==orderList}">
		<script type="text/javascript">
			window.location.href = "<%=basePath %>/order/payedOrder.do";
		</script>
	</c:if> 
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
         <th class="text-center">物流单号</th>
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
        <td>${order.orderBak}</td>
        <td>
       <%--  <shiro:hasRole name="超级管理员">
           <a class="btn btn-primary btn-sm" onclick="query(this,${order.orderDeliver})">查询物流详情</a>
        </shiro:hasRole> --%>
         <a href="#" class=" btn btn-primary " data-toggle="modal" data-target="#add1${order.orderId}">添加物流单号</a>
                 <!--添加-->
                        <div class="modal fade" id="add1${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="add11">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="add11">添加</h4>
                                    </div>
                                    <form>
                                    <div class="modal-body">
                                        <ul>
                                            <li>
                                                <label><span>物流单号</span></label>
                                                <input name="orderBak" type="text" id="order_bak${order.orderId}"/>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button  onclick="updateBak(this,${order.orderId})" class="btn btn-primary btn-sm">提交</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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
				<li><a href="<%=basePath%>/order/payedOrder.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/order/payedOrder.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/order/payedOrder.do?pageno=${pageno+1}">&raquo;</a></li>
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

<%-- //确认删除
function query(item,bak){
	
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/order/delete.do?id="+id;
		}
	} --%>
//保存订单号
	function updateBak(item,id){
		var bakVal = $("#order_bak"+id).val();
		if(bakVal!=null&&bakVal!=""){
			var bool = window.confirm("确定保存吗？");
			if (bool){
				$.post(
					"<%=basePath%>/order/updateBak.do",
					{
						orderId:id,
						orderBak:bakVal
					},
					function(data){
						if(data=="success"){
							alert("保存成功");
							window.location.reload();
						}
					}
				);
			}
		}else{
			alert("物流单号不能为空，请重新输入");
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