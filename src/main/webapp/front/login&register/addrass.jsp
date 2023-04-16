<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>

<html>
<head>
<title>图书商城-首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/product.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/login.css">
<link type="text/css" rel="StyleSheet" media="all" href="<%=basePath%>/css/jquery.suggest.css"/>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.cycle.all.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.countdown.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/getcard1.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/AddFavorite.js"></script>
  <script type="text/javascript" language="javascript" src="<%=basePath%>/js/jquery.form.js"></script>
  <script type="text/javascript" src="<%=basePath%>/js/selecttree.js"></script>
  <script type="text/javascript" src="<%=basePath%>/js/thickbox.js"></script>
  <script type="text/javascript" language="javascript" src="<%=basePath%>/js/AddressList.js"></script>
<script type="text/javascript">
	var usr = "<%=request.getSession().getAttribute("name")%>";
</script>
<script type="text/javascript">
        var frontPath = "";
        function googleAnForZY(){
        	jQuery(".shaoer .recommAdv2 .adv256").click(
        		function(){ _gaq.push(['_trackEvent', 'click_out','首页广教-卓越广告', '广告链接']);}
        	);  		
        }
        jQuery(function(){
        	googleAnForZY();
        /*
            jQuery('#themes').cycle({
                fx:'scrollVert',推荐图书
                timeout:8000,
                speed:1000,
                click:null,
                pause:true
            });
		*/
        });
	//jQuery("#welcome").load("Default/FInclude/Top_welcome.do");	
        // JavaScript Document
    </script>
<style>
	.compoList .top1 .icon{_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,src='/guanggou/templets/Default/Default/images/index_top1.png',sizingMethod='scale');}#tb_frame{}</style>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?3473cc3f2537e2088777f227e2534627";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<link href="<%=basePath%>/css/header.css" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" type="text/css"/>
<link href="<%=basePath%>/css/style.css" type="text/css"/>
<!-- <link rel="shortcut icon" href="http://www.gg1994.com/favicon.ico"> -->
<style type="text/css">
	/*begin 卡券模块样式 */
	.a1 {
	    background-color: #f66;
	    margin-right: 12px;
	    float: left;
	    padding-right: 14px;
	    height: 80px;
	}
	.span1 {
	    height: 24px;
	    line-height: 24px;
	    padding: 28px 12px;
	    color: #fff;
	    border-right: 1px dotted #fff;
	    display: inline-block;
	    font-size: 25px;
	}
	/*end 卡券模块样式 */
	#dialogContent{
		display:none;
		width: 100%;
		height: 100%;
		position: fixed;
		z-index: 9999;
		text-align: center;
	}
	#dialog{
		display:none;
		width: 200px;
		height: 50px;
		margin:auto;
		margin-top:20%;
		background: #606060;
		display: block;
		border-radius: 5px;
		color: white;
		text-align: center;
	}
	#dialog h1{
		padding-top: 10px;
	}
</style>
</head>
<body id="body" style="width:100%;">

<!-- 未登录提示框 -->
<div id="dialogContent">
	<div id="dialog">
		<h1>请先登录</h1>
	</div>
</div>

