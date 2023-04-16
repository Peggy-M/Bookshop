<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>

<html>
<head>
<title>商品详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/product.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/price.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/page.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/detail.css" rel="stylesheet" type="text/css"/>
<link type="text/css" href="<%=basePath%>/css/addthis.css" rel="stylesheet" media="all"/>
<link href="<%=basePath%>/css/favourites.css" rel="stylesheet" type="text/css"/>
<link type="text/css" rel="StyleSheet" media="all" href="<%=basePath%>/css/jquery.suggest.css"/>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.cycle.all.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.countdown.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/getcard1.js"></script>

<script type="text/javascript" src="<%=basePath%>/js/product.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/getcard.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bestcompages.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/baread.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/favourite.js"></script>

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
                fx:'scrollVert',
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
<link href="<%=basePath%>/css/stylae.css" type="text/css"/>
<!-- <link rel="shortcut icon" href="http://www.gg1994.com/favicon.ico"> -->

<style type="text/css">
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
 
<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/AddFavorite.js"></script>
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
				/* 我的账户URL */
				var accountUrl = '<%=basePath%>/Member/index.do';
				var welcomeStr='';
				if(usr!=null&&usr!="null"){
					welcomeStr=usr+'，欢迎来到图书商城：武汉购书中心网上书店！<a id="alex_member" href="'+accountUrl+'">我的账户</a>'+
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
		<h1><a href='<%=basePath%>/frontbook/home' target='_blank'><img src='<%=basePath%>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a></h1>
		<div class="shopping-car fr">
			<div id="IncludeSmallCartDiv"><a class="car" href="javascript:void(0);" onclick="myCart()">购物车</a></div><a href="<%=basePath%>/Member/allOrderList.do">我的订单</a>
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
			//点击购物车按钮
			function myCart() {
				if (usr!=null&&usr!="null") {
					window.location.href = '<%=basePath%>/cart/showcart';
				}else {
					$("#dialogContent").show();
					$("#dialog").slideDown();
					setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
				}
			}
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
<div class="all-classify">
全部图书分类<i></i>
<div class="list" style="display:none">
<dl>
<dt>
<a href="#">热点</a>
</dt>
<dd>
<a href="#" title="每月铿锵点书推荐 " target="_blank">
每月铿锵点书推荐 |
</a>
<a href="#" title="名家散文经典" target="_blank">
名家散文经典 |
</a>
<a href="#" title="查理九世" target="_blank">
查理九世 |
</a>
<a href="#" title="文创产品" target="_blank">
文创产品 |
</a>
<a href="#" title="杨红樱" target="_blank">
杨红樱 |
</a>
<a href="#" title="广购课程 " target="_blank">
广购课程 |
</a>
<a href="#" title=" 小屁孩日记" target="_blank">
小屁孩日记 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">小说</a>
</dt>
<dd>
<a href="#" title="青春" target="_blank">
青春 |
</a>
<a href="#" title="职场" target="_blank">
职场 |
</a>
<a href="#" title="科幻" target="_blank">
科幻 |
</a>
<a href="#" title="武侠" target="_blank">
武侠 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">文学/艺术</a>
</dt>
<dd>
<a href="#" title="传记" target="_blank">
传记 |
</a>
<a href="#" title="漫画" target="_blank">
漫画 |
</a>
<a href="#" title="设计" target="_blank">
设计 |
</a>
<a href="#" title="摄影" target="_blank">
摄影 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">经济/管理</a>
</dt>
<dd>
<a href="#" title="会计" target="_blank">
会计 |
</a>
<a href="#" title="金融" target="_blank">
金融 |
</a>
<a href="#" title="营销" target="_blank">
营销 |
</a>
<a href="#" title="企管" target="_blank">
企管 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">人文/社科 </a>
</dt>
<dd>
<a href="#" title="哲学" target="_blank">
哲学 |
</a>
<a href="#" title="宗教" target="_blank">
宗教 |
</a>
<a href="#" title="政治" target="_blank">
政治 |
</a>
<a href="#" title="历史 " target="_blank">
历史 |
</a>
<a href="#" title="法律" target="_blank">
法律 |
</a>
<a href="#" title="军事" target="_blank">
军事 |
</a>
<a href="#" title="国学" target="_blank">
国学 |
</a>
<a href="#" title="励志" target="_blank">
励志 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">少儿</a>
</dt>
<dd>
<a href="#" title="0--2" target="_blank">
0--2 |
</a>
<a href="#" title="3--6" target="_blank">
3--6 |
</a>
<a href="#" title="7-10" target="_blank">
7-10 |
</a>
<a href="#" title="11-14" target="_blank">
11-14 |
</a>
<a href="#" title="文学" target="_blank">
文学 |
</a>
<a href="#" title="益智" target="_blank">
益智 |
</a>
<a href="#" title="卡通" target="_blank">
卡通 |
</a>
<a href="#" title="科普" target="_blank">
科普 |
</a>
<a href="#" title="启蒙" target="_blank">
启蒙 |
</a>
<a href="#" title="亲子" target="_blank">
亲子 |
</a>
<a href="#" title="百科" target="_blank">
百科 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">生活</a>
</dt>
<dd>
<a href="#" title="养生" target="_blank">
养生 |
</a>
<a href="#" title="两性" target="_blank">
两性 |
</a>
<a href="#" title="旅游" target="_blank">
旅游 |
</a>
<a href="#" title="收藏" target="_blank">
收藏 |
</a>
<a href="#" title="居家" target="_blank">
居家 |
</a>
<a href="#" title="孕育" target="_blank">
孕育 |
</a>
<a href="#" title="装扮" target="_blank">
装扮 |
</a>
<a href="#" title="美食" target="_blank">
美食 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">语言/教育</a>
</dt>
<dd>
<a href="#" title="外语" target="_blank">
外语 |
</a>
<a href="#" title="方言" target="_blank">
方言 |
</a>
<a href="#" title="口才" target="_blank">
口才 |
</a>
<a href="#" title="教育" target="_blank">
教育 |
</a>
<a href="#" title="家教" target="_blank">
家教 |
</a>
<a href="#" title="小学" target="_blank">
小学 |
</a>
<a href="#" title="初中" target="_blank">
初中 |
</a>
<a href="#" title="高中" target="_blank">
高中 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">计算机/科技</a>
</dt>
<dd>
<a href="#" title="科普" target="_blank">
科普 |
</a>
<a href="#" title="自然科学" target="_blank">
自然科学 |
</a>
<a href="#" title="计算机" target="_blank">
计算机 |
</a>
<a href="#" title="医学" target="_blank">
医学 |
</a>
<a href="#" title="建筑" target="_blank">
建筑 |
</a>
<a href="#" title="农林" target="_blank">
农林 |
</a>
<a href="#" title="工业" target="_blank">
工业 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="#">其它分类</a>
</dt>
<dd>
<a href="#" title="专题推荐">
专题推荐 |
</a>
<a href="#" title="观古堂">
观古堂 |
</a>
</dd>
</dl>
<dl>
<dt><a href="#">英文进口图书</a></dt>
</dl>
<dl>
<dt><a href="#">港台进口图书</a></dt>
</dl>
<dl>
<dt><a href="#">电子书</a></dt>
</dl>
<dl>
<dt><a href="#">杂志/期刊</a></dt>
</dl>
<dl>
<dt><a href="#">特色书店</a></dt>
</dl>
<dl>
<dt><a href="#">特色书店</a></dt>
</dl>
<dl>
<dt><a href="#">特色书店</a></dt>
</dl>
<dl>
<dt><a href="#">特色书店</a></dt>
</dl>
<dl style="text-align:right;background-image:none;">
<dt><a href="#">全部图书分类</a></dt>
</dl>
</div>
</div>
 
<ul>
<li>
<a href="<%=basePath%>/frontbook/home">首页</a></li>
  <li><a href="<%=basePath%>/frontbook/Special?status=1&pageSize=30&pageNo=1">新书预售</a></li>
  <li><a href="<%=basePath%>/frontbook/HotNewBooks?status=2&pageSize=30&pageNo=1">新书精选</a></li>
  <li><a href="<%=basePath%>/frontbook/ProductList?status=3&pageSize=20&pageNo=1">特惠图书</a></li>
  <li><a href="<%=basePath%>/frontbook/TopIndex?status=4&pageSize=10&pageNo=1">畅销图书</a></li>
  <li><a href="javascript:void(0);">文创汇</a></li>
  <li><a href="javascript:void(0);">签名版</a></li>
  <li><a href="javascript:void(0);">电子书</a></li>
  <li><a href="<%=basePath%>/frontadvertise/adlist"">广购公告</a></li>
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
<!-- end index-->


<!-- start 中间部分 -->

<div id="head_position">
	<div class="breadcrumb w">
		<strong>
			<a href="">图书</a>
		</strong>
		><a href="javascript:void(0);">${type.typeFirst }</a>
		><a href="javascript:void(0);">
		${type.typeSecond }</a> 
	</div>
	<div class="w">
		<div id="pro_intro">
			<div class="preview">
				<div class="f_spec_n">
					<a href=""><img class="jqzoom" src="<%=basePath %>${book.bookCover }" alt="${book.bookName }" rel="<%=basePath %>${book.bookCover }" width="300" height="300"/></a>
					<div class="derate" style="display: none;">
						<span>满99<br/>减20</span>	
					</div>
				</div>
				<div class="f_spec_list" id="thumblist">
					<ul>
						<li class="tb-selected"><a href="#"><img src="<%=basePath %>${book.bookCover }" mid="<%=basePath %>${book.bookCover }" big="<%=basePath %>${book.bookCover }"></a></li>
					</ul>
				</div>
				<div class="share">
					<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
						<span class="bds_more">分享：</span>
					</div>
					<a onClick="_gaq.push(['_trackEvent', 'click','收藏键', '商品页>放入收藏夹']);addFavor('0','346918','','',false);closeFriendTab('showFriend')" href="javascript:;" class="share_fav">收藏商品</a>
				</div>
			</div>
			<script type="text/javascript" src="<%=basePath %>/js/jquery.imagezoom.min.js"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					$(".jqzoom").imagezoom();
					$("#thumblist li a").hover(function(){
						$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
						$(".jqzoom").attr('src',$(this).find("img").attr("mid"));
						$(".jqzoom").attr('rel',$(this).find("img").attr("big"));
					});
				});
			</script>
			<div class="intro-item">
				<h3>${book.bookName }<font color=red> </font></h3>
				<p class="number">
					<span>准备读(&nbsp;&nbsp;<em>0人</em>&nbsp;&nbsp;), &nbsp;&nbsp;正在读(&nbsp;&nbsp;<em>0人</em>&nbsp;&nbsp;), &nbsp;&nbsp;已读过(&nbsp;&nbsp;<em>0人</em>&nbsp;&nbsp;)</span>
				</p>
				<p class="author_p">
					<span>I S B N ：<b>${book.bookISBN }</b></span>
					<span>作&nbsp;&nbsp;&nbsp;&nbsp;者：
						<b>
							<a href="<%=basePath%>/frontbook//QueryByAuthor?author=${book.bookAuthor }">${book.bookAuthor }</a>&nbsp;
						</b>
					</span>
					<span>
						出 版 社：
						<b>
							<a href="<%=basePath%>/frontbook//queryByPress?press=${book.bookPress }">${book.bookPress }</a>
						</b>
					</span>
					<span>
					出版时间：
					<b>${book.bookPublishTime }</b>
					</span>
					<span>
					开&nbsp;&nbsp;&nbsp;&nbsp;本：<b>${book.bookSize }</b>
					</span>
					<span>
					版&nbsp;&nbsp;&nbsp;&nbsp;次：<b>${book.bookEdition }</b>
					</span>
				</p>
				<p class="review_p">
					<span>(共有<b>0</b>条用户评论 |<a href="javascript:void(0);">查看评论</a>|
						<a href="javascript:void(0);">写评论</a>)
					</span>
				</p>
				<dl class="price">
					<dt>
						<i style="letter-spacing:12px;">定价</i>
						<del>￥${book.bookPrice/100 }</del>
					</dt>
					<dd>
						<i>广购价</i><strong>￥ ${book.bookSellPrice/100 }</strong>
						<!-- <span>( <em>85</em> 折)为您节省</span>
						<b>￥7.60</b> -->
					</dd>
				</dl>
				<dl class="offer">
					<!-- <dt><i>促销</i> -->
					<!-- <dd><i>卡券</i>
						<a onClick="getCard('0','346918','500','500',true)" href="javascript:;"><span>满减99-20</span></a>
						<a onClick="getCard('0','346918','500','500',true)" href="javascript:;"><span>满减299-50</span></a>
						<a onClick="getCard('0','346918','500','500',true)" href="javascript:;"><span>满减599-100</span></a>
					</dd> -->
				</dl>
				<div style="display:none">
					<dl class="area-p">
					<dt>配送至</dt>
					<dd id="store-selector">
					<div class="text">
					<span>北京</span>
					<b></b>
					</div>
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
					<li><a href="javascript:void(0);">湖北</a></li>
					<li><a href="javascript:void(0);">湖南</a></li>
					<li><a href="javascript:void(0);" class="selected">广东</a></li>
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
					</dd>
					<dd id="credits-dl">
					<span>满80元免运费</span>
					<b></b>
					</dd>
					<script>
						//满减活动
						$("#credits-dl").hover(function(){
							$(this).find("b").css("background-image","url(images/addr-select-up.png)");
							
							$(this).find("ul").show();
						},function(){
							$(this).find("b").css("background-image","url(images/addr-select-down.png)");
							
							$(this).find("ul").hide();
						})
						//满减活动	
						
						
						//详情页配送地址
						$("#store-selector").hover(function(){
							$(this).find("ul").show();
						},function(){						
							$(this).find("ul").hide();
						})
						//配送地址
						
						////配送地址
						$("#store-selector ul li a").click(function(){
							$(this).addClass("selected").parent().siblings().children().removeClass("selected");
							var selectedAddr = $(this).text();
							$("#store-selector span").text(selectedAddr);
						})
					
					</script>
					</dl>
				</div>
				<form onsubmit="return false;" style="margin:0;">
					<dl id="last-dl">
						<dt style="display:none;">
							<input id="amount" name="jianshu" type="hidden" value="1"/>
						</dt>
						<dd>
							<input type="hidden" name="reqUrl" value=""/>
							<input type="hidden" id="bookId" name="bookId" value="${book.bookId}"/>
							<input type="hidden" name="merId" value="0"/>
							<a href="javascript:void(0);" class="addShop_btn" onclick="addToCart(${book.bookId});">&nbsp;&nbsp;加入购物车</a>
								<input type="submit" value="立刻购买" class="buy_btn" style="cursor: pointer;" onclick="buyNow(${book.bookId})"/>
							<a href="javascript:void(0);" class="ba_readbtn" ba_readIsbn="7020008747" style="display:none">试读</a>
						</dd>
					</dl>
				</form>
				
				
				<div id="showIncludeCart" style="margin:-50px 0 0 -30px; position:absolute;"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="blank_13"></div>
