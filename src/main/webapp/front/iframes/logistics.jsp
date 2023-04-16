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
		<title>物流信息</title>
		<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
		<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="<%=basePath%>/layer/skin/default/layer.css" media="all">
		  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
		<script src="<%=basePath%>/js/bootstrap.js"></script>
	</head>
	<body style="background: none;">
	 <div class="container-fluid">
	    	<div class="panel panel-info">
	        	<div class="panel-heading"></div>
					<form class="form-horizontal">
				        <div class="form-group top">
				              <ul>
				              		<li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>订单号</span></label>
					                      <div class="col-sm-10">
					                      	<span>${orderDTO.orderNumber}</span>
					                      </div>
					                   </div>
				                  </li>
				              		<%-- <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>购买时间</span></label>
					                      <div class="col-sm-10">
					                      	<span>${orderDTO.orderCreateTime}</span>
					                      </div>
					                   </div>
				                  </li> --%>
				              	 <%-- <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>订单金额</span></label>
					                      <div class="col-sm-10">
					                      	<span>${orderDTO.orderPrice}</span>
					                      </div>
					                   </div>
				                  </li> --%>
				              	  <%-- <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>购买人</span></label>
					                      <div class="col-sm-10">
					                      	<span>${bean.userName}</span>
					                      </div>
					                   </div>
				                  </li> --%>
				              	  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>收货地址</span></label>
					                      <div class="col-sm-10">
					                      	<span>${dto.addressArea}&nbsp${dto.addressDetails}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>物流公司</span></label>
					                      <div class="col-sm-10">
					                      	<span>${company}</span>
					                      </div>
					                   </div>
				                  </li>
				                  <%-- <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>物流公司代号 </span></label>
					                      <div class="col-sm-10">
					                      	<span>${com}</span>
					                      </div>
					                   </div>
				                  </li> --%>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>物流单号</span></label>
					                      <div class="col-sm-10">
					                      	<span>${no}</span>
					                      </div>
					                  </div>
				                  </li>
				                    <%-- <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>物流状态</span></label>
					                        <div class="col-sm-10">
					                        	<span>${status}</span>
					                        </div>
					                    </div>
				                    </li> --%>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>物流过程</span></label>
					                        <div class="col-sm-10">
					                        <c:forEach items="${dtoList}" var="dtoList">
					                        	<span>${dtoList.datetime}&nbsp&nbsp${dtoList.remark}</span></br>
					                        </c:forEach>
					                        </div>
					                    </div>
				                    </li>
					        	</ul>
					        </div>
						</form>
					      <button class="btn btn-default btn-sm" data-dismiss="modal" onclick="window.parent.close();">关闭</button>
			        </div>
				</div>
		</div>
		<script src="<%=basePath %>/layer/layer.js"></script>
		<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
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