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
	/*end 卡券模块样式*/
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
				/* 我的账户URL */
				var accountUrl = '<%=basePath%>/Member/index.do';
				var welcomeStr='';
				if(usr!=null&&usr!="null"){
					welcomeStr=usr+'，欢迎来到图书商城：武汉购书中心网上书店！<a id="alex_member" href="'+accountUrl+'">我的账户</a>'+
							' <a id="logout" href="javascript:void(0);">退出</a>'+'<a href="<%=basePath%>/Member/allOrderList.do">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';						
				}else{
					welcomeStr='您好，欢迎来到图书商城：武汉购书中心网上书店！<a href="'+loginUrl+'">登录</a>'+
						'<a href="'+registerUrl+'">新用户注册</a>'+'<a href="<%=basePath%>/Member/allOrderList.do">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';
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
									'<a href="'+registerUrl+'">新用户注册</a>'+'<a href="<%=basePath%>/Member/allOrderList.do">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';
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
			<a href='javascript:void(0);' target='_blank' style="display: none;"><img src='<%=basePath%>/img/top-brand.jpg' width='1200' height='106' alt='' border='0'/></a>
		</div>
		<h1><a href="<%=basePath%>/frontbook/home"><img src='<%=basePath%>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a></h1>
		<div class="shopping-car fr">
			<div id="IncludeSmallCartDiv"><a class="car" href="javascript:void(0);" onclick="myCart()">购物车</a></div><a href="<%=basePath%>/Member/allOrderList.do">我的订单</a>
		</div>
		
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
		</script>
		
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
					<!-- <a href="javascript:void(0);">高级搜索</a></span> -->
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
			<div class="all-classify">
				全部图书分类<i></i>
				<div class="list" style="display: none">

					<!-- begin 测试demo -->
					<!-- <dl>
						<dt>
							<a href="javascript:void(0);">热点</a>
						</dt>
						<dd>
							<a href="#" title="每月铿锵点书推荐 " target='_blank'> 每月铿锵点书推荐 | </a> <a
								href="#" title="名家散文经典" target='_blank'> 名家散文经典 | </a> <a
								href="#" title="查理九世" target='_blank'> 查理九世 | </a> <a href="#"
								title="文创产品" target='_blank'> 文创产品 | </a> <a href="#"
								title="杨红樱" target='_blank'> 杨红樱 | </a> <a href="#"
								title="广购课程 " target='_blank'> 广购课程 | </a> <a href="#"
								title=" 小屁孩日记" target='_blank'> 小屁孩日记 | </a>
						</dd>
					</dl> -->
					<!-- end 测试demo -->

					<!-- 显示分类列表开始 -->
					<c:forEach var="type2andtype1" items="${type2aboutType1Beanlist}">
						<dl>
							<dt>
								<a href="javascript:void(0);">${type2andtype1.typeoneName}</a>
							</dt>
							<dd>
								<c:forEach items="${type2andtype1.secondtype}" var="type2">
									<a href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=${type2.typeId}" title="${type2.typeName}" target='_blank'>
										${type2.typeName}| </a>
								</c:forEach>
							</dd>
						</dl>
					</c:forEach>
					<!-- 显示分类列表结束 -->

					<!-- <dl>
						<dt>
							<a href="javascript:void(0);">其它分类</a>
						</dt>
						<dd>
							<a href="javascript:void(0);" title="专题推荐">专题推荐 |</a> <a
								href="javascript:void(0);" title="观古堂">观古堂 |</a>
						</dd>
					</dl> -->

				<!-- 	<dl>
						<dt>
							<a href="javascript:void(0);">英文进口图书</a>
						</dt>
					</dl>
					<dl>
						<dt>
							<a href="javascript:void(0);">港台进口图书</a>
						</dt>
					</dl>
					<dl>
						<dt>
							<a href="#">电子书</a>
						</dt>
					</dl>
					<dl>
						<dt>
							<a href="#">杂志/期刊</a>
						</dt>
					</dl>
					<dl style="text-align: right; background-image: none;">
						<dt>
							<a href="#">全部图书分类</a>
						</dt>
					</dl> -->
				</div>
			</div>
			<ul>
				<li class="cur"><a href="<%=basePath%>/frontbook/home"
					class="current">首页</a></li>
				<li><a
					href="<%=basePath%>/frontbook/Special?status=1&pageSize=10&pageNo=1">新书预售</a></li>
				<li><a
					href="<%=basePath%>/frontbook/HotNewBooks?status=2&pageSize=10&pageNo=1">新书精选</a></li>
				<li><a
					href="<%=basePath%>/frontbook/ProductList?status=3&pageSize=10&pageNo=1">特惠图书</a></li>
				<li><a
					href="<%=basePath%>/frontbook/TopIndex?status=4&pageSize=10&pageNo=1">畅销图书</a></li>
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
		$(".all-classify").hover(function() {
			$(this).find(".list").show();
		}, function() {
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
		$(".all-classify").hover(function() {
			$(".all-classify .list").show();
		}, function() {
			$(".all-classify .list").show();
		});
	</script>

	<!--首页图片begin-->
	<div class="banner">
		<ul>
			<li style="background-image:url(<%=basePath%>/img/banner.jpg)"><a
				href="#"></a></li>
			<li style="background-image:url(<%=basePath%>/img/banner1.jpg)"><a
				href="#"></a></li>
			<li style="background-image:url(<%=basePath%>/img/banner2.jpg)"><a
				href="#"></a></li>
			<li style="background-image:url(<%=basePath%>/img/banner3.jpg)"><a
				href="#"></a></li>
			<li style="background-image:url(<%=basePath%>/img/banner4.jpg)"><a
				href="#"></a></li>
		</ul>
		<div class="circular-list"></div>
		<div class="LR-btn">
			<span class="prev"></span> <span class="next"></span>
		</div>
		<div class="activityPic" style="background: white;">
			<script src="/js/jq_scroll.js" type="text/javascript"></script>
			<style>
.box {
	height: 150px;
	overflow: hidden;
} /*这里的高度和超出隐藏是必须的*/
</style>
			<script type="text/javascript">
				$(document).ready(function() {
					//$(".box").Scroll({line:1,speed:500,timer:2000,up:"but_up",down:"but_down"});
				});
			</script>
			<div class="notice">
				<span>书城公告</span> <a href="#">更多></a>
			</div>
			<div class="notice-list">
				<ul>
					<li><b></b><a href="#" target='_blank' title="注册新会员优惠活动">注册新会员优惠活动</a></li>
					<li><i>.</i><a href="#" title=" 广州购书中心天津分店招聘启示">
							广州购书中心天津分店招聘启示</a></li>
				</ul>
			</div>
			<div class="customer_service"
				style="margin-top: 25px; padding-left: 5px;">
				<a href="https://static.meiqia.com/dist/standalone.html?_=t&eid=65494"><img border="0"
					src="<%=basePath%>/img/QQtalk.png" alt="点击这里给我发消息"
					title="点击这里给我发消息"></a>&nbsp; 客服
			</div>
			<script type='text/javascript'>
    (function(m, ei, q, i, a, j, s) {
        m[i] = m[i] || function() {
            (m[i].a = m[i].a || []).push(arguments)
        };
        j = ei.createElement(q),
            s = ei.getElementsByTagName(q)[0];
        j.async = true;
        j.charset = 'UTF-8';
        j.src = '//static.meiqia.com/dist/meiqia.js?_=t';
        s.parentNode.insertBefore(j, s);
    })(window, document, 'script', '_MEIQIA');
    _MEIQIA('entId', 65494);
</script>
			<img style="padding-left: 5px;" src="<%=basePath%>/img/QQtalk1.png">400-886-4208<br />
			<img style="padding-left: 5px;" src="<%=basePath%>/img/QQtalk3.png">服务时间：9:00-21:30
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>/js/banner.js"></script>

	<!--首页图片end-->

	<div class="sidebar contain">
		<div class="custom">

			<!-- 卡券模块板块 -->

			<%-- <div class="title">
				<span>卡券模块</span>
			</div>
			<dt>
				<i></i>
			</dt>
			<dd>
				<i></i> <a class="a1" onClick="getCard()" href="javascript:;"> <span
					class="span1">满减99-20</span>
				</a>

				<c:forEach var="card" items="${cardList }">
					<a class="a1" onClick="" href="javascript:;"> <span
						class="span1">满减99-20</span>
					</a>
				</c:forEach>
				<!--
				<a onClick="getCard('','','500','500',true)" href="javascript:;">领取卡券</a>
			-->
			</dd>
 --%>
			<!-- 广购爆品板块 -->

			<div class="title" style="clear: both;">
				<span>网购爆品</span>
			</div>
			<div class="list">
				<ul>

					<!-- <li>
	           		<a target="_blank" href="#"  title="孤独六讲(精)"><img src="#" alt="孤独六讲(精)" title="孤独六讲(精)"/></a>
	              	<p><a target="_blank" href="#">孤独六讲(精)</a></p>
					定价
					<del>原价：￥48.00</del>
					<br/>
					<span ><font>￥40.80</font></span>				             					
	   		   </li> -->

					<c:forEach var="boombook" items="${boomlist}">
						<li><a target="_blank"
							href="<%=basePath %>/frontbook/Product?id=${boombook.bookId}"
							title="${boombook.bookName}"><img
								src="<%=basePath%>${boombook.bookCover}"
								alt="${boombook.bookName}" title="${boombook.bookName}" /></a>
							<p>
								<a target="_blank"
									href="<%=basePath %>/frontbook/Product?id=${boombook.bookId}">${boombook.bookName}</a>
							</p> <!--定价--> <del>原价：￥${boombook.bookPrice/100}</del> <!-- <br/> -->
							<span><font>￥${boombook.bookSellPrice/100}</font></span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<%-- <div class="dishes">
	
		<!-- 专题推荐板块 -->
		
		<div class="title"><span><!-- 正宗绝色粤菜 -->专题推荐</span></div>
		<div class="dishes_list">
			<ul>
				<li>
				   <a href="#"><img src="#" alt="外婆的道歉信"/></a>
				   <i>外婆的道歉信</i>
				   <span> </span>
				</li>
				<c:forEach var="book" items="${books }">
					<li>
					   <a href="#"><img src="#" alt="外婆的道歉信"/></a>
					   <i>外婆的道歉信</i>
					   <span> </span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div> --%>
		<div class="hot">

			<!-- 热卖图书板块 -->

			<div class="title">
				<span>热卖图书</span>
			</div>
			<div class="list">
				<ul>
					<c:forEach var="hotbook" items="${hotbooks}">
						<li style="width: 150px;"><a target="_blank"
							href="<%=basePath %>/frontbook/Product?id=${hotbook.bookId}"
							title="${hotbook.bookName}"> <img
								src="<%=basePath%>${hotbook.bookCover}"
								alt="${hotbook.bookName}" title="${hotbook.bookName}" />
						</a>
							<p>
								<a target="_blank"
									href="<%=basePath %>/frontbook/Product?id=${hotbook.bookId}">${hotbook.bookName}</a>
							</p> <!--定价--> <del>原价：${hotbook.bookPrice/100}</del> <!-- <br/> -->
							<span><font>${hotbook.bookSellPrice/100}</font></span></li>
					</c:forEach>
				</ul>
			</div>
			<script>
				$(".custom .list ul li:nth-child(5)").css("margin-right", "0");
				$(".hot .list ul li:nth-child(5)").css("margin-right", "0");
			</script>
		</div>

		<div class="newBook contain">

			<!-- 新书上架板块 -->

			<div class="title">新书上架</div>
			<div class="main">
				<div class="list">
					<div class="bookList">
						<ul>
							<c:forEach var="book2" items="${books2}">
								<li><a target="_blank"
									href="<%=basePath%>/frontbook/Product?id=${book2.bookId}"
									title="${book2.bookName}"> <img
										src="<%=basePath%>${book2.bookCover}" alt="${book2.bookName}"
										title="${book2.bookName}" />
								</a>
									<p>
										<a target="_blank"
											href="<%=basePath%>/frontbook/Product?id=${book2.bookId}">${book2.bookName}</a>
									</p> <!--定价--> <del>原价：${book2.bookPrice/100}</del> <!-- <br/> -->
									<span><font>${book2.bookSellPrice/100}</font></span></li>
							</c:forEach>
						</ul>
					</div>
					<i class="prev"></i> <i class="next"></i>
				</div>
			</div>
		</div>

		<!-- 新书上架板块 -->

		<script>
			var mClick = 0;//定义多次点击事件	改值等于0时移动完毕		等于1时正在移动
			$("i.prev")
					.click(
							function() {
								if (mClick == 0) {
									mClick = 1;
									$(".newBook .main .list .bookList ul")
											.prepend(
													$(".newBook .main .list .bookList ul li:last-child"));
									$(".bookList ul").css("margin-left",
											"-197px");
									$(".bookList ul").animate({
										"margin-left" : "0"
									}, 500, function() {
										mClick = 0;
									});
								} else {
									return false;
								}
							})

			$("i.next")
					.click(
							function() {
								if (mClick == 0) {
									mClick = 1;
									$(".bookList ul")
											.animate(
													{
														"margin-left" : "-197px"
													},
													500,
													function() {
														$(
																".newBook .main .list .bookList ul")
																.append(
																		$(".newBook .main .list .bookList ul li:first-child"));
														$(".bookList ul").css(
																"margin-left",
																"0");
														mClick = 0;
													});
								} else {
									return false;
								}
							})

			//新书上架列表数量如果少于7个，隐藏左右切换按钮
			var newBL = $(".newBook .main .list .bookList ul li").length;
			if (newBL < 7) {
				$(".newBook .main .list i").hide();
			}
			//新书上架列表数量如果少于7个，隐藏左右切换按钮
		</script>

		<div class="promo contain">
			<div class="fr limit">
				<div class="title">
					<i></i>限时抢购
				</div>
				<!-- 1 count
			   1072979 id
			   -->
				<c:forEach var="limitbook" items="${limitbooks}">
					<div class="pic">
						<a target="_blank"
							href="<%=basePath %>/frontbook/Product?id=${limitbook.bookId}"
							tabindex="_blank"><img
							src="<%=basePath%>${limitbook.bookCover}"
							alt="${limitbook.bookName}" title="${limitbook.bookName}"
							width="175" alt="${limitbook.bookName}" /></a>
						<!--促销-->
					</div>
					<p>
						<a target="_blank"
							href="<%=basePath %>/frontbook/Product?id=${limitbook.bookId}"
							tabindex="_blank">${limitbook.bookName}</a>
					</p>
					<div class="price">
						<del>${limitbook.bookPrice/100}</del>
						<span>抢购价：<font>${limitbook.bookSellPrice/100}</font></span>
					</div>
				</c:forEach>
			</div>
			<div class="list">
				<div class="title">每周促销</div>
				<ul>
					<c:forEach items="${books3}" var="book3">
						<li><a
							href="<%=basePath %>/frontbook/Product?id=${book3.bookId}"
							target="_blank"> <img src='<%=basePath%>${book3.bookCover}'
								alt="${book3.bookName}" width="120" height="120" />
						</a>
							<p>
								<a href="<%=basePath %>/frontbook/Product?id=${book3.bookId}"
									target="_blank">${book3.bookName}</a>
							</p> <!-- 定价--> <del>原价：${book3.bookPrice/100}</del> <span>
								<!--广购价：-->
								<font>${book3.bookSellPrice/100}</font>
						</span></li>
					</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<script>
			$(".promo .list ul li:nth-child(5n)").css("margin-right", "0");
		</script>

		<div class="clear"></div>
		<div class="column contain">
			<div class="ranking fr">
				<div class="rankingNav">
					<div class="title">
						<a class="fr" href="#">更多&gt;</a><i></i>7日畅销榜
					</div>
					<ul>
						<li class="cur"><a href="javascript:void(0);" class="current"
							id="Menu31" title="管理">少儿</a></li>
						<li><a href="javascript:void(0);" id="Menu32" title="经济">经济</a></li>
						<li><a href="javascript:void(0);" id="Menu33" title="历史">生活</a></li>
						<li><a href="javascript:void(0);" id="Menu34" title="小说">小说</a></li>
						<li><a href="javascript:void(0);" id="Menu35" title="文学">文学</a></li>
					</ul>
				</div>
				<div class="list">
					<ul style="display: block;">
						<c:forEach items="${list21}" var="book21" varStatus="status">
							<li><i class="top">${status.count}</i> <a
								href="<%=basePath %>/frontbook/ProductByName?bookName=${book21}"
								target="_blank">${book21}</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach var="book18" items="${list18}" varStatus="status">
							<li><i class="top">${status.count}</i> <a
								href="<%=basePath %>/frontbook/ProductByName?bookName=${book18}"
								target="_blank">${book18}</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach items="${list22}" var="book22" varStatus="status">
							<li><i class="top">${status.count}</i> <a
								href="<%=basePath %>/frontbook/ProductByName?bookName=${book22}"
								target="_blank">${book22}</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach items="${list16}" var="book16" varStatus="status">
							<li><i class="top">${status.count}</i> <a
								href="<%=basePath %>/frontbook/ProductByName?bookName=${book16}"
								target="_blank">${book16}</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach items="${list17}" var="book17" varStatus="status">
							<li><i class="top">${status.count}</i> <a
								href="<%=basePath %>/frontbook/ProductByName?bookName=${book17}"
								target="_blank">${book17}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="leftColumn purple">
				<h6>推荐图书</h6>
				<div class="sidebarNav">

					<!-- 推荐图书分类列表 -->

					<ul>
						<li class="cur"><a href="#">文学社科</a><b></b></li>
						<li class="cur"><a href="#">文教少儿</a><b></b></li>
						<li class="cur"><a href="#">精彩生活</a><b></b></li>
						<li class="cur"><a href="#">科学技术</a><b></b></li>
						<li class="cur"><a href="#">音乐影视</a><b></b></li>
						<!--
						<li><a href="javascript:void(0);">科学技术</a><b></b></li>
						<li><a href="javascript:void(0);">音乐影视</a><b></b></li>
						-->
					</ul>
				</div>
				<div class="list">

					<!--文学社科-->

					<ul style="display: block;">
						<c:forEach items="${list6}" var="book6">
							<li><a
								href="<%=basePath %>/frontbook/Product?id=${book6.bookId}"
								target="_blank"><img src='<%=basePath%>${book6.bookCover}'
									alt="${book6.bookName}" width="120" height="120" /> </a>
								<p>
									<a href="<%=basePath %>/frontbook/Product?id=${book6.bookId}"
										target="_blank">${book6.bookName}</a>
								</p> <del>${book6.bookPrice/100}</del> <span class="priceValue">${book6.bookSellPrice/100}</span>
							</li>
						</c:forEach>
					</ul>

					<!--文教少儿-->
					<ul style="display: block;">
						<c:forEach items="${list7}" var="book7">
							<li><a
								href="<%=basePath %>/frontbook/Product?id=${book7.bookId}"
								target="_blank"><img src='<%=basePath%>${book7.bookCover}'
									alt="${book7.bookName}" width="120" height="120" /> </a>
								<p>
									<a href="<%=basePath %>/frontbook/Product?id=${book7.bookId}"
										target="_blank">${book7.bookName}</a>
								</p> <del>${book7.bookPrice/100}</del> <span class="priceValue">${book7.bookSellPrice/100}</span>
							</li>
						</c:forEach>
					</ul>

					<!--精彩生活-->
					<ul style="display: block;">
						<c:forEach items="${list8}" var="book8">
							<li><a
								href="<%=basePath %>/frontbook/Product?id=${book8.bookId}"
								target="_blank"><img src='<%=basePath%>${book8.bookCover}'
									alt="${book8.bookName}" width="120" height="120" /> </a>
								<p>
									<a href="<%=basePath %>/frontbook/Product?id=${book8.bookId}"
										target="_blank">${book8.bookName}</a>
								</p> <del>${book8.bookPrice/100}</del> <span class="priceValue">${book8.bookSellPrice/100}</span>
							</li>
						</c:forEach>
					</ul>
					<!--科学技术 -->
					<ul style="display: block;">
						<c:forEach items="${list9}" var="book9">
							<li><a
								href="<%=basePath %>/frontbook/Product?id=${book9.bookId}"
								target="_blank"><img src='<%=basePath%>${book9.bookCover}'
									alt="${book9.bookName}" width="120" height="120" /> </a>
								<p>
									<a href="<%=basePath %>/frontbook/Product?id=${book9.bookId}"
										target="_blank">${book9.bookName}</a>
								</p> <del>${book9.bookPrice/100}</del> <span class="priceValue">${book9.bookSellPrice/100}</span>
							</li>
						</c:forEach>
					</ul>

					<!--音乐影视 -->
					<ul style="display: block;">
						<c:forEach items="${list10}" var="book10">
							<li><a
								href="<%=basePath %>/frontbook/Product?id=${book10.bookId}"
								target="_blank"><img src='<%=basePath%>${book10.bookCover}'
									alt="${book10.bookName}" width="120" height="120" /> </a>
								<p>
									<a href="<%=basePath %>/frontbook/Product?id=${book10.bookId}"
										target="_blank">${book10.bookName}</a>
								</p> <del>${book10.bookPrice/100}</del> <span class="priceValue">${book10.bookSellPrice/100}</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="clear"></div>

		<script>
			$(".column .leftColumn .sidebarNav ul li a").hover(
					function() {
						var index = $(this).parent().index();
						$(this).parent().addClass("cur").siblings()
								.removeClass("cur");
						$(this).parents(".sidebarNav").siblings(".list")
								.children("ul").stop(true).eq(index).fadeIn()
								.siblings().hide();
					}, function() {
					})
			$(".column .ranking .rankingNav ul li a").hover(
					function() {
						var index = $(this).parent().index();
						$(this).parent().addClass("cur").siblings()
								.removeClass("cur");
						$(this).parents(".rankingNav").siblings(".list")
								.children("ul").stop(true).eq(index).fadeIn()
								.siblings().hide();
					}, function() {
					})
		</script>


		<div class="hotEvaluation contain">

			<!-- 出版社一览 -->

			<div class="fr limit">
				<div class="title">
					<a href="#" class="more">更多&gt;</a><i></i>出版社一览
				</div>
				<ul>
					<c:forEach items="${presslist}" var="press">
						<li><a
							href="<%=basePath%>/frontbook/queryByPress?press=${press}">${press}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<script>
				$(".hotEvaluation .fr ul li:last-child").css("border-bottom",
						"0 none");
			</script>
			<div class="list">
				<div class="title">热评商品</div>
				<ul>
					<c:forEach items="${hotbooks}" var="hotbook">
						<li><a
							href="<%=basePath%>/frontbook/Product?id=${hotbook.bookId}"
							target="_blank"><img src="<%=basePath%>${hotbook.bookCover}"
								alt="${hotbook.bookName}" /></a> <!--促销-->
							<p>
								<a href="#" target="_blank" title="${hotbook.bookName}">${hotbook.bookName}</a>
							</p> <span>评论数量：<a href="#">(<b>)</b>条
							</a></span> <span>顾客评分：<i class="good"></i><i class="good"></i><i
								class="good"></i><i class="good"></i><i></i></span></li>
					</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<script>
			$(".hotEvaluation .list ul li:nth-child(5n)").css("margin-right",
					"0");
		</script>

		<div class="wonderful contain">
			<div class="title">更多精彩</div>
			<ul>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=1"> <img
						class="upper" src="<%=basePath%>/img/wonderful/1-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/1-2.png" /> 小说店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=2"> <img
						class="upper" src="<%=basePath%>/img/wonderful/2-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/2-2.png" /> 历史店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=3"> <img
						class="upper" src="<%=basePath%>/img/wonderful/3-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/3-2.png" /> 传记店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=4"> <img
						class="upper" src="<%=basePath%>/img/wonderful/4-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/4-2.png" /> 经济店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=5"> <img
						class="upper" src="<%=basePath%>/img/wonderful/5-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/5-2.png" /> 广购课程
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=6"> <img
						class="upper" src="<%=basePath%>/img/wonderful/6-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/6-2.png" /> 管理
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=7"> <img
						class="upper" src="<%=basePath%>/img/wonderful/7-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/7-2.png" /> 医学店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=8"> <img
						class="upper" src="<%=basePath%>/img/wonderful/8-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/8-2.png" /> 生活店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=9"> <img
						class="upper" src="<%=basePath%>/img/wonderful/9-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/9-2.png" /> 艺术店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=10"> <img
						class="upper" src="<%=basePath%>/img/wonderful/10-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/10-2.png" /> 动漫店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=11"> <img
						class="upper" src="<%=basePath%>/img/wonderful/11-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/11-2.png" /> 教铺店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=12"> <img
						class="upper" src="<%=basePath%>/img/wonderful/12-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/12-2.png" /> 少儿店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=13"> <img
						class="upper" src="<%=basePath%>/img/wonderful/13-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/13-2.png" /> 外语店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=14"> <img
						class="upper" src="<%=basePath%>/img/wonderful/14-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/14-2.png" /> 电脑店
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=15"> <img
						class="upper" src="<%=basePath%>/img/wonderful/15-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/15-2.png" /> 原版外文
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=16"> <img
						class="upper" src="<%=basePath%>/img/wonderful/16-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/16-2.png" /> 影音
				</a></li>
				<li><a
					href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=17"> <img
						class="upper" src="<%=basePath%>/img/wonderful/17-1.png" /> <img
						class="lower" src="<%=basePath%>/img/wonderful/17-2.png" /> 钢琴城
				</a></li>
			</ul>
		</div>

		<script>
			$(".wonderful ul li").hover(function() {
				$(this).find("img.upper").stop(true).animate({
					"width" : "0",
					"left" : "50%"
				}, 200);
				$(this).find("img.lower").delay(200).animate({
					"width" : "95px",
					"left" : "0"
				}, 200);
			}, function() {
				$(this).find("img.lower").stop(true).animate({
					"width" : "0",
					"left" : "50%"
				}, 200);
				$(this).find("img.upper").delay(200).animate({
					"width" : "95px",
					"left" : "0"
				}, 200);
			})
		</script>



		<!-- <div class="short-reading contain">
		<h6>分类短阅读</h6>
		<div class="list"> 
			<ul>
				<li>
					<i></i>
					<a href="#">阿里巴巴、百度、京东、微软热衷区块链|区块链, 时代的“变革者”</a>
					<span>（2017-06-23 16:53:03)</span>
				</li>
				<li>
					<i></i>
					<a href="#">分答开启的从免费到付费之路</a>
					<span>（2017-06-23 10:55:16)</span>
				</li>
				<li>
					<i></i>
					<a href="#">越来越热的区块链支付，或将颠覆传统支付？</a>
					<span>（2017-06-23 10:54:59)</span>
				</li>
					<li>
						<i></i>
						<a href="#">中国雕塑史上的绝唱：府城玉皇庙二十八星宿彩塑</a>
						<span>（2017-06-22 17:20:12)</span>
				</li>
				<li>
					<i></i>
					<a href="#">选大学就是为自己选定的专业，找个好婆家！</a>
					<span>（2017-06-22 17:20:02)</span>
				</li>
			</ul> 
			<ul> 
				<li>
					<i></i>
					<a href="#">第九次中国行，我去爬了李白的敬亭山</a>
					<span>（2017-06-22 15:47:05)</span>
				</li>
				<li>
					<i></i>
					<a href="#">“互联网+”驱动的金融创新</a>
					<span>（2017-06-22 15:46:16)</span>
				</li>
				<li>
					<i></i>
					<a href="#">影响第一印象的要素</a>
					<span>（2017-06-22 15:45:42)</span>
				</li>
				<li>
					<i></i>
					<a href="#">夏季多吃这些水果，助你美容养颜又健康！</a>
					<span>（2017-06-22 11:31:56)</span>
				</li>
				<li>
					<i></i>
					<a href="#">懂得委婉说“不”也是本领</a>
					<span>（2017-06-22 10:25:33)</span>
				</li>
			</ul> 
			<div class="clear"></div> 
		</div>GB2312
	</div>

	底部图片

	<div class="activity-list contain">
		<a href="#"><img src="" /></a>
		<a href="#"><img src="" style="margin:0 19px 0 20px"/></a>
		<a href="#"><img src="" /></a>
	</div> -->

		<div class="clear"></div>

		<!--右边漂浮 客服热线-->
		<div id="rightDiv"
			style="Z-INDEX: 10; right: 2px; VISIBILITY: visible; WIDTH: 180px; POSITION: absolute; TOP: 210px; HEIGHT: 160px">
			<table id="index_09_left_servicehotline" width="160px" border="0"
				align="center" cellpadding="2" cellspacing="0">
				<tr>
					<td class="customer">
						<div class="customer_service">
							<a href="https://static.meiqia.com/dist/standalone.html?_=t&eid=65494">
							<img border="0" src="<%=basePath%>/img/QQtalk.png" alt="点击这里给我发消息" title="点击这里给我发消息"></a>&nbsp; 客服
						</div> <!--<div class="customer_service">王先生</div>
					<div class="customer_service">王先生</div>-->
					</td>
				</tr>
				<!--pd fix end-->
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr class="time">
					<td height="15px" class="index_09_left_servicehotline_h2 time">
						<img style="padding-left: 5px;"
						src="<%=basePath%>/img/QQtalk1.png" /> 400-886-4208
					</td>
				</tr>
				<tr class="time">
					<td height="25px" class="service_time"><img
						src="<%=basePath%>/img/QQtalk3.png" /> 服务时间：9:00-21:30</td>
				</tr>
				<!--
	        <tr>
	            <td align="center" class="index_09_left_servicehotline_h1"><a target="_blank" href="  http://wpa.qq.com/msgrd?v=1&uin=757095574&site=qq&menu=yes"><img border="0" src="  http://wpa.qq.com/pa?p=2:757095574:47" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
	        </tr>
			-->
			</table>
		</div>
	</div>

	<!-- end index-->
	<!-- Bottom:底部 -->

	<div class="footer">

		<!-- begin 购物帮助-->

		<div class="contain">
			<dl>
				<!-- <ul  > -->
				<dt>会员注册</dt>
				<dd>
					<i></i><a href="#">新用户注册</a>
				</dd>
				<dd>
					<i></i><a href="#">会员积分政策</a>
				</dd>
			</dl>
			<dl>
				<!-- <ul  > -->
				<dt>支付方式</dt>
				<dd>
					<i></i><a href="#">货到付款</a>
				</dd>
				<dd>
					<i></i><a href="#">银行汇款</a>
				</dd>
				<dd>
					<i></i><a href="#">邮局汇款</a>
				</dd>
				<dd>
					<i></i><a href="#">第三方支付方式</a>
				</dd>
			</dl>
			<dl>
				<!-- <ul  > -->
				<dt>购物流程</dt>
				<dd>
					<i></i><a href="#">订购演示</a>
				</dd>
				<dd>
					<i></i><a href="#">GG卡和GG券使用说明</a>
				</dd>
				<dd>
					<i></i><a href="#">团购服务指引</a>
				</dd>
			</dl>
			<dl>
				<!-- <ul  > -->
				<dt>配送方式</dt>
				<dd>
					<i></i><a href="#">配送费用/时间/范围</a>
				</dd>
			</dl>
			<dl>
				<!-- <ul class='last'> -->
				<dt>售后服务</dt>
				<dd>
					<i></i><a href="#">发票制度</a>
				</dd>
				<dd>
					<i></i><a href="#">退款方式</a>
				</dd>
				<dd>
					<i></i><a href="#">退换货流程</a>
				</dd>
				<dd>
					<i></i><a href="#">联系我们</a>
				</dd>
			</dl>
		</div>
	</div>

	<!-- end 购物帮助-->

	<!-- 页脚-->
	<div id="footer" style="text-align: center;">
		<!-- oldtest -->
		<!-- 页脚 added by alex 0819-->
		<div id="myfooter">
			<!-- 友情链接-->
			<div style="margin: 15px 0px 10px; text-align: center">
				友情链接： <a href="#" target="_blank">广州新华出版发行集团</a>&nbsp;| <a href="#"
					target="_blank">广州新华书店</a>&nbsp;| <a href="#" target="_blank">新浪读书</a>&nbsp;|&nbsp;
				<a href="#" target="_blank">卓越教育</a>&nbsp;|&nbsp; <a href="#"
					target="_blank">北京理工大学出版社</a>&nbsp;<br />&nbsp; <a target="_blank"
					href="#">重庆出版社</a>&nbsp;|&nbsp; <a target="_blank" href="#">深圳生活指南</a>&nbsp;|&nbsp;
				<a target="_blank" href="#">厦门大学出版社</a>&nbsp;|&nbsp; <a
					target="_blank" href="#">浙江文艺出版</a>&nbsp;|&nbsp; <a target="_blank"
					href="#">中国传媒大学出版社</a> |&nbsp; <a target="_blank" href="#">书问搜索</a>
				|&nbsp; <a target="_blank" href="#">购书网站</a> |&nbsp; <a
					target="_blank" href="# ">广州二手房</a> <a target="_blank" href="#">更多-&gt;</a>
			</div>
			<div>
				<a rel="nofollow" href="#">关于网站</a> | <a rel="nofollow" href="#">公司简介</a>
				| <a rel="nofollow" href="#">法律声明</a> | <a rel="nofollow" href="#">联系我们</a>
			</div>
			<div style="margin: 15px 0px 5px; text-align: center">
				广州购书中心有限公司 版权所有&copy; 2010 经营许可证：粤B2-20040295 <a rel="nofollow"
					href="#" target="_blank">粤ICP备10095868号</a>
			</div>
			<!--可信网站图片LOGO安装开始-->
			<a rel="nofollow" href="#"><img
				src="http://img3.cache.netease.com/www/seallogo.png" alt="" /></a>
			<!--可信网站图片LOGO安装结束-->
			<!--诚信电商logo-->
			<a target="_blank"
				href="http://www.eccsp.org/sitecn/aspx/certificationD.aspx?pid=1222">
				<img src="http://www.eccsp.org/sitecn/images/startimg.jpg"
				width="128" height="48" alt="" />
			</a>
			<!--诚信电商logo 结束-->
			<img src="<%=basePath%>/img/footer_img.gif" alt="" /> &nbsp;&nbsp;
			<a rel="nofollow"
				href="http://www.gzjd.gov.cn/newgzjd/baojing/110.jsp?catid=318"
				target="_blank"> <img
				src="http://www.pconline.com.cn/test/images/ktjc.gif"
				style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px"
				alt="" />
			</a> <a target="_blank"
				href="http://www.ghwsx.gov.cn/gholportal/home.aspx"><img
				width="100" height="75" border="0"
				longdesc="http://www.ghwsx.gov.cn/gholportal/home.aspx" alt="广货网上行"
				src="http://www.gg1994.com/images/ghwsxlogo2.jpg" /></a> <img
				src="<%=basePath%>/img/dyh.jpg" width="100px" hight="100px"
				style="margin-left: 0px;" /> <img src="<%=basePath%>/img/fwh.jpg"
				width="100px" hight="100px" style="margin-left: 10px;" />
		</div>
		<!--google-->
		<!-- UA-->
		<!--UA end-->
		<!-- end 页脚-->
	</div>

	<!-- end 页脚-->

	<script type="text/javascript">
		//设置飘浮目录
		var lastScrollY = 0;
		function heartBeat() {
			var diffY;
			if (document.documentElement && document.documentElement.scrollTop)
				diffY = document.documentElement.scrollTop;
			else if (document.body)
				diffY = document.body.scrollTop
			else {/*Netscape stuff*/
			}
			/* if (diffY==0){document.getElementById("rightDiv").style.display="none"
			 }else{document.getElementById("rightDiv").style.display=""}*/

			//alert(diffY);
			percent = .1 * (diffY - lastScrollY);
			if (percent > 0)
				percent = Math.ceil(percent);
			else
				percent = Math.floor(percent);
			//document.getElementById("leftDiv").style.top = parseInt(document.getElementById("leftDiv").style.top)+percent+"px";
			document.getElementById("rightDiv").style.top = parseInt(document
					.getElementById("rightDiv").style.top)
					+ percent + "px";
			lastScrollY = lastScrollY + percent;
			//alert(lastScrollY);
		}

		window.setInterval("heartBeat()", 5);
	</script>

	<!-- JiaThis Button BEGIN -->
	<script type="text/javascript" id="bdshare_js"
		data="type=slide&amp;pos=left&amp;uid=6456503"></script>
	<script type="text/javascript" id="bdshell_js" data="type=uid=6456503"></script>
	<script type="text/javascript">
		document.getElementById('bdshell_js').src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
				+ new Date().getHours();
	</script>

	<!-- JiaThis Button END -->
	<script type="text/javascript">
		function getCard() {
			if (usr == null || usr == "null") {
				$("#dialogContent").show();
				$("#dialog").slideDown();
				setTimeout(
						"$('#dialog').slideUp();$('#dialogContent').hide();",
						2000);
			}
		}
	</script>
</body>
</html>