</div>


<script type="text/javascript">
	//点击加入购物车
	function addToCart(bookId) {
		if (usr==null||usr=="null") {
			$("#dialogContent").show();
			$("#dialog").find('h1').html('请先登录');
			$("#dialog").slideDown();
			setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
		}else{
			var url = '<%=basePath%>/cart/addcart.do';
			$.post(
				url,
				{
					bookId:bookId
				},
				function(data) {
					if (data=='success') {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('成功加入购物车');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}else if (data=='exist') {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('已加入购物车');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}else if (data=='undercarriage') {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('商品已下架');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}else {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('加入购物车失败');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}
				}
			);
		}
	}
	
	//点击立即购买
	function buyNow(bookId) {
		if (usr==null||usr=="null") {
			$("#dialogContent").show();
			$("#dialog").find('h1').html('请先登录');
			$("#dialog").slideDown();
			setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
		}else{
			var url = '<%=basePath%>/cart/addcart.do';
			$.post(
				url,
				{
					bookId:bookId
				},
				function(data) {
					if (data=='success') {
						window.location.href = '<%=basePath%>/cart/showcart';
					}else if (data=='exist') {
						window.location.href = '<%=basePath%>/cart/showcart';
					}else if (data=='undercarriage') {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('商品已下架');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}else {
						$("#dialogContent").show();
						$("#dialog").find('h1').html('购买失败');
						$("#dialog").slideDown();
						setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
					}
				}
			);
		}
	}