<div class="header">
	<div class="top">
		<div class="contain">
		<div class="fr" id="welcomeStr"></div>
		<div class="fl">
			<a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">收藏图书商城</a>
			<div class="address">
				<div class="areamini">送至：<span>湖北</span></div>
				<ul>
					<li><a href="javascript:void(0);">北京</a></li>
					<li><a href="javascript:void(0);">上海</a></li>
					<li><a href="javascript:void(0);">天津</a></li>
					<li><a href="javascript:void(0);">重庆</a></li>
					<li><a href="javascript:void(0);">河北</a></li>
					<li><a href="javascript:void(0);">山西</a></li>
					<li><a href="javascript:void(0);">河南</a></li>
					<li><a href="javascript:void(0);">辽宁</a></li>
					<li><a href="javascript:void(0);">吉林</a></li>
					<li><a href="javascript:void(0);">黑龙江</a></li>
					<li><a href="javascript:void(0);">内蒙古</a></li>
					<li><a href="javascript:void(0);">江苏</a></li>
					<li><a href="javascript:void(0);">山东</a></li>
					<li><a href="javascript:void(0);">安徽</a></li>
					<li><a href="javascript:void(0);">浙江</a></li>
					<li><a href="javascript:void(0);">福建</a></li>
					<li><a href="javascript:void(0);" class="selected">湖北</a></li>
					<li><a href="javascript:void(0);">湖南</a></li>
					<li><a href="javascript:void(0);">广东</a></li>
					<li><a href="javascript:void(0);">广西</a></li>
					<li><a href="javascript:void(0);">江西</a></li>
					<li><a href="javascript:void(0);">四川</a></li>
					<li><a href="javascript:void(0);">海南</a></li>
					<li><a href="javascript:void(0);">贵州</a></li>
					<li><a href="javascript:void(0);">云南</a></li>
					<li><a href="javascript:void(0);">西藏</a></li>
					<li><a href="javascript:void(0);">陕西</a></li>
					<li><a href="javascript:void(0);">甘肃</a></li>
					<li><a href="javascript:void(0);">青海</a></li>
					<li><a href="javascript:void(0);">宁夏</a></li>
					<li><a href="javascript:void(0);">新疆</a></li>
					<li><a href="javascript:void(0);">台湾</a></li>
					<li><a href="javascript:void(0);">香港</a></li>
					<li><a href="javascript:void(0);">澳门</a></li>
					<li><a href="javascript:void(0);">钓鱼岛</a></li>
					<li><a href="javascript:void(0);">海外</a></li>
				</ul>
			</div>
			<script>
				//头部地址导航显示和隐藏
				$(".header .top .address").hover(function(){
					$(this).find("span").css("background-image","url(images/addr-select-up.png)");
					$(this).find(".areamini").css("background-color","#fff");
					$(this).find("ul").show();
				},function(){
					$(this).find("span").css("background-image","url(images/addr-select-down.png)");
					$(this).find(".areamini").css("background-color","#f1f1f1");
					$(this).find("ul").hide();
				})
				//头部地址导航显示和隐藏
				
				//头部地址导航切换
				$(".header .top .address ul li a").click(function(){
					$(this).addClass("selected").parent().siblings().children().removeClass("selected");
					var selectedAddr = $(this).text();
					$(".header .top .address span").text(selectedAddr);
				})
			</script>
			<script type="text/javascript">
				/* 官网首页 */
				var homeUrl = '<%=basePath%>/frontbook/home';
				/* 登录URL */
				var loginUrl = '<%=basePath%>/front/login&register/front_login.jsp';
				/* 注册URL */
				var registerUrl = '<%=basePath%>/front/login&register/front_register.jsp';
				/* 用户退出URL */
				var logoutUrl = '<%=basePath%>/user/logout';
				var welcomeStr='';
				if(usr!=null&&usr!="null"){
					welcomeStr=usr+'，欢迎来到图书商城：武汉购书中心网上书店！<a id="alex_member" href="javascript:void(0);">我的账户</a>'+
							' <a id="logout" href="javascript:void(0);">退出</a>'+'<a href="javascript:void(0);">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';						
				}else{
					welcomeStr='您好，欢迎来到图书商城：武汉购书中心网上书店！<a href="'+loginUrl+'">登录</a>'+
						'<a href="'+registerUrl+'">新用户注册</a>'+'<a href="javascript:void(0);">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';
				} 
				jQuery('#welcomeStr').html(welcomeStr);
				
				$("#logout").click(function() {
					$.post(
							logoutUrl,
							{},
							function(data) {
								if (data=="success") {
									usr = null;
									welcomeStr='您好，欢迎来到图书商城：武汉购书中心网上书店！<a href="'+loginUrl+'">登录</a>'+
									'<a href="'+registerUrl+'">新用户注册</a>'+'<a href="javascript:void(0);">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';
									jQuery('#welcomeStr').html(welcomeStr);
								}
							}
					);
				});
			</script>
		</div>
		</div>
	</div>
	<div class="bottom contain">
		<div style="margin-bottom:15px;margin-top:15px">
			<a href='javascript:void(0);' target='_blank'><img src='<%=basePath%>/img/top-brand.jpg' width='1200' height='106' alt='' border='0'/></a>
		</div>
		<h1><a href="<%=basePath%>/frontbook/home"><img src='<%=basePath%>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a></h1>
		<div class="shopping-car fr">
			<div id="IncludeSmallCartDiv"><a class="car" href="javascript:void(0);">购物车</a></div><a href="javascript:void(0);">我的订单</a>
		</div>
		<div class="search">
			<script type="text/javascript" src="<%=basePath%>/js/jquery.dimensions.min.js"></script>
			<script type="text/javascript" src="<%=basePath%>/js/jquery.suggest.js"></script>
			
			<!-- 关键字搜索 -->
			
			<form id="searchform" method="post" style="margin:0px" action="<%=basePath%>/frontbook/Search">
				<!-- <input type="hidden" name="Cid" value="603">
				<input type="hidden" id="thKeywords" name="Keywords"/>
				<input type="hidden" name="searchlist" value="1"/>
				<input type="hidden" id="idx_useAutoComplete" name="useAutoComplete" value="0"/>
				<input type="hidden" name="OrderBy" value=" " id="OrderBy"/> -->
				<!-- 搜索输入框 -->
				<input type="text" id="topKeywords" name="topKeywords" value="习近平讲故事" onfocus="if (value =='习近平讲故事'){value =''};this.style.color='#000'"/>
					<input type="button" onclick="searchByKeyWords()"/>
					<span style="margin-left:10px;font-size:16px;border-bottom:1px solid black;line-height: 2;">
					<a href="javascript:void(0);">高级搜索</a></span>
				<div class="hot-search">	
					<div class="hotSea">
					热门搜索：
					<a href="javascript:void(0);">互联网+</a>
					<a href="javascript:void(0);">自助游</a>
					<a href="javascript:void(0);">瘦身</a>
					<a href="javascript:void(0);" target="_blank">国学课堂</a>
					<a href="javascript:void(0);" class="more">更多&gt;&gt;</a>
					</div>
				</div>
			</form>
			
			<script type="text/javascript">
				/* 点击搜索按钮搜索 */
			 	function searchByKeyWords() {
					var keyWordsValue = $('#topKeywords').val();
					var keyWords = keyWordsValue.replace(/(^\s*)|(\s*$)/g,"");
					$('#topKeywords').val(keyWords);
					if(keyWords==''||keyWords==null){
						alert("关键字不能为空！");
					}else if(keyWords.length < 2){
						alert("关键字太短了！");
					}else if(keyWords.length > 50){
						alert("关键字太长了！");
					}else {
						$('#searchform').submit();
					}
				}
				/* String.prototype.Trim=function(){   
					return   this.replace(/(^\s*)|(\s*$)/g,   "");   
				} ; 
				function checkTopSearchForm(){
					var keyword=document.getElementById("topKeywords").value.Trim();
					if(keyword==""){
						alert("关键字不能为空！");
						return false;
					}else{
						var text=keyword.replace(/([\u0391-\uFFE5])/ig,'mm');
						if(text.length < 2){
							alert("关键字太短了！");
							return false;
						}else if(text.length > 50){
							alert("关键字太长了！");
							return false;
						}else{
						   if(keyword.indexOf("&")>0){
							  keywordArray=keyword.split("&");
							  keyword=keywordArray[0];
						   }
						   keyword = keyword.replace(',','，');
						   keyword+=",title,keyword,b_author,b_isbn,code,b_contentsynopsis";
						}
					}
				    //if(keyword!=""){
				    //  keyword+=",title,keyword,b_author,b_isbn,code,b_contentsynopsis";
				    //}//else{
				      //搜索关键字不为空时 按销量倒数搜索
				    	//document.getElementById("OrderBy").value="sellable.count0-int";
				    	//document.getElementById("IsAsc").value="true";
				    //}
				    var thKeywords=document.getElementById("thKeywords");
				    thKeywords.value=keyword;
				    return true;
				  }
				var _srh_keyflag=true;
				function submitSearchForm(){
				 if(!checkTopSearchForm())	return false;
				 document.getElementById("searchform").submit();
				} 
				
				function judgeShowSuggest(){
					if(_srh_keyflag!=true){
						return;
					}
					_srh_keyflag=false;
					
					try{
					jQuery.ajaxSettings['contentType'] = "application/x-www-form-urlencoded; charset=utf-8";
					}catch(e){}
					jQuery("#topKeywords").suggest("/AutoComplete",{
							minchars:1,
				            onSelect: function() { 	
									var comText=this.value+'';
									jQuery("#topKeywords").val(comText);
									try{jQuery("#idx_useAutoComplete").val(1);submitSearchForm();}catch(e){alert(e.name+':'+e.message);}
									_srh_keyflag=true;
				            	}
				           }            
				        );     
				} */
			</script>
			
		</div>
		<div class="clear"></div>
	</div>
