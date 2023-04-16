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
<title>图书管理</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/layer/skin/default/layer.css" media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<c:if test="${null==bookList}">
		<script type="text/javascript">
			window.location.href = "<%=basePath %>/book/status0list";
		</script>
	</c:if> 
	<table class="table table-bordered table-striped text-center bg-info">
            <br/>
                <div class="input-group line left">
                    <span class="input-group-addon" id="basic-addon2">
                    	<span class="glyphicon glyphicon-search"></span>
                    </span>
                    <input type="text" class="form-control" placeholder="输入关键字搜索" aria-describedby="basic-addon2">
                </div>
                 <select class="form-control line left">
                    <option></option>
                </select>
                <a href="#" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
                <a href="#" class=" btn btn-primary "><span class="glyphicon glyphicon-download"></span></a>
                <a href="<%=basePath%>/book/add" class=" btn btn-primary " target="content">添加</a>
                <br/>
                <br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center" style="width: 130px;">图书名称</th>
         <th class="text-center">图书封面</th>
         <th class="text-center">图书作者</th>
         <!-- <th class="text-center">图书详情</th> -->
         <th class="text-center">出版社</th>
         <th class="text-center">出版时间</th>
       <!--   <th class="text-center">图书版次 </th>
         <th class="text-center">图书开本</th>
         <th class="text-center">图书定价</th>
         <th class="text-center">图书售价</th>
         <th class="text-center">图书进货价</th>
         <th class="text-center">录入日期 </th> -->
         <th class="text-center">一级分类</th>
         <th class="text-center">二级分类</th>
         <th class="text-center">三级分类</th>
         <th class="text-center">图书库存</th>
         <!-- <th class="text-center">图书ISBN</th> -->
         <th class="text-center">状态</th>
         <th class="text-center">销量</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${bookList}" var="list">
      <tr style="height: 100px;">
        <td>${list.bookId}</td>
        <td  style="width: 130px;"><a href="<%=basePath%>/book/bookDetails?id=${list.bookId}">${list.bookName}</a></td>
        <td><a class="btn" href="<%=basePath%>/book/bookDetails?id=${list.bookId}">
        	<img alt="图书封面" src="<%=basePath%>/${list.bookCover}" width="70px" height="70px"></a></td>
        <td>${list.bookAuthor}</td>
       <%--  <td>${list.bookdetails}</td> --%>
        <td>${list.bookPress}</td>
        <td>${list.bookPblishTime}</td>
        <%-- <td>${list.bookEdition}</td>
        <td>${list.bookSize}</td>
        <td>${list.bookPrice}</td>
        <td>${list.bookSellPrice}</td>
        <td>${list.bookPrimeCost}</td>
        <td>${list.bookPrimeDate}</td> --%>
        <c:forEach items="${firstList}" var="firstList">
        	<c:if test="${firstList.typeId==list.bookTyprFirst}">
        		<td>${firstList.typeName}</td>
        	</c:if>
        </c:forEach>
        <c:forEach items="${secondList}" var="secondList">
        	<c:if test="${secondList.typeId==list.bookTypeSecond}">
        		<td>${secondList.typeName}</td>
        	</c:if>
        </c:forEach>
        <c:forEach items="${thirdList}" var="thirdList">
        	<c:if test="${thirdList.typeId==list.bookTypeThird}">
        		<td>${thirdList.typeName}</td>
        	</c:if>
        </c:forEach>
        <%-- <td>${list.bookTypeSecond}/${list.bookTypeThird}</td> --%>
		<td>${list.bookNumber}</td>
        <%--<td>${list.bookISBN}</td> --%>
        <c:if test="${list.bookStatus==0}">
        	<td>普通</td>
        </c:if>
        <c:if test="${list.bookStatus==1}">
        	<td>预售</td>
        </c:if>
        <c:if test="${list.bookStatus==2}">
        	<td>精选</td>
        </c:if>
        <c:if test="${list.bookStatus==3}">
        	<td>特惠</td>
        </c:if>
        <c:if test="${list.bookStatus==4}">
        	<td>畅销</td>
        </c:if>
        <c:if test="${list.bookStatus==6}">
        	<td>网购爆品</td>
        </c:if>
        <c:if test="${list.bookStatus==7}">
        	<td>热卖图书</td>
        </c:if>
        <c:if test="${list.bookStatus==8}">
        	<td>限时抢购</td>
        </c:if>
        <c:if test="${list.bookStatus==9}">
        	<td>热评商品</td>
        </c:if>
        <td>${list.bookSales}</td> 
        <td>
           <%-- <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${list.bookId})"><span>删除图书</span></a> --%>
           <a class="btn btn-primary btn-sm"  href="<%=basePath%>/book/bookupdate?id=${list.bookId}"><span>编辑图书</span></a>
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
				<li><a href="<%=basePath%>/book/list?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/book/list?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/book/list?pageno=${pageno+1}">&raquo;</a></li>
				  </c:if>
				  
				  <c:if test="${pageno >= count}">
				  <li class="disabled"><a>&raquo;</a></li>
				  </c:if>
			</ul>
		</div>
<script src="<%=basePath %>/layer/layer.js"></script>
<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript">

//确认删除
<%-- function deleteItem(item,bookId){
	var bool = window.confirm("确定删除吗？" + item);
	if (bool){
		var aTag = item;
		$.post(
				"<%=basePath%>/book/deleteBook?id="+bookId,
			{
					
			},function(data){
				alert(data);
				window.location.reload();
			})
		}
	}; --%>
		  /* var active = {
				confirmTrans: function(){
				    //配置一个透明的询问框
				    layer.msg('大部分参数都是可以公用的<br>合理搭配，展示不一样的风格', {
				      time: 20000, //20s后自动关闭
				      btn: ['明白了', '知道了', '哦']
				    });
				  }
		    } */
		  /* $('#book_details_lay').on('click', function(){
			  layer.open({
			  type: 1,
			  area: ['600px', '360px'],
			  shadeClose: false, //点击遮罩关闭
			  content:'<input type="file"><textarea autofocus>在 w3school.com.cn，您将学会如何开发网站。我们提供全面的免费 web 技术教程</textarea> '
			  });
			  //CKEDITOR.replace('bookdetails',{ height: '200px' });
			}); */
		  /*layui.use('upload', function(){
			  layui.upload({
			    url: '' //上传接口
			    ,success: function(res){ //上传成功后的回调
			      console.log(res)
			    }
			  }}); */
</script>
</body>
</html>