</script>


<div class="w">
	<div id="fitting-suit" style="display: none;">
		<div class="mt">
			<ul class="tab">
				<li class="switchable-item curr"> <a href="#none">精选组合</a> </li>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="mc">
			<div class="switch-panel" style="display:block">
				<div class="min-tab">
					<ul>
						<li class="curr"><a href="#none">套餐搭配</a></li>
					</ul>
				</div>
				<div class="min-switch-panel match-con" id="match-con-01" style="display:block;">
				<div class="master">
					<div class="p-img">
						<a target="_blank" href=""><img src="" alt="" width="130" height="130"/></a>
					</div>
					<div class="p-name ac">
						<a target="_blank" href="" title=""></a>
					</div>
					<div class="p-price ac">
						<strong> ￥43.00 </strong>
						<input type="hidden" value="43.00"/>
					</div>
				</div>
				<div class="suits">
					<ul>
						<li>
							<div class="p-img">
								<a target="_blank" href=""><img src="" alt="" height="130" width="130"/></a>
							</div>
							<div class="p-name ac">
								<a target="_blank" href="" title="">三国演义(上下)(中国古典文学读本丛书)</a>
							</div>
							<div class="p-price ac">
								<input type="checkbox" id="ck289105" onclick="javascript:checkbox(this,289105)" value="￥33.60"/>
								<strong>￥33.60</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a target="_blank" href=""><img src="" alt="" height="130" width="130"/></a>
							</div>
							<div class="p-name ac">
								<a target="_blank" href="" title="西游记(上下)(中国古典文学读本丛书)">西游记(上下)(中国古典文学读本丛书)</a>
							</div>
							<div class="p-price ac">
								<input type="checkbox" id="ck290411" onclick="javascript:checkbox(this,290411)" value="￥40.10"/>
								<strong>￥40.10</strong>
							</div>
						</li>
					</ul>
				</div>
				<div class="infos">
					<p>已选择<b class="number" id="bestcount">0 </b>件搭配</p>
					<p>套餐价：<strong class="total" id="sumopriceDiv"> ￥0.00 </strong></p>
					<form action="" method="get" onsubmit="javascript:return checkBForm();">
						<input type="hidden" id="destObjIds" name="destObjIds"/>
						<input type="hidden" name="ObjectId" value="346918"/>
						<input type="hidden" name="isSome" value="1"/>
						<input type="hidden" name="relationType" value="3"/>
						<input type="submit" value="立即购买"/>
					</form>
					<div class="group_hint" id="packMess" style="">请至少保留一件商品。</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        var prodJson = {"prod":[{"price":"43.00","pid":346918,"oprice":"50.60"},{"price":"33.60","pid":289105,"oprice":"39.50"},{"price":"40.10","pid":290411,"oprice":"47.20"}]};
        unitAll();
	</script>
	<script>
		var wLi = 177;
		var lLi = $('.suits ul li').length;
		
		$('.suits ul').width(wLi*lLi);
		
		
		//tab 切换
		$("#fitting-suit .tab li").click(function(){
			var index=$(this).index();
			$(this).addClass('curr').siblings().removeClass('curr');
			$('.switch-panel').eq(index).show().siblings('.switch-panel').hide();		
		});
		
		//套餐切换
		$("#fitting-suit .min-tab li").click(function(){
			var index=$(this).index();
			$(this).addClass('curr').siblings().removeClass('curr');
			$('.match-con').eq(index).show().siblings('.match-con').hide();		
		});
		
	
		//默认
		//GetCount();
			
		// 点击
		//$("#match-con-01 .suits input").click(function () {			
		//		GetCount();
		//});
		
		/******************
		function GetCount() {
			var defaultV=parseInt($("#match-con-01 .master input").val());		
			var conts = defaultV;	
			var aa = 0;
			$("#match-con-01 .suits input").each(function () {		
				if($(this).is(':checked')){								
						conts += parseInt($(this).val());		
						aa += 1;
				}
			});	
			$("#match-con-01 .number").text(aa);
			$("#match-con-01 .total").html((conts).toFixed(2));		
		}
		*/
    </script>
	<script>
		/*
			var oPrice = Number($(".match-con .master .p-price input").val().split("￥")[1]);
			var conts = oPrice;
			var aa = 0;
			$(".match-con .suits .p-price input").click(function(){
				if($(this).is(':checked')){
					conts += Number($(this).val().split("￥")[1]);
					aa += 1;
				}else{
					conts -= Number($(this).val().split("￥")[1]);
					aa -= 1;
				}
				$("#bestcount").text(aa);
				$("#sumopriceDiv").html((conts).toFixed(2));
			})
			*/
	
	</script>
	<div class="pt16">
		<div class="w212 fl">
			<div class="view-notes bor w-tt mt13">
				<h3>看过本商品的人还买了</h3>
				<dl>
					<dt>
						<a href=" "><img src="" width="120" height="120"/></a>
					</dt>
					<dd>
						<div>
							<div class="marketPrice"><span class="priceName">定价：</span><span class="priceValue">￥28.00</span></div>
							<div class="memberPrice"><span class="priceName">广购价：</span><span class="priceValue">￥23.80</span></div>
						</div>
						<div>
							<a href="">围城</a>
						</div>
						<div>
						</div>
					</dd>
				</dl>
			</div>
			<div class="view-notes bor w-tt mt13">
				<h3>看过本商品的人还看了</h3>
				<dl>
					<dt>
						<a href=" "><img src="" width="120" height="120"/></a>
					</dt>
					<dd>
						<div>
							<div class="marketPrice"><span class="priceName">定价：</span><span class="priceValue">￥18.00</span></div>
							<div class="memberPrice"><span class="priceName">广购价：</span><span class="priceValue">￥15.30</span></div>
						</div>
						<div>
							<a href="">俗世奇人(修订版)</a>
						</div>
						<div>
						</div>
					</dd>
				</dl>
			</div>
			<div id="AutherWorkId"></div>
		</div>
		<div class="fl">
 
		<div class="pro-details" id="product-detail">
			<ul class="tab">
				<li class="cur"><a href="">商品详情</a></li>
				<!-- <li><a href="#comment">商品评论(<i>0</i>条)</a></li> -->
			</ul>
			<div class="switch2-panel">
				<div class="mt-left-nav">
					<ul>
				</div>
				<div class="last"></div>
				
				<!-- 商品详情内容区域 -->
				<div id="detail-tag-id-1">
					${book.bookDetails }
				</div>
			</div>
			<script>
				$(function(){
					$(window).scroll(function(){	
						
						var bottomH = $('#comment').offset().top - 200;
                        var topH =	$('.switch2-panel').offset().top;				
						
						if($(window).scrollTop()>topH&&$(window).scrollTop()<bottomH){
							$(".mt-left-nav").addClass('fixed');                        				
						}
						else{
							$(".mt-left-nav").removeClass('fixed');
						}					 
					});				
				});
			</script>
			<script type="text/javascript">
			    function getEvent() {
			           if (document.all) {
			               return window.event; //for ie
			           }
			           func = getEvent.caller;
			           while (func != null) {
			               var arg0 = func.arguments[0];
			               if (arg0) {
			                   if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
			                       return arg0;
			                   }
			               }
			               func = func.caller;
			           }
			           return null;
			       }
			
			       var num = new Array();
			       var j=0;
			       var cable = true;
			       function reamkhelpers(id,isIncreaseHelpTimes,helpTimes,aid){
			         for(var i=0; i<num.length;i++){
			             if(num[i]==aid){
			                 cable=false;
			                 alert("你已经参与过此评论！");
			
			             }
			         }
			         if(cable){
			              var evt=getEvent();
			             // var el=evt.target||evt.srcElement;
			               DWRRemarkHelper.updateTimes(id,isIncreaseHelpTimes,function(data){
			           if(data){
			             jQuery("#helpTimes"+id).html(helpTimes+1);
			
			              /*jQuery("#det_lm4zxt4"+aid).disabled=true;
			                el.disabled=true;
			               el.onclick="return false";*/
			              num[j]=aid;
			               j++;
			           }
			         });
			         }
			          cable = true;
			
			       }
			       function remarkhelpers(id,isIncreaseHelpTimes,isIncreaseOpposeTimes,opposeTimes,aid){
			
			           for(var i=0; i<num.length;i++){
			                if(num[i]==aid){
			                    cable=false;
			                    alert("你已经参与过此评论！");
			                }
			            }
			            if(cable){
			                var evt=getEvent();
			         //var el=evt.target||evt.srcElement;
			         DWRRemarkHelper.updateBothTimes(id,isIncreaseHelpTimes,isIncreaseOpposeTimes,function(data){
			              if(data){
			             jQuery("#opposeTimes"+id).html(opposeTimes+1);
			
			                /* jQuery("#det_lm4zxt4"+aid).disabled=true;
			                   el.disabled=true;
			                   el.onclick="return false";*/
			                 num[j]=aid;
			                  j++;
			
			              }
			            });
			            }
			            cable = true;
			       }
			       function show(id){
			       if(id==1){
			           jQuery("#xinqing").show();
			       }
			       if(id==2){
			           jQuery("#ruedu").show();
			       }
			    }
			    function hide(id){
			       if(id==1){
			           jQuery("#xinqing").hide();
			       }
			       if(id==2){
			           jQuery("#ruedu").hide();
			       }
			    }
			    //jQuery(document).ready(function(){
			    //	window.location.hash="toRemarkTop";
			   // });
			   
			   jQuery(document).ready(function(){
				   onReplyClick();
				   var aObj=jQuery("#infoPage a");
			            for(i=0;i<=aObj.length;i++){
			                var aHref=jQuery(aObj.get(i)).attr("href");
			             	jQuery(aObj.get(i)).attr("href",aHref+"#toRemarkTop");  
			                }
			   });
			
			
			   /*显示回复*/
			   function onReplyClick(){
			           jQuery("a[id^='showRely']").toggle(function(){
			                   var $tabId = jQuery(this).html('关闭所有回复').attr("tabId");
			                   jQuery("#showReplysDiv"+$tabId).load("/Remark/ReplyRemark.do",{belongTo:$tabId,state:1});
			                   jQuery("#showReplysDiv"+$tabId).show();
			                   setTimeout(function(){parent.dyniframesize('iframe');},300);
			
			           },function(){
			                 var $tabId = jQuery(this).html('显示所有回复').attr("tabId");
			                   jQuery("#showReplysDiv"+$tabId).hide();
			                   parent.dyniframesize('iframe');
			           });
			          
			       }
			</script>
 
 			<!-- 商品评论 -->
			<div id="comment">
			<div class="discu-title">
				<strong class="c3">商品评论</strong><span>(<i class="c2a">0</i>条)</span>
			</div>
			<div class="discusstab">
				<a class="current" href="javascript:void(0);">全部(0)</a>
			</div>
			<div class="discusslist">
				<ul>
					<li>暂无评论~</li>
				</ul>
			</div>
 
			<script>
				var $tabA = $('.discusstab a');
				var $ul2 = $('.discusslist ul');
				$tabA.click(function(){				
					var $this = $(this);
					var $t = $this.index();
					$tabA.removeClass();
					$this.addClass('current');
					$ul2.css('display','none');
					$ul2.eq($t).css('display','block');
				})
			</script>
			</div>
 
 
		<!-- <div class="detail-switch-list" id="history">
			<div class="tt c3 mt30">
				<strong>浏览记录</strong>
			</div>
			<div class="list">
				<div class="bookList">
					<ul style="margin-left: 0px;">
						<li>
							<a href=" "><img src=""/></a>
							<p><a href="/Product.do?id=346918">水浒传(上下)(中国古典文学读本丛书)</a></p>
							<div class="marketPrice"><span class="priceName">定价：</span><span class="priceValue">￥50.60</span></div>
							<div class="memberPrice"><span class="priceName">广购价：</span><span class="priceValue">￥43.00</span></div>
						</li>
					</ul>
				</div>
				<i class="prev"></i>
				<i class="next"></i>
			</div>
		</div> -->
		
		<script>
			var mClick = 0;//定义多次点击事件	改值等于0时移动完毕		等于1时正在移动
			$("i.prev").click(function(){
				if( mClick == 0){
					mClick = 1;
					$("#history .bookList ul").prepend($("#history .list .bookList ul li:last-child"));
					$("#history .bookList ul").css("margin-left","-187px");
					$("#history .bookList ul").animate({"margin-left":"0"},500,function(){
						mClick = 0;
					});
				}else{
					return false;
				}
			})
			$("i.next").click(function(){
				if( mClick == 0 ){
					mClick = 1;
					$("#history .bookList ul").animate({"margin-left":"-187px"},500,function(){
						$("#history .list .bookList ul").append($("#history .list .bookList ul li:first-child"));
						$("#history .bookList ul").css("margin-left","0");
						mClick = 0;
					});
				}else{
					return false;
				}
			})
			//新书上架列表数量如果少于7个，隐藏左右切换按钮
			var newBL = $("#history .list .bookList ul li").length;
			if( newBL < 6 ){
				$("#history .list i").hide();
			}
			//新书上架列表数量如果少于7个，隐藏左右切换按钮
		</script>
 
		<div class="bot"></div>
		<div style="height:80px;"></div>
	</div>
