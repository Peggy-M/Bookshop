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
<title>后台首页</title>
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
</head>
<%-- <script type="text/javascript">
	var usr = "<%=request.getSession().getAttribute("name")%>";
	if(usr=="null"||usr==""){
		window.location.href="<%=basePath%>/background/login&register/background_login.jsp";
	}
</script> --%>
<body style="background-attachment: fixed;background-repeat: no-repeat;">
<header>
    <div class="container-fluid navbar-fixed-top bg-primary">
        <ul class="nav navbar-nav  left">
            <li class="text-white h4">
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;<b>购书商场后台管理系统</b>
            </li>
        </ul>
        <ul class="nav navbar-nav nav-pills right ">
            <li class="bg-warning ">
                <a href="#"><span class="glyphicon glyphicon-tasks"></span><span class="badge">1</span></a>
            </li>
            <li class="bg-success">
                <a href="#"><span class="glyphicon glyphicon-envelope"></span><span class="badge">2</span></a>
            </li>
            <li class="bg-danger">
                <a href="#"><span class="glyphicon glyphicon-bell"></span></a>
            </li>
            <li class="bg-info dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span>&nbsp;<span id="user_name"></span><span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li class="text-center"><a id="my_info" style="cursor: pointer;"><span class="text-primary" >个人资料</span></a></li>
                    <li class="text-center"><a  data-toggle="modal" data-target="#add1" id="add_role_layers"><span class="text-primary">密码设置</span></a></li>
                    <!-- <li class="text-center"><a href="#"><span class="text-primary">消息设置</span></a></li> -->
                    <!-- <li class="text-center"><a href="#"><span class="text-primary">帮助中心</span></a></li> -->
                   <!--  <li class="divider"><a href="#"></a></li> -->
                    <li class="text-center"><a id="logout" style="cursor: pointer;"><span class="text-primary" >退出</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>
     <!--添加-->
	    <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="add11">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title" id="add11">密码修改</h4>
	                </div>
	                <form id="addinfo" action="<%=basePath%>/user/updatePassword" method="post">
	                <div class="modal-body">
	                    <ul>
	                        <li>
	                            <label><span>新密码 </span></label>
	                            <input name="userPassword" type="password" id="user_password"/>
	                            <input type="hidden" id="user_name_hid" name="userName">
	                        </li>
	                        <li style="height: 64px;">
	                            <label><span>密码确认 </span></label>
	                            <input type="password" id="passwod_chack">
	                            <p id="password_chack_view" style="margin-left: 70px;"></p>
	                        </li>
	                        <br/>
	                    </ul>
	                </div>
	              </form>
	                <div class="modal-footer">
	                    <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
	                    <button id="update_password_submit" class="btn btn-primary btn-sm">提交</button>
	               </div>
                </div>
            </div>
        </div>
