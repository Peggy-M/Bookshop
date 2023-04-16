<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>

<html>
<head>
<title>图书商城-畅销图书</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/product.css" rel="stylesheet" type="text/css"/>
<link type="text/css" rel="StyleSheet" media="all" href="<%=basePath%>/css/jquery.suggest.css"/>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.cycle.all.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.countdown.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/getcard1.js"></script>
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
<link href="<%=basePath%>/css/style.css" type="text/css"/>
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
				var welcomeStr='';
				if(usr!=null&&usr!="null"){
					welcomeStr=usr+'，欢迎来到图书商城：武汉购书中心网上书店！<a id="alex_member" href="javascript:void(0);">我的账户</a>'+
							' <a id="logout" href="javascript:void(0);">退出</a>'+'<a href="javascript:void(0);">我的订单</a><a href="'+homeUrl+'">官网首页</a><span>400-886-4208</span>';						
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
			<%-- <a href='javascript:void(0);' target='_blank'><img src='<%=basePath%>/img/top-brand.jpg' width='1200' height='106' alt='' border='0'/></a> --%>
		</div>
		<h1><a href='<%=basePath%>/frontbook/home'><img src='<%=basePath%>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a></h1>
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
</div>
</div>
 
<ul>
<li>
<a href="<%=basePath%>/frontbook/home">首页</a></li>
  <li><a href="<%=basePath%>/frontbook/Special?status=1&pageSize=10&pageNo=1">新书预售</a></li>
  <li><a href="<%=basePath%>/frontbook/HotNewBooks?status=2&pageSize=10&pageNo=1">新书精选</a></li>
  <li><a href="<%=basePath%>/frontbook/ProductList?status=3&pageSize=10&pageNo=1">特惠图书</a></li>
  <li class="cur"><a href="<%=basePath%>/frontbook/TopIndex?status=4&pageSize=10&pageNo=1" class="current">畅销图书</a></li>
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
<!-- end index-->


<div class="product contain">
    <div class="tt"><strong>广购书城</strong> &gt; 排行榜</div>
	<div>
		<div class="leftNav">
			<div class="top">
				<div class="nt"><strong>分类浏览</strong></div>
				<div id="loadSort">
					<!-- <img src='/guanggou/templets/Default/Default/images/ajax-loader.gif'/> -->
					<ul class="fenlei-list">
					<c:forEach items="${tlist}" var="type">
					<li><a href="<%=basePath%>/frontbook/queryByTypeSecond?typeNo=${type.typeId}&typeName=${type.typeName}">${type.typeName}</a> </li>
					</c:forEach>
					</ul>
				</div>
			</div>	
        <!--end 商品分类-->
        <!--浏览历史-->

        <!--end 浏览历史-->
		<!--
  			<div class="adv1" name="bannerPic"><a href=""><a href='/Product.do?id=1058064&target=advCH201110林敏' target='_blank'><img src='/upload/2011/10/19/20111019110158170.jpg'  width='192' height='286' alt='林敏--生活瑜伽' border='0' /></a></a></div>
		-->
		</div>
		
		<div class="rightCon">
			<h3 class="h4"><strong>图书畅销书排行榜</strong><span>畅销排行榜 </span><em style="color:#2a6ed3;font-size:12px;">每页显示10个商品</em></h3>
			<c:forEach var="book" items="${books}" varStatus="status">
			<ul class="list">
		        <li>
				<div class="li-img fl">
					<a target="_blank" href="<%=basePath%>/frontbook/Product?id=${book.bookId}"  title="${book.bookName}"><img src="<%=basePath%>${book.bookCover}" alt="${book.bookName }" title="${book.bookName}"  /></a>
					<span class="number"><em>${status.count}</em></span>
				</div>
				<div class="li-con fl">
					<h2><a target="_blank" href="#"><strong>${book.bookName}</strong></a></h2>
						<dl>
							<dt>
								<div class="line_1">
		    						<div class="marketPrice">
		    							<span class="priceName">定价：</span>
		    							<span class="priceValue">${book.bookPrice/100}</span>
		    						</div>
		    						<!-- added by alex 用于抢购来计算折扣 -->
		    						<div class="memberPrice" >
			    						<span class="priceName">广购价：</span>
			    						<span class="priceValue">${book.bookSellPrice/100}</span>
		    						</div>
		   							<!-- added by alex 用于专题来计算折扣 -->
								</div>
								<div class="line_2">
									<p>顾客评分</p>
									<p class="review_d">
										<span>
											<i></i>
											<i></i>
											<i></i>
											<i></i>
											<i></i>
										</span>
									</p>
									<p>(<i>0</i>条)</p>
								</div>
								<div class="line_3">
									<span>作者：<em style="color:#2a6ed3">${book.bookAuthor}</em>&nbsp;著</span>
									<span>出版社：<em style="color:#2a6ed3">${book.bookPress}</em></span>    
									<span>出版时间：<em>${book.bookPublishTime}</em></span>
								</div>
							</dt>
							<dd>
								<form method="post" action="#" style="margin:0;" id="buyForm" onsubmit="_gaq.push(['_trackEvent', 'click','购买键', '畅销页>购买']);return ture;">
								    <div class="btn">
						                <a id="buyButton" href="#" target="_blank"><img src="<%=basePath %>/img/book_search_list.png" border="0" alt=""/></a>
								        <a onClick="_gaq.push(['_trackEvent', 'click','收藏键', '畅销页>收藏该图书']);addFavor('0','3627652','','',false)" href="javascript:;" class="collec">
								        	<img src="<%=basePath %>/img/book_search_list1.png" alt=""/></a>
								    </div>
								</form>
							</dd>
						</dl>
				</div>
				</li>
	  		</ul>
	  		</c:forEach>
	  		
	 		<div class="page1">
				<div class="pageDiv">
					<div id='infoPage'>
						<ul>
							<li><a class='upPage' title='目前已是第一页'></a></li>
							<li><a class='nowPage'>1</a></li>
							<li><a href='#' class='everyPage'>2</a></li>
							<li><a href='#' class='everyPage'>3</a></li>
							<li><a href='#' class='everyPage'>4</a></li>
							<li><a href='#' class='everyPage'>5</a></li>
							<li><a href='#' class='everyPage'>6</a></li>
							<li><a href='#' class='downPage' title='下一页'></a></li>
							<li>&nbsp;&nbsp;到第&nbsp;<select name='select2' onchange="window.location.href='/TopIndex.do?num=1&compType=3&columnid=50000&page='+this.options[this.selectedIndex].value + ''">
								<option value='1' selected>-1-</option>
								<option value='2' >-2-</option>
								<option value='3' >-3-</option>
								<option value='4' >-4-</option>
								<option value='5' >-5-</option>
								<option value='6' >-6-</option>
								<option value='7' >-7-</option>
								<option value='8' >-8-</option>
								<option value='9' >-9-</option>
								<option value='10' >-10-</option>
								<option value='11' >-11-</option>
								<option value='12' >-12-</option>
								<option value='13' >-13-</option>
								<option value='14' >-14-</option>
								<option value='15' >-15-</option>
								<option value='16' >-16-</option>
								<option value='17' >-17-</option>
								<option value='18' >-18-</option>
								<option value='19' >-19-</option>
								<option value='20' >-20-</option>
								<option value='21' >-21-</option>
								<option value='22' >-22-</option>
								<option value='23' >-23-</option>
							</select>&nbsp;页</li>
						</ul>
					</div>
				</div>
	 		</div>
	  	
			<div class="tj">
				<ul>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">畅销历史图书排行榜</a></li>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">科普读物畅销书排行榜</a></li>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">工业技术十大畅销书排行</a></li>
					<li style="background-color:#7ca8e7;margin-right:0"><a target="_blank" href = "#">小说畅销书排行榜</a></li>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">畅销励志/成功排行榜</a></li>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">军事图书畅销书排行榜</a></li>
					<li style="background-color:#ffb03f;"><a target="_blank" href = "#">港澳台文学畅销书排行榜</a></li>
					<li style="background-color:#7ca8e7;margin-right:0"><a target="_blank" href = "#">青春文学十大畅销书排行</a></li>
				</ul>
			</div>
		</div>	
		<div class="clear"></div>
	</div>
</div>


<!-- Bottom -->


<div class="footer">
	<div class="contain">
	<dl>	
 <!-- <ul  > -->
    <dt>会员注册</dt>
    
		<dd><i></i><a href="/Info/HelpList.do?cid=50918&jid=50907">新用户注册</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=4712212&jid=50907">会员积分政策</a></dd>
		
	</dl>

	<dl>	
 <!-- <ul  > -->
    <dt>支付方式</dt>
    
		<dd><i></i><a href="/Info/HelpList.do?cid=50922&jid=50901">货到付款</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=50915&jid=50901">银行汇款</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=4712211&jid=50901">邮局汇款</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=50914&jid=50901">第三方支付方式</a></dd>
		
	</dl>

	<dl>	
 <!-- <ul  > -->
    <dt>购物流程</dt>
    
		<dd><i></i><a href="/Info/HelpList.do?cid=50904&jid=50900">订购演示</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=4716308&jid=50900">GG卡和GG券使用说明</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=4742608&jid=50900">团购服务指引</a></dd>
		
	</dl>

	<dl>	
 <!-- <ul  > -->
    <dt>配送方式</dt>
    
		<dd><i></i><a href="/Info/HelpList.do?cid=50921&jid=50902">配送费用/时间/范围</a></dd>
		
	</dl>

	<dl>	
 <!-- <ul class='last'> -->
    <dt>售后服务</dt>
    
		<dd><i></i><a href="/Info/HelpList.do?cid=50919&jid=50903">发票制度</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=50920&jid=50903">退款方式</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=50913&jid=50903">退换货流程</a></dd>
	
		<dd><i></i><a href="/Info/HelpList.do?cid=50912&jid=50903">联系我们</a></dd>
		
	</dl>

	</div>
</div>
<!-- end 购物帮助-->



<!-- 页脚-->
<div id="footer">




<!-- oldtest -->

	<!-- 页脚 added by alex 0819--><style type="text/css"> #myfooter{text-align: center;margin:20px 0px;} #myfooter a:link,#myfooter a:visited{color:#333;text-decoration:none; }   #myfooter a:hover{color:#c00;text-decoration:underline;}   #myfooter a:active{color:#900;}</style>
<div id="myfooter" style="text-align: center;"><!-- 友情链接-->
<div style="margin: 15px 0px 10px; text-align: center">友情链接：<a href="#" target="_blank">广州新华出版发行集团</a>&nbsp;| <a href="#" target="_blank">广州新华书店</a>&nbsp;| <a href="#" target="_blank">新浪读书</a>&nbsp;|&nbsp;<a href="#" target="_blank">卓越教育</a>&nbsp;|&nbsp;<a href="#" target="_blank">北京理工大学出版社</a>&nbsp;<br>
&nbsp; <a target="_blank" href="#">重庆出版社</a>&nbsp;|&nbsp;<a target="_blank" href="#">深圳生活指南</a>&nbsp;|&nbsp;<a target="_blank" href="#">厦门大学出版社</a>&nbsp;|&nbsp;<a target="_blank" href="#">浙江文艺出版</a>&nbsp;|&nbsp;<a target="_blank" href="#">中国传媒大学出版社</a> |&nbsp;<a target="_blank" href="#">书问搜索</a> |&nbsp;<a target="_blank" href="#">购书网站</a> |&nbsp;<a target="_blank" href="#">广州二手房</a> <a target="_blank" href="#">更多-&gt;</a></div>
<div><a rel="nofollow" href="#">关于网站</a>  |  <a rel="nofollow" href="#">公司简介</a>  <!--|  <a href='#'>其他服务</a>  |  <a href='#'>购物指南</a>  -->|  <a rel="nofollow" href="#">法律声明</a>  |  <a rel="nofollow" href="#">联系我们</a>  <!--|  <a href='#'>购物演示</a>--></div>
<div style="margin: 15px 0px 5px; text-align: center">广州购书中心有限公司 版权所有&#169; 2010 经营许可证：粤B2-20040295 <a rel="nofollow" href="#" target="_blank">粤ICP备10095868号</a></div>
<!--可信网站图片LOGO安装开始--> <a rel="nofollow" href="#"><img src="<%=basePath%>/img/seallogo.png" alt=""></a>  <!--可信网站图片LOGO安装结束--><!--诚信电商logo--><a target="_blank" href="#"><img src="<%=basePath%>/img/startimg.jpg" width="128" height="48" alt=""></a><!--诚信电商logo 结束--><img src="<%=basePath%>/img/footer_img.gif" alt=""> &nbsp;&nbsp; <a rel="nofollow" href="http://www.gzjd.gov.cn/newgzjd/baojing/110.jsp?catid=318" target="_blank"><img src="<%=basePath%>/img/ktjc.gif" style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px" alt=""> </a><a target="_blank" href="#"><img width="100" height="75" border="0" longdesc="http://www.ghwsx.gov.cn/gholportal/home.aspx" alt="广货网上行" src="<%=basePath%>/img/ghwsxlogo2.jpg"></a>
<img src="<%=basePath%>/img/dyh.jpg" width="100px" hight="100px" style="margin-left:0px;">
<img src="<%=basePath%>/img/fwh.jpg" width="100px" hight="100px" style="margin-left:10px;">
</div>
<!--google-->   <!-- UA--><!--UA end-->           <!-- end 页脚-->


</div>

 
<!-- end 页脚-->

<script type="text/javascript">
function writeCookie(name, value, hours){
	  var expire = "";
	  if(hours != null){
		expire = new Date((new Date()).getTime() + hours * 3600000);
		expire = "; expires=" + expire.toGMTString();
	  }
	  document.cookie = name + "=" + escape(value) + expire;
	}
	//记录本地址在购物车中返回
function setCartBackCookie(){
var url = location.href;
writeCookie("ShoppingCartGoBack" , url, 24*7);
}
setCartBackCookie();
</script>
</body>
</html>


