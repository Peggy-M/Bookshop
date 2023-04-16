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
<title>三级类目分类显示</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
</head>

<body>
<table class="table table-bordered table-striped text-center bg-info">
                <br/>
               
                <a href="javascrip.void(0)" class=" btn btn-primary " data-toggle="modal" data-target="#add1">添加</a>
                 <!--添加-->
                        <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="add11">添加</h4>
                                    </div>
                                    <form id="addinfo" role="form" action="<%=basePath%>/type3/add.do" method="post">
                                    <div class="modal-body">
                                        <ul>
                                            <li>
                                                <label><span>类目名称 </span></label>
                                                <input name="typeName" type="text"/>
                                            </li>
                                           <!--  <li>
                                                <label><span>上级ID </span></label>
                                                <input name="typeSecondId" type="text"/>
                                            </li> -->
                                            <li>
                                                <label><span>上级类目 </span></label>
						                        <select id="secondTypeName">
													<c:forEach items="${secondTypeList}" var="secondList">
													<option value="${secondList.typeId}">${secondList.typeName}</option>
													</c:forEach>
												</select>
												<input name="typeSecondId" id="SecondId" type="hidden"/>
											</li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-default btn-sm" data-dismiss="modal" onclick="javascript:history.back()">取消</button>
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
         <th class="text-center">三级类目名称</th>
         <th class="text-center">当前二级类目ID</th>
         <th class="text-center">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${thirdTypes}" var="thirdType">
      <tr>
        <td>${thirdType.typeId}</td>
        <td>${thirdType.typeName}</td>
        <td>${thirdType.typeSecondId}</td>
        <td>
           <a href="javascrip:void(0);" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#edit${thirdType.typeId}" onclick="getThirdType(this,${thirdType.typeId})">编辑</a>
           <!--修改-->
           <div class="modal fade" id="edit${thirdType.typeId}" tabindex="-1" role="dialog" aria-labelledby="edit">
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
                                                <label><span>类目名称 </span></label>
                                                <input id="type_name${thirdType.typeId}" name="typeName" type="text"/>
                                            </li>
                                            <li>
                                                <label><span>上级ID </span></label>
                                                <input id="type_second_id${thirdType.typeId}" name="typeSecondId" type="text"/>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                    </form>
                                        <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                                        <button onclick="updateinfo(this,${thirdType.typeId})" class="btn btn-primary btn-sm">保存</button>
                                </div>
                            </div>
                        </div>
           <shiro:hasRole name="超级管理员">
           <a class="btn btn-primary btn-sm" onclick="deleteItem(this,${thirdType.typeId})">删除</a>
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
				<li><a href="<%=basePath%>/type3/typelist.do?pageno=${pageno-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="item" begin="1" end="${count }" step="1">
					<c:choose>
					    <c:when test="${item==pageno }">
					    <li class="active"><a>${item }</a></li>
					    </c:when>
					    <c:otherwise>
					    <li><a href="<%=basePath%>/type3/typelist.do?pageno=${item}">${item }</a></li>
					    </c:otherwise>
					</c:choose>
					    	
				</c:forEach>
				  <c:if test="${pageno < count}">
				  <li><a href="<%=basePath%>/type3/typelist.do?pageno=${pageno+1}">&raquo;</a></li>
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

//确认删除
function deleteItem(item,typeId){
	var bool = window.confirm("确定删除吗？" + item)
	if (bool){
		var aTag = item;
		aTag.href = "<%=basePath%>/type3/delete.do?typeId="+typeId;
		}
	}

//获取要编辑的二级类目名及上级类目Id
function getThirdType(item,typeId){
	$.post(
		"<%=basePath%>/type3/getTypeInfo.do?id="+typeId,
		{},
		function(data){
			var json = $.parseJSON(data);
			$("#type_name"+typeId).val(json.typeName);
			$("#type_second_id"+typeId).val(json.typeSecondId);
		}
	);
}

//编辑确认提交
function updateinfo(item,typeId){
	var bool = window.confirm("确认当前修改吗？");
	var typeNameVal = $("#type_name"+typeId).val();
	var typeSecondIdVal = $("#type_second_id"+typeId).val();
		if(bool){
			if(typeNameVal!=null&&typeNameVal!=""){
				if(typeSecondIdVal!=null&&typeSecondIdVal!=""){
					$.post(
							"<%=basePath%>/type3/update.do?id="+typeId,
							{
								typeName : typeNameVal,
								typeSecondId : typeSecondIdVal
							},function(data){
								window.location.reload();
							});
				}else{
					alert("上级类目ID不能为空");
				}
			}else{
				alert("二级类目名不能为空");
			}
		}
}

$("#secondTypeName").change(function(){
	var secondTypeIdVal = $("#secondTypeName").find("option:selected").val(); 
	$("#SecondId").val(secondTypeIdVal);
});
</script>
</body>
</html>