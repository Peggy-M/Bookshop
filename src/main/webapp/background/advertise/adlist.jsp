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
<table class="table table-bordered table-striped text-center bg-info">
                <br/>
                <div class="input-group line left">
                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
                    <input name="typeFirstId" id="typeFirstId" type="text" class="form-control" placeholder="输入发布日期搜索" aria-describedby="basic-addon2">
                </div>
                <a onclick="query(typeFirstId)" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
                <a href="<%=basePath%>/background/advertise/adwrite.jsp" class=" btn btn-primary " target="content">添加</a>
                 
				<br/>
				<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">公告标题</th>
         <th class="text-center">发布时间</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${advertiseList}" var="adver">
      <tr>
        <td>${adver.adId}</td>
        <td>${adver.adTitle}</td>
        <td>${adver.adPublishTime}</td>
        <td>
           <a href="<%=basePath%>/advertise/adshow.do?id=${adver.adId}" class="btn btn-primary btn-sm" data-toggle="modal">查看</a>
           <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${adver.adId})">删除</a>
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
				<li><a href="<%=basePath%>/advertise/adlist.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/advertise/adlist.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/advertise/adlist.do?pageno=${pageno+1}">&raquo;</a></li>
				  </c:if>
				  
				  <c:if test="${pageno >= count}">
				  <li class="disabled"><a>&raquo;</a></li>
				  </c:if>
			</ul>
		</div>

<script type="text/javascript">

//确认删除
function deleteItem(item,adId){
	var bool = window.confirm("确定删除吗？" + item)
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/advertise/delete.do?adId="+adId;
		}
	}


</script>
</body>
</html>