</div>
<div class="clear"></div>
</div>
</div>


<!-- Bottom:底部 -->

<div class="footer">

<!-- begin 购物帮助-->

	<div class="contain">
 		<dl>	
		 	<!-- <ul  > -->
		    <dt>会员注册</dt>
			<dd><i></i><a href="#">新用户注册</a></dd>
			<dd><i></i><a href="#">会员积分政策</a></dd>
		</dl>
		<dl>	
		 	<!-- <ul  > -->
		    <dt>支付方式</dt>
			<dd><i></i><a href="#">货到付款</a></dd>
			<dd><i></i><a href="#">银行汇款</a></dd>
			<dd><i></i><a href="#">邮局汇款</a></dd>
			<dd><i></i><a href="#">第三方支付方式</a></dd>
		</dl>
		<dl>	
		 	<!-- <ul  > -->
		    <dt>购物流程</dt>
			<dd><i></i><a href="#">订购演示</a></dd>
			<dd><i></i><a href="#">GG卡和GG券使用说明</a></dd>
			<dd><i></i><a href="#">团购服务指引</a></dd>
		</dl>
		<dl>	
		 	<!-- <ul  > -->
		    <dt>配送方式</dt>
			<dd><i></i><a href="#">配送费用/时间/范围</a></dd>
		</dl>
		<dl>	
		 	<!-- <ul class='last'> -->
		    <dt>售后服务</dt>
			<dd><i></i><a href="#">发票制度</a></dd>
			<dd><i></i><a href="#">退款方式</a></dd>
			<dd><i></i><a href="#">退换货流程</a></dd>
			<dd><i></i><a href="#">联系我们</a></dd>
		</dl>
	</div>