</div>

<div class="nav">
	<div class="contain">
		<div class="all-classify">全部图书分类<i></i>
			<div class="list" style="display:none">
			
			<!-- begin 测试demo -->
				<dl>
					<dt>
						<a href="javascript:void(0);">热点</a>
					</dt>
					<dd>
						<a href="#" title="每月铿锵点书推荐 " target='_blank'>
						每月铿锵点书推荐 |
						</a>
						<a href="#" title="名家散文经典" target='_blank'>
						名家散文经典 |
						</a>
						<a href="#" title="查理九世" target='_blank'>
						查理九世 |
						</a>
						<a href="#" title="文创产品" target='_blank'>
						文创产品 |
						</a>
						<a href="#" title="杨红樱" target='_blank'>
						杨红樱 |
						</a>
						<a href="#" title="广购课程 " target='_blank'>
						广购课程 |
						</a>
						<a href="#" title=" 小屁孩日记" target='_blank'>
						小屁孩日记 |
						</a>
					</dd>
				</dl>
			<!-- end 测试demo -->
				
				<!-- 显示分类列表开始 -->
				<c:forEach var="type" items="${typeList }">
					<dl>
						<dt>
							<a href="javascript:void(0);">热点</a>
						</dt>
						<dd>
							<a href="#" title="每月铿锵点书推荐 " target='_blank'>
							每月铿锵点书推荐 |
							</a>
							<a href="#" title="名家散文经典" target='_blank'>
							名家散文经典 |
							</a>
							<a href="#" title="查理九世" target='_blank'>
							查理九世 |
							</a>
							<a href="#" title="文创产品" target='_blank'>
							文创产品 |
							</a>
							<a href="#" title="杨红樱" target='_blank'>
							杨红樱 |
							</a>
							<a href="#" title="广购课程 " target='_blank'>
							广购课程 |
							</a>
							<a href="#" title=" 小屁孩日记" target='_blank'>
							小屁孩日记 |
							</a>
						</dd>
					</dl>
				</c:forEach>
				<!-- 显示分类列表结束 -->
				
				<dl>
					<dt>
						<a href="javascript:void(0);">其它分类</a>
					</dt>
					<dd>
						<a href="javascript:void(0);" title="专题推荐">专题推荐 |</a>
						<a href="javascript:void(0);" title="观古堂">观古堂 |</a>
					</dd>
				</dl>
				
				<dl><dt><a href="javascript:void(0);">英文进口图书</a></dt></dl>
				<dl><dt><a href="javascript:void(0);">港台进口图书</a></dt></dl>
				<dl><dt><a href="#">电子书</a></dt></dl>
				<dl><dt><a href="#">杂志/期刊</a></dt></dl>
				<dl style="text-align:right;background-image:none;"><dt><a href="#">全部图书分类</a></dt></dl>
			</div>
		</div>
		<ul>
		  <li class="cur"><a href="<%=basePath%>/frontbook/home" class="current">首页</a></li>
		  <li><a href="<%=basePath%>/frontbook/Special?status=1&pageSize=30&pageNo=1">新书预售</a></li>
		  <li><a href="<%=basePath%>/frontbook/HotNewBooks?status=2&pageSize=30&pageNo=1">新书精选</a></li>
		  <li><a href="<%=basePath%>/frontbook/ProductList?status=3&pageSize=20&pageNo=1">特惠图书</a></li>
		  <li><a href="<%=basePath%>/frontbook/TopIndex?status=4&pageSize=10&pageNo=1">畅销图书</a></li>
		  <li><a href="javascript:void(0);">文创汇</a></li>
		  <li><a href="javascript:void(0);">签名版</a></li>
		  <li><a href="javascript:void(0);">电子书</a></li>
		  <li><a href="<%=basePath%>/frontadvertise/adlist">商城公告</a></li>
		</ul>
	</div>
