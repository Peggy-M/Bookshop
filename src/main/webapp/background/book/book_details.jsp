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
	                            图书信息详情
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
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书序号 </span></label>
					                      <div class="col-sm-10">
					                      	<span>${bean.bookId}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书名称 </span></label>
					                      <div class="col-sm-10">
					                      	<span>${bean.bookName}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书封面 </span></label>
					                      <div class="col-sm-10">
					                      	<img alt="封面" src="<%=basePath %>${bean.bookCover}" width="300px" height="300px"> 
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书作者</span></label>
					                      <div class="col-sm-10">
					                      	<span>${bean.bookAuthor}</span>
					                      </div>
					                  </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书详情</span></label>
					                      <div class="col-sm-10">
						                      <!-- <input name="bookdetails" type="text" id="bookdetails"/> -->
						                      <a class=" btn btn-primary " data-toggle="modal" data-target="#details1">图书详情查看</a>
						                       <!-- <textarea id="bookdetails1" name="bookdetails" rows="40" class="col-sm-12"></textarea> -->
					                       </div>
					                    </div>
				                   </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>出版社</span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookPress}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>出版时间 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookPblishTime}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书版次 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookEdition}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书开本 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookSize}</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书定价 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookPrice}</span>
					                        	<span id="helpBlock" class="help-block">单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书售价 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookSellPrice}</span>
					                        	<span id="helpBlock" class="help-block">单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书进货价 </span></label>
					                        <div class="col-sm-10">
					                        	<span>${bean.bookPrimeCost}</span>
					                        	<span id="helpBlock" class="help-block">单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>一级分类 </span></label>
					                        <div class="col-sm-10">
					                         	<span>${firstTypeDTO.typeName}</span>
										    </div>
									   </div>
					                </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>二级分类 </span></label>
						                                                <!-- <input name="bookTypeSecond" type="text"/> -->
						                    <div class="col-sm-10">
							                    <span>${secondTypeDTO.typeName}</span>
											</div>
										</div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>三级分类 </span></label>
						                    <div class="col-sm-10">
						                          <span>${thirdTypeDTO.typeName}</span>
											</div>
										</div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书库存 </span></label>
						                    <div class="col-sm-10">
						                    	<span>${bean.bookNumber}</span>
						                    	<span id="helpBlock" class="help-block">单位是：本</span>
						                    </div>
						                 </div>
					                 </li>
					                  <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书录入日期 </span></label>
						                    <div class="col-sm-10">
						                    	<span>${bean.bookPrimeDate}</span>
						                    </div>
						                 </div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书ISBN </span></label>
						                	<div class="col-sm-10">
						                 		<span>${bean.bookISBN}</span>
						                 	</div>
						                 </div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>状态</span></label>
						                	<c:if test="${bean.bookStatus==0}">
									        	<span>普通</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==1}">
									        	<span>预售</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==2}">
									        	<span>精选</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==3}">
									        	<span>特惠</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==4}">
									        	<span>畅销</span>
									        </c:if>
									         <c:if test="${bean.bookStatus==5}">
									        	<span>下架</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==6}">
									        	<span>网购爆品</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==7}">
									        	<span>热卖图书</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==8}">
									        	<span>限时抢购</span>
									        </c:if>
									        <c:if test="${bean.bookStatus==9}">
									        	<span>热评商品</span>
									        </c:if>
						                </div>
					                </li>                            
					               	<li>
						               	<div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>销量</span></label>
						                	<div class="col-sm-10">
						                    	<span>${bean.bookSales}</span>
						                    	<span id="helpBlock" class="help-block">单位是：本</span>
						                    </div>
						                </div>
					            	</li>
					        	</ul>
					        </div>
						</form>
					         <button class="btn btn-default btn-sm" data-dismiss="modal" onclick="javascript:history.back()">取消</button>
					              <c:choose>
									           <c:when test ="${bean.bookStatus!=1}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus1(this,${bean.bookId},${bean.bookStatus})"><span>设为预售</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus1(this,${bean.bookId},${bean.bookStatus})"><span>取消预售</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=2}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus2(this,${bean.bookId},${bean.bookStatus})"><span>设为精选</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus2(this,${bean.bookId},${bean.bookStatus})"><span>取消精选</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=3}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus3(this,${bean.bookId},${bean.bookStatus})"><span>设为特惠</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus3(this,${bean.bookId},${bean.bookStatus})"><span>取消特惠</span></a>
									           </c:otherwise>
								           </c:choose>
								            <c:choose>
									           <c:when test ="${bean.bookStatus!=4}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus4(this,${bean.bookId},${bean.bookStatus})"><span>设为畅销</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus4(this,${bean.bookId},${bean.bookStatus})"><span>取消畅销</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=5}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus5(this,${bean.bookId},${bean.bookStatus})"><span>图书下架</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus5(this,${bean.bookId},${bean.bookStatus})"><span>图书上架</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=6}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus6(this,${bean.bookId},${bean.bookStatus})"><span>设为网购爆品</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus6(this,${bean.bookId},${bean.bookStatus})"><span>取消网购爆品</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=7}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus7(this,${bean.bookId},${bean.bookStatus})"><span>设为热卖图书</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus7(this,${bean.bookId},${bean.bookStatus})"><span>取消热卖图书</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=8}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus8(this,${bean.bookId},${bean.bookStatus})"><span>设为限时抢购</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus8(this,${bean.bookId},${bean.bookStatus})"><span>取消限时抢购</span></a>
									           </c:otherwise>
								           </c:choose>
								           <c:choose>
									           <c:when test ="${bean.bookStatus!=9}">
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus9(this,${bean.bookId},${bean.bookStatus})"><span>设为热评商品</span></a>
									           </c:when>
									           <c:otherwise>
									           		<a class="btn btn-primary btn-sm status_to" onclick="setStatus9(this,${bean.bookId},${bean.bookStatus})"><span>取消热评商品</span></a>
									           </c:otherwise>
								           </c:choose>
						<div class="modal fade" id="details1" tabindex="-1" role="dialog" aria-labelledby="details11">
					         <div class="modal-dialog" role="document">
					             <div class="modal-content">
					                 <div class="modal-header">
					               		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                     <h4 class="modal-title" id="details11">图书详情</h4>
					                 </div>
					                  <div class="modal-body">
										${bean.bookdetails}
					                  </div>
					                  <div class="modal-footer">
					                      <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					                  </div>
					             </div>
					         </div>
					    </div>
			        </div>
				</div>
			</div>
		</div>
		<script src="<%=basePath %>/layer/layer.js"></script>
		<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
		<script type="text/javascript">
		 /* function imageDetail(url){
					  layer.open({
					  type: 1,
					  area: ['600px', '360px'],
					  shadeClose: false, //点击遮罩关闭
					  content:''
					  });
					}; */
	//确认设为或取消预售
	function setStatus1(item,bookId,status){
		var bool="";
		if(status!=1){
			bool = window.confirm("确定设为预售吗？");
		}else{
			bool = window.confirm("确定取消预售吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status1?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消精选
	function setStatus2(item,bookId,status){
		var bool="";
		if(status!=2){
			bool = window.confirm("确定要设为精选吗？");
		}else{
			bool = window.confirm("确定取消精选吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status2?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		};
	//确认设为或取消特惠
	function setStatus3(item,bookId,status){
		var bool="";
		if(status!=3){
			bool = window.confirm("确定要设特惠吗？");
		}else{
			bool = window.confirm("确定取消特惠吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status3?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		};
	//确认设为或取消畅销
	function setStatus4(item,bookId,status){
		var bool="";
		if(status!=4){
			bool = window.confirm("确定要设为畅销吗？");
		}else{
			bool = window.confirm("确定取消畅销吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status4?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消下架
	function setStatus5(item,bookId,status){
		var bool="";
		if(status!=5){
			bool = window.confirm("确定此图书要下架吗？");
		}else{
			bool = window.confirm("确定此图书要上架吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status5?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消网购爆品
	function setStatus6(item,bookId,status){
		var bool="";
		if(status!=6){
			bool = window.confirm("确定此图书要设为网购爆品吗？");
		}else{
			bool = window.confirm("确定此图书要取消网购爆品吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status6?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消热卖图书
	function setStatus7(item,bookId,status){
		var bool="";
		if(status!=7){
			bool = window.confirm("确定此图书要设为热卖图书吗？");
		}else{
			bool = window.confirm("确定此图书要取消热卖图书吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status7?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消限时抢购
	function setStatus8(item,bookId,status){
		var bool="";
		if(status!=8){
			bool = window.confirm("确定此图书要设为限时抢购吗？");
		}else{
			bool = window.confirm("确定此图书要取消限时抢购吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status8?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	//确认设为或取消热评商品
	function setStatus9(item,bookId,status){
		var bool="";
		if(status!=9){
			bool = window.confirm("确定此图书要设为热评商品吗？");
		}else{
			bool = window.confirm("确定此图书要取消热评商品吗？");
		}
		if (bool){
			var aTag = item;
			$.post(
					"<%=basePath%>/book/status9?id="+bookId,
				{
					bookStatus:status
				},function(data){
					alert(data);
					window.location.reload();
				})
			}
		}
	     </script>                               
	</body>
</html>