</div>

<!-- end 购物帮助-->

<!-- 页脚-->
<div id="footer" >
	<!-- oldtest -->
	<!-- 页脚 added by alex 0819-->
	<div id="myfooter" style="text-align: center;">
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
		<img src="<%=basePath %>/img/dyh.jpg" width="100px" hight="100px" style="margin-left:0px;" />
		<img src="<%=basePath %>/img/fwh.jpg" width="100px" hight="100px" style="margin-left:10px;" />
	</div>
	<!--google-->   
	<!-- UA--><!--UA end-->           
	<!-- end 页脚-->
</div>
 
<!-- end 页脚-->
	
<script type="text/javascript">
    //设置飘浮目录
    var lastScrollY = 0;
    function heartBeat(){
        var diffY;
        if (document.documentElement && document.documentElement.scrollTop)
            diffY = document.documentElement.scrollTop;
        else if (document.body)
            diffY = document.body.scrollTop
        else
        {/*Netscape stuff*/}
        /* if (diffY==0){document.getElementById("rightDiv").style.display="none"
         }else{document.getElementById("rightDiv").style.display=""}*/

        //alert(diffY);
        percent=.1*(diffY-lastScrollY);
        if(percent>0)percent=Math.ceil(percent);
        else percent=Math.floor(percent);
        //document.getElementById("leftDiv").style.top = parseInt(document.getElementById("leftDiv").style.top)+percent+"px";
        //document.getElementById("rightDiv").style.top = parseInt(document.getElementById("rightDiv").style.top)+percent+"px";
        lastScrollY=lastScrollY+percent;
        //alert(lastScrollY);
    }

    window.setInterval("heartBeat()",5);

</script>
    
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" id="bdshare_js" data="type=slide&amp;pos=left&amp;uid=6456503" ></script>  
<script type="text/javascript" id="bdshell_js" data="type=uid=6456503" ></script> 
<script type="text/javascript">
	document.getElementById('bdshell_js').src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>

<!-- JiaThis Button END -->

</body>
</html>