</div>
			
<!--div class="rss"><a href="/"><img src="/guanggou/templets/Default/Default/images/head_icon.gif" alt=""/></a></div-->
<!--end导航栏-->
<!--end搜索栏-->

<script>
	$(".all-classify").hover(function(){
		$(this).find(".list").show();
	},function(){
		$(this).find(".list").hide();
	})
</script>

<!--百度-->
<script type="text/javascript"> 
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?d06a459edcca6a687b7ea2f4e1156860";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
<!--<script type="text/javascript">-->
<!--var html="<a href='ht"+"tp://www.gg1994.com:82/'>繁體版</a>";-->
<!--var html2="<a href='/ht"+"tp://www.gg1994.com/'>&#31616;&#20307;&#29256;</a>";-->
<!--var CurUrl = document.URL;-->
<!--var s = CurUrl.indexOf("82");-->
<!--if (s < 0) {-->
<!--document.getElementById("fjt").innerHTML=html;-->
<!--}else{-->
<!--document.getElementById("fjt").innerHTML=html2;-->
<!--}-->
<!--</script>-->
<!--end 页头-->

<script>
	$(".all-classify .list").show();
	$(".all-classify").hover(function(){
			$(".all-classify .list").show();
		},function(){
			$(".all-classify .list").show();
		});
