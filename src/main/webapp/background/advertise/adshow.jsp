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
<script type="text/javascript">
//确认删除
function deleteItem(adId){
	var bool = window.confirm("确定删除吗？")
	if (bool){
		var adId = $("#adId").val();
		window.location.href = "<%=basePath%>/advertise/delete.do?adId="+adId;
		}
	}
</script>
</head>

<body >
	<br/>
	<div style="background-color: #FFFFFF">
    <!-- Page Header -->
    <header class="intro-header" >
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="post-heading">
                        <h1>${advertise.adTitle}</h1>
                        <input type="hidden" value="${advertise.adId}" id="adId">
                        <hr>
                        <span class="meta">发布时间： ${advertise.adPublishTime }</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    ${advertise.adContent}
                </div>
            </div>
    		<div style="float: right"><a style="cursor:pointer" href="<%=basePath%>/advertise/requestupdate.do?id=${advertise.adId}">修改</a>/<a style="cursor:pointer" onclick="deleteItem(adId)">删除</a></div>
        </div>
    </article>
    </div>

</body>
</html>
