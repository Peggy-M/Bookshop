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
		<title>图书详细信息</title>
		<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
		<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="<%=basePath%>/layer/skin/default/layer.css" media="all">
		  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
		<script src="<%=basePath%>/js/bootstrap.js"></script>
	</head>
	<body>
	 <div class="container">
	    <div class="col-lg-8">
	    	<div class="panel panel-info">
	        	<div class="panel-heading">
	                            用户详细信息
	            </div>
				<div class="panel-body">
					<form class="form-horizontal">
					<%-- <c:set var="bean" value="${bean}"></c:set>
					<c:set var="firstTypeDTO" value="${firstTypeDTO}"></c:set>
					<c:set var="thirdTypeDTO" value="${thirdTypeDTO}"></c:set>
					<c:set var="secondTypeDTO" value="${secondTypeDTO}"></c:set> --%>
				        <div class="form-group top">
				              <ul>
				                  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户ID</span></label>
					                      <div class="col-sm-10">
					                      	<span>${userBean.userId}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户名称 </span></label>
					                      <div class="col-sm-10">
					                      	<span>${userBean.userName}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户头像 </span></label>
					                      <div class="col-sm-10">
					                      	<img alt="封面" src="<%=basePath %>${userBean.userImage}" width="300px" height="300px"> 
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户电话</span></label>
					                      <div class="col-sm-10">
					                      	<span>${userBean.userPhone}</span>
					                      </div>
					                  </div>
				                  </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户邮箱</span></label>
					                        <div class="col-sm-10">
					                        	<span>${userBean.userEmail}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>真实姓名 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${userBean.userRealname}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>注册时间 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${userBean.userRegisterTime}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户状态 </span></label>
					                        <div class="col-sm-10">
					                        	<c:if test="${userBean.userStatus==1}">
										        	<span>登陆有效</span>
										        </c:if>
										        <c:if test="${userBean.userStatus==0}">
										        	<span>登陆禁止</span>
										        </c:if>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户部门</span></label>
					                        <div class="col-sm-10">
							                    <span>${roleBean.roleType}</span>
										    </div>
									   </div>
					                </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户职位 </span></label>
						                                                <!-- <input name="bookTypeSecond" type="text"/> -->
						                    <div class="col-sm-10">
				                    		<c:forEach items="${userRoleList} " var="userRoleList">
					                         	<span>${userRoleList}</span>
					                		</c:forEach>
											</div>
										</div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>用户权限 </span></label>
						                    <div class="col-sm-10">
						                    	<c:forEach items="${permissionStr }" var="permissionStr">
						                          <span>${permissionStr},</span>
												</c:forEach>
											</div>
										</div>
					                 </li>
					               	<li>
					        	</ul>
					        </div>
						</form>
					      <button class="btn btn-default btn-sm" data-dismiss="modal" onclick="javascript:history.back()">取消</button>
			        </div>
				</div>
			</div>
		</div>
		<script src="<%=basePath %>/layer/layer.js"></script>
		<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
		<!-- <script type="text/javascript">
		 function imageDetail(url){
					  layer.open({
					  type: 1,
					  area: ['600px', '360px'],
					  shadeClose: false, //点击遮罩关闭
					  content:''
					  });
					};
	     </script>  -->                              
	</body>
</html>