</script>
 <div id="memPath"><a href="http://www.gg1994.com/">首页</a> &gt; <a href="http://www.gg1994.com/Member/index.do">会员专区</a> &gt; 地址薄</div>
 
 <div id="memMain">
   







<div class="memMenu">
   
    
      
        
          <h1 class="first"><!--<img alt="" src="/style/guanggou/images/mem_menuIcon1.gif"/>-->交易管理</h1>
        
        
      
    
      
        
        
              <p><a href="">我的订单</a></p>
        
      
    
      
        
        
              <p><a href="">我购买过的商品</a></p>
        
      
    
      
        
          <h1><!--<img alt="" src="/style/guanggou/images/mem_menuIcon1.gif"/>-->常用工具</h1>
        
        
      
    
      
        
        
              <p><a href="">为我推荐</a></p>
        
      
    
      
        
        
              <p><a href="">我的收藏</a></p>
        
      
    
      
        
        
              <p><a href="">我的订阅 </a></p>
        
      
    
      
        
        
              <p><a class="current" href="">我的地址簿</a></p>
        
      
    
      
        
        
              <p><a href="">缺货登记/留言</a></p>
        
      
    
      
        
          <h1><!--<img alt="" src="/style/guanggou/images/mem_menuIcon1.gif"/>-->账户信息管理</h1>
        
        
      
    
      
        
        
              <p><a href="">我的GG券</a></p>
        
      
    
      
        
        
              <p><a href="">我的GG卡</a></p>
        
      
    
      
        
        
              <p><a href="">我的积分</a></p>
        
      
    
      
        
        
              <p><a href="">合作商家优惠券</a></p>
        
      
    
      
        
        
              <p><a href="">修改资料</a></p>
        
      
    
      
        
        
              <p><a href="">修改密码</a></p>
        
      
    
      
        
          <h1><!--<img alt="" src="/style/guanggou/images/mem_menuIcon1.gif"/>-->我的社区</h1>
        
        
      
    
      
        
        
              <p><a href="">我的主页</a></p>
        
      
    
      
        
        
              <p><a href="">我的信箱</a></p>
        
      
    
      
        
        
              <p><a href="">我的圈子</a></p>
        
      
    
      
        
        
              <p><a href="">我的书评</a></p>
        
      
    
      
        
        
              <p><a href="">我的书架</a></p>
        
      
    
      
        
        
              <p><a href="">我的好友</a></p>
        
      
    
      
        
        
              <p><a href="">邀请好友</a></p>
        
      
    

   <div class="bottom"></div>
</div>

   <div class="memRight">
     <h1 class="memRightTitle">
      <div>我的地址薄</div>
     </h1>
   <div class="myadd_m1">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tbody><tr class="title">
              <td>收货人</td>
              <td>详情</td>
              <td>操作</td>
        </tr>
      
       
         
            <tr class="bg">

              <td class="td2">陈博伦</td>
              <td class="td3">
			     <div>手机：15872424222 <span>固话：</span></div>
				 <div>地址：苍龙岛</div>
				 <div>邮编：</div>
			  </td>
              <td class="td4">
              <span><a href="TB_iframe=true&amp;height=317&amp;width=500&amp;modal=ture" class="thickbox">[修改]</a></span>
               &nbsp;<a href="javascript:;" onclick="addrDel(649054);return false;">[删除]</a></td>
           </tr>
          
            <tr>

              <td class="td2">小小</td>
              <td class="td3">
			     <div>手机：12345678907 <span>固话：</span></div>
				 <div>地址：中央街</div>
				 <div>邮编：445674</div>
			  </td>
              <td class="td4">
              <span><a href="TB_iframe=true&amp;height=317&amp;width=500&amp;modal=ture" class="thickbox">[修改]</a></span>
               &nbsp;<a href="javascript:;" onclick="addrDel(649217);return false;">[删除]</a></td>
           </tr>
          
            <tr class="bg">

              <td class="td2">陈博伦</td>
              <td class="td3">
			     <div>手机：15872424222 <span>固话：</span></div>
				 <div>地址：苍龙岛</div>
				 <div>邮编：000000</div>
			  </td>
              <td class="td4">
              <span><a href="TB_iframe=true&amp;height=317&amp;width=500&amp;modal=ture" class="thickbox">[修改]</a></span>
               &nbsp;<a href="javascript:;" onclick="addrDel(649220);return false;">[删除]</a></td>
           </tr>
          
         
         
       
     </tbody></table>
      </div>
	 <div class="myadd_title"><a id="addAddress" href="javascript:void(0);" class="changes">新增收货地址 </a><span>温馨提示：在填写订单信息界面，可以直接选择地址薄中的地址</span></div>
  </div>
  <div class="clear"></div>
 </div>
 <script type="text/javascript">
	/* start-- 新增收货地址 */
	//点击新增按钮
	$('#addAddress').click(function() {
		$('#dialogContent').slideDown();
		$('#dialog').slideDown();
		$('#addAddrFrame').attr('src','<%=basePath %>/front/iframes/addAddress.jsp');
	});
	
	//点击对话框关闭按钮
	$('#TB_closeWindowButton').click(function() {
		$('#dialog').slideUp();
		$('#dialogContent').slideUp();
		$('#addAddrFrame').removeAttr('src');
	});
	/* end-- 新增收货地址 */
	
	//iframe调用关闭对话框
	function close(){
		$('#dialog').slideUp();
		$('#dialogContent').slideUp();
		$('#addAddrFrame').removeAttr('src');
		window.location.reload();
	}