<section>
    <div class="container-fluid">
        <div class="row ">
            <!--左侧导航开始-->
            <div class="col-xs-2 bg-blue">
                <br/>
                <div class="panel-group sidebar-menu" id="accordion" aria-multiselectable="true">
                    <div class="panel panel-default menu-first menu-first-active">
                        <a data-toggle="collapse" data-parent="#accordion" href="index.html" aria-expanded="true"
                           aria-controls="collapseOne">
                            <i class="icon-home icon-large"></i> 主页
                        </a>
                    </div>
                    <!-- <div class="panel panel-default menu-first">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
                           aria-controls="collapseOne">
                            <i class="icon-user-md icon-large"></i> 系统管理</a>
                        <div id="collapseOne" class="panel-collapse collapse " >
                            <ul class="nav nav-list menu-second">
                                <li><a href="p1.html"><i class="icon-user"></i> 表格p1</a></li>
                                <li><a href="p2.html"><i class="icon-edit"></i> 图表p2</a></li>
                                <li><a href="p3.html"><i class="icon-trash"></i> p3</a></li>
                                <li><a href="#"><i class="icon-list"></i> 子选项4</a></li>
                            </ul>
                        </div>
                    </div> -->
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                           aria-expanded="false" aria-controls="collapseTwo">
                            <i class="icon-book icon-large"></i> 用户管理</a>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/role/userList.do" target="content"><i class="icon-user"></i> 用户列表</a></li>
                                <li><a href="<%=basePath%>/role/roleList.do" target="content"><i class="icon-edit"></i> 职位列表</a></li>
                                <li><a href="<%=basePath%>/role/permissionList.do" target="content"><i class="icon-trash"></i>权限列表</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                           aria-expanded="false" aria-controls="collapseThree">
                            <i class="icon-book icon-large"></i>类目管理</a>

                        <div id="collapseThree" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/type/typelist.do" target="content"><i class="icon-user"></i>一级类目列表</a></li>
                            	<li><a href="<%=basePath%>/type2/typelist.do" target="content"><i class="icon-user"></i>二级类目列表</a></li>
                            	<li><a href="<%=basePath%>/type3/typelist.do" target="content"><i class="icon-user"></i>三级类目列表</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour"
                           aria-expanded="false" aria-controls="collapseThree">
                            <i class="icon-book icon-large"></i> 图书列表</a>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/book/list" target="content"><i class="icon-user"></i>图书列表</a></li>
                                <li><a href="<%=basePath%>/book/status0list" target="content"><i class="icon-user"></i>普通列表</a></li>
                                <li><a href="<%=basePath%>/book/status1list" target="content"><i class="icon-user"></i>预售列表</a></li>
                                <li><a href="<%=basePath%>/book/status2list" target="content"><i class="icon-user"></i>精选列表</a></li>
                                <li><a href="<%=basePath%>/book/status3list" target="content"><i class="icon-user"></i>特惠列表</a></li>
                                <li><a href="<%=basePath%>/book/status4list" target="content"><i class="icon-user"></i>畅销列表</a></li>
                                <li><a href="<%=basePath%>/book/status5list" target="content"><i class="icon-user"></i>下架商品</a></li>
                                <li><a href="<%=basePath%>/book/status6list" target="content"><i class="icon-user"></i>网购爆品</a></li>
                                <li><a href="<%=basePath%>/book/status7list" target="content"><i class="icon-user"></i>热卖图书</a></li>
                                <li><a href="<%=basePath%>/book/status8list" target="content"><i class="icon-user"></i>限时抢购</a></li>
                                <li><a href="<%=basePath%>/book/status9list" target="content"><i class="icon-user"></i>热评商品</a></li>
                            </ul>
                        </div>
                    </div>
                    
                     <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive"
                           aria-expanded="false" aria-controls="collapseFive">
                            <i class="icon-book icon-large"></i>公告管理</a>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/advertise/adlist.do" target="content"><i class="icon-user"></i>公告列表</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix"
                           aria-expanded="false" aria-controls="collapseSix">
                            <i class="icon-book icon-large"></i>购物车管理</a>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/cart/allcartlist.do" target="content"><i class="icon-user"></i>购物车列表</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven"
                           aria-expanded="false" aria-controls="collapseSeven">
                            <i class="icon-book icon-large"></i>订单管理</a>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/order/allorderlist.do" target="content"><i class="icon-user"></i>订单列表</a></li>
                                <li><a href="<%=basePath%>/order/payedOrder.do" target="content"><i class="icon-user"></i>已付款订单列表</a></li>
                                <li><a href="<%=basePath%>/order/oldOrder.do" target="content"><i class="icon-user"></i>已发货订单列表</a></li>
                                <li><a href="<%=basePath%>/order/Ordered.do" target="content"><i class="icon-user"></i>已完成订单列表</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine"
                           aria-expanded="false" aria-controls="collapseNine">
                            <i class="icon-book icon-large"></i>物流公司管理</a>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/order/companyList.do" target="content"><i class="icon-user"></i>物流公司列表</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel panel-default menu-first">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight"
                           aria-expanded="false" aria-controls="collapseEight">
                            <i class="icon-book icon-large"></i>用户地址管理</a>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <ul class="nav nav-list menu-second">
                                <li><a href="<%=basePath%>/address/addresslist.do" target="content"><i class="icon-user"></i>地址列表</a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!--左侧导航结束-->
            <!----------------------------------------------------------------------------------------------------->
            <!--右侧内容开始-->
            <div class="col-xs-10">
				<iframe name="content" id="content" style="width: 100%; height:1000px; border: 0px;" src="<%=basePath%>/background/wlecom.jsp"></iframe>
                <!----------------------------------------------------------    ------------------------------------------->
            </div>
            <!--右侧内容结束-->
        </div>
    </div>
</section>

<footer class="bg-primary navbar-fixed-bottom">
    <p class="text-center text-white">版权所有&copy;MMSS</p>
</footer>

<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script src="<%=basePath%>/js/bootstrap.js"></script>
<script type="text/javascript">
$("#logout").click(function() {
	$.post(
			"<%=basePath%>/user/logout",
			{},
			function(data1) {
				if (data1=="success") {
					window.location.href="<%=basePath%>/background/background_login.jsp";
				}
			}
	);
});
  	var name =  "<%=request.getSession().getAttribute("name")%>";
  	$("#user_name").html(name);
  	$("#user_name_hid").val(name);
  	$("#my_info").click(function() {
  		$("#content").attr("src","<%=basePath%>/role/myDetails.do?name="+name);
  	});
  $("#passwod_chack").blur(function(){
	  var passwordChackVal = $("#passwod_chack").val();
	  var passwordVal = $("#user_password").val();
	  if(passwordChackVal!=null&&passwordChackVal!=""&&passwordVal!=""&&passwordVal!=null&&passwordChackVal!=passwordVal){
		  $("#password_chack_view").html("两次密码不相同");
		  $("#password_chack_view").css("color","red");
	  }else if(passwordChackVal!=null&&passwordChackVal!=""&&passwordVal!=""&&passwordVal!=null){
		  $("#password_chack_view").html("两次密码相同");
		  $("#password_chack_view").css("color","black");
	  }
  });
	 $("#update_password_submit").click(function(){
	  var passwordChackVal = $("#passwod_chack").val();
	  var passwordVal = $("#user_password").val();
	  var checkPasswordVal = $("#password_chack_view").html();
	  if(passwordVal!=null&&passwordVal!=""){
		  if(passwordChackVal!=null&&passwordChackVal!=""){
			  if(checkPasswordVal!=null&&checkPasswordVal!=""&&checkPasswordVal!="两次密码不相同"){
				  var boo = window.confirm("是否提交修改？");
				  if(boo){
					  $.post(
						  "<%=basePath%>/user/updatePassword",
						  {
							  userPassword:passwordVal,
							  userName:name
						  },
						 function(data){
							  if(data=="success"){
								  alert("密码修改成功");
								  window.location.reload();
							  }else{
								  alert("密码修改失败");
							  }
						  }
					  ); 
					  /* $("#addinfo").submit(); */
				  }
			  }else{
				  alert("两次密码不相同，请重新输入");
			  }
		  }else{
			  alert("重复密码为空，请重新输入");
		  }
	  }else{
		  alert("密码不能为空，请重新输入");
	  }
  }); 
</script>
</body>
</html>