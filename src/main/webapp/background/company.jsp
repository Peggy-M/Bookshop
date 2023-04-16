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
<title>物流公司列表</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>

<body>
<c:if test="${null==CompanyList}">
		<script type="text/javascript">
			window.location.href = "<%=basePath %>/order/companyList.do";
		</script>
	</c:if> 
<table class="table table-bordered table-striped text-center bg-info">
                <br/>
                <div class="input-group line left">
                    <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
                    <input type="text" class="form-control" placeholder="输入关键字搜索" aria-describedby="basic-addon2">
                </div>
                <a href="#" class=" btn btn-primary "><span class="glyphicon glyphicon-search"></span></a>
                <a href="#" class=" btn btn-primary " data-toggle="modal" data-target="#add1">添加</a>
                 <!--添加-->
                        <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="add11">添加</h4>
                                    </div>
                                    <form id="addinfo" role="form" action="<%=basePath%>/order/addcompany.do" method="post">
                                    <div class="modal-body">
                                        <ul>
                                            <li>
                                                <label><span>公司名称 </span></label>
                                                <input name="companyName" type="text" id="company_name"/>
                                            </li>
                                            <li>
                                                <label><span>公司代码 </span></label>
                                                <input name="companyCom" type="text" id="company_com"/>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button onclick="addinfo()" class="btn btn-primary btn-sm">提交</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                

				<br/>
				<br/>
	<thead>
      <tr class="info">
         <th class="text-center">序号</th>
         <th class="text-center">公司名称</th>
         <th class="text-center">公司代码</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${CompanyList}" var="CompanyList">
      <tr>
      	<td>${CompanyList.companyId}</td>
        <td>${CompanyList.companyName}</td>
        <td>${CompanyList.companyCom}</td>
        <td>
           <a href="javascrip:void(0);" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit${CompanyList.companyId}" onclick="getCompany(this,${CompanyList.companyId})">编辑</a>
           <!--修改-->
           <div class="modal fade" id="edit${CompanyList.companyId}" tabindex="-1" role="dialog" aria-labelledby="edit">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="edit" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel1">编辑</h4>
                                    </div>
                                    <form>
                                    <div class="modal-body">
                                        <ul>
                                            <li>
                                                <label><span>公司名称 </span></label>
                                                <input id="company_name${CompanyList.companyId}" name="companyName" type="text"/>
                                            </li>
                                            <li>
                                                <label><span>公司代码 </span></label>
                                                <input id="company_com${CompanyList.companyId}" name="companyCom" type="text"/>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                    </form>
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button onclick="updateCompany(this,${CompanyList.companyId})" class="btn btn-primary btn-sm">保存</button>
                                </div>
                            </div>
                        </div>
           <shiro:hasRole name="超级管理员">
           <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${CompanyList.companyId})">删除</a>
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
				<li><a href="<%=basePath%>/order/companyList.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/order/companyList.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/order/companyList.do?pageno=${pageno+1}">&raquo;</a></li>
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
//添加编辑模态框
$('#add').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var recipient = button.data('whatever');
    var modal = $(this);
    modal.find('.modal-title').text('' + recipient);
    modal.find('.modal-body input').val(recipient)
})
//确认提交
	function addinfo(){
		var companyNameVal = $("#company_name").val();
		var companyComVal = $("#company_com").val();
		if(companyComVal!=null&&companyComVal!=""){
			if(companyNameVal!=null&&companyNameVal!=""){
				var bool = window.confirm("确认提交吗？");
				if(bool){
					document.getElementById("#addinfo").submit();
				}
			}else{
				alert("公司名不能为空");
			}
		}else{
			alert("公司代号不能为空");
		}
	}
	
//确认删除
function deleteItem(item,typeId){
	var bool = window.confirm("确定删除吗？" + item)
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/order/deletecompany.do?id="+typeId;
		}
	}
	
//获取当前编辑内容
function getCompany(item,typeId){
	$.post(
		"<%=basePath%>/order/getcompany.do",
				{
					id:typeId
				},
				function(data){
					var json = $.parseJSON(data);
					$("#company_name"+typeId).val(json.companyName);
					$("#company_com"+typeId).val(json.companyCom);
				});
}

//编辑确认提交
function updateCompany(item,typeId){
	var companyNameVal = $("#company_name"+typeId).val();
	var companyComVal = $("#company_com"+typeId).val();
	if(companyComVal!=null&&companyComVal!=""){
		if(companyNameVal!=null&&companyNameVal!=""){
			var bool = window.confirm("确认当前修改吗？");
			if(bool){
					$.post(
						"<%=basePath%>/order/updatecompany.do",
						{
							companyName : companyNameVal,
							companyCom : companyComVal,
							companyId:typeId
						},function(data){
							window.location.reload();
						});
			}
		}else{
			alert("公司名不能为空");
		}
	}else{
		alert("公司代码不能为空");
	}
}




</script>
</body>
</html>