</script>
<!-- 页脚-->
<div id="footer" style="text-align: center;">
	<!-- oldtest -->
	<!-- 页脚 added by alex 0819-->
	<div id="myfooter">
		<!-- 友情链接-->
		<div style="margin: 15px 0px 10px; text-align: center">友情链接：
			<a href="#" target="_blank">广州新华出版发行集团</a>&nbsp;| 
			<a href="#" target="_blank">广州新华书店</a>&nbsp;| 
			<a href="#" target="_blank">新浪读书</a>&nbsp;|&nbsp;
			<a href="#" target="_blank">卓越教育</a>&nbsp;|&nbsp;
			<a href="#" target="_blank">北京理工大学出版社</a>&nbsp;<br />&nbsp; 
			<a target="_blank" href="#">重庆出版社</a>&nbsp;|&nbsp;
			<a target="_blank" href="#">深圳生活指南</a>&nbsp;|&nbsp;
			<a target="_blank" href="#">厦门大学出版社</a>&nbsp;|&nbsp;
			<a target="_blank" href="#">浙江文艺出版</a>&nbsp;|&nbsp;
			<a target="_blank" href="#">中国传媒大学出版社</a> |&nbsp;
			<a target="_blank" href="#">书问搜索</a> |&nbsp;
			<a target="_blank" href="#">购书网站</a> |&nbsp;
			<a target="_blank" href="# ">广州二手房</a> 
			<a target="_blank" href="#">更多-&gt;</a>
		</div>
		<div>
			<a rel="nofollow" href="#">关于网站</a>  |  
			<a rel="nofollow" href="#">公司简介</a>  |  
			<a rel="nofollow" href="#">法律声明</a>  |  
			<a rel="nofollow" href="#">联系我们</a>  
		</div>
		<div style="margin: 15px 0px 5px; text-align: center">广州购书中心有限公司 版权所有&copy; 2010 经营许可证：粤B2-20040295 
			<a rel="nofollow" href="#" target="_blank">粤ICP备10095868号</a>
		</div>
		<!--可信网站图片LOGO安装开始--> 
		<a rel="nofollow" href="#"><img src="http://img3.cache.netease.com/www/seallogo.png" alt="" /></a>  
		<!--可信网站图片LOGO安装结束--><!--诚信电商logo-->
		<a target="_blank" href="http://www.eccsp.org/sitecn/aspx/certificationD.aspx?pid=1222">
		<img src="http://www.eccsp.org/sitecn/images/startimg.jpg" width="128" height="48" alt="" /></a>
		<!--诚信电商logo 结束-->
		<img src="<%=basePath %>/img/footer_img.gif" alt="" /> &nbsp;&nbsp; 
		<a rel="nofollow" href="http://www.gzjd.gov.cn/newgzjd/baojing/110.jsp?catid=318" target="_blank">
			<img src="http://www.pconline.com.cn/test/images/ktjc.gif" style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px" alt="" /> 
		</a>
		<a target="_blank" href="http://www.ghwsx.gov.cn/gholportal/home.aspx"><img width="100" height="75" border="0" longdesc="http://www.ghwsx.gov.cn/gholportal/home.aspx" alt="广货网上行" src="http://www.gg1994.com/images/ghwsxlogo2.jpg" /></a>
		<img src="<%=basePath%>/img/dyh.jpg" width="100px" hight="100px" style="margin-left:0px;" />
		<img src="<%=basePath%>/img/fwh.jpg" width="100px" hight="100px" style="margin-left:10px;" />
	</div>
	<!--google-->   
	<!-- UA--><!--UA end-->           
	<!-- end 页脚-->
</div>
</body>
</html>