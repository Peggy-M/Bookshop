<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>图书商城 – 武汉购书中心网上书店-新华书店：正版低价 送货上门：网上买书、网上购书首选</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/help.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
</head>
<body>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" href="#">
<script type="text/javascript" language="javascript" src="<%=basePath%>/js/login.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>/js/AddFavorite.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>/js/jquery-1.11.1.min.js"></script>
<div class="header">
<div class="top">
<div class="contain">
<div class="fr" id="welcomeStr">
</div>
<div class="fl">
<a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">收藏广购书城</a>
<div class="address">
<div class="areamini">送至：<span>广东</span></div>
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
<li><a href="javascript:void(0);">广东</a></li>
<li><a href="javascript:void(0);">湖南</a></li>
<li><a href="javascript:void(0);" class="selected">湖北</a></li>
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
					
					////头部地址导航切换
					$(".header .top .address ul li a").click(function(){
						$(this).addClass("selected").parent().siblings().children().removeClass("selected");
						var selectedAddr = $(this).text();
						$(".header .top .address span").text(selectedAddr);
					})
				</script>
<script type="text/javascript">
				var usr = getLastUserName();
				var welcomeStr='';
				if(usr){
					welcomeStr=usr+'，欢迎来到广购书城：广州购书中心网上书店！<a id="alex_member" href="/Member/index.do">我的账户</a>'+
							' <a href="/Member/Exit.do">退出</a>'+'<a href="/Member/AllOrderList.do">我的订单</a><a href="http://www.gzbookcenter.com">企业官网</a><span>400-886-4208</span>';						
				}
				else{
					welcomeStr='您好，欢迎来到广购书城：广州购书中心网上书店！<a href="/Member/LoginForm.do">登录</a>'+
						' <a href="/Member/RegisterForm.do">新用户注册</a>'+'<a href="/Member/AllOrderList.do">我的订单</a><a href="http://www.gzbookcenter.com">企业官网</a><span>400-886-4208</span>';
				}
				jQuery('#welcomeStr').html(welcomeStr);
				</script>
</div>
</div>
</div>
<div class="bottom contain">
 
<div style="margin-bottom:15px;margin-top:15px">
<a href='#' target='_blank'><img src='<%=basePath %>/img/top-brand.jpg' width='1200' height='106' alt='' border='0'/></a>
</div>
<h1>
<a href='/' target='_blank'><img src='<%=basePath %>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a>
 
</h1>
<div class="shopping-car fr"><div id="IncludeSmallCartDiv">
<a class="car" href="#">购物车  </a></div><a href="#">我的订单</a>
</div>
<div class="search">
<link type="text/css" rel="StyleSheet" media="all" href="<%=basePath%>/css/jquery.suggest.css"/>
<script type="text/javascript" language="javascript" src="<%=basePath%>/js/jquery.dimensions.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>/js/jquery.suggest.js"></script>
<script type="text/javascript">
String.prototype.Trim=function(){   
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
 if(!checkTopSearchForm())return false;
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
}
</script>
<form onsubmit="return checkTopSearchForm()" id="searchform" name="searchform" method="post" style="margin:0px" action="/ProductList.do ">
<input type="hidden" name="Cid" value="603">
<input type="hidden" id="thKeywords" name="Keywords"/>
<input type="hidden" name="searchlist" value="1"/>
<input type="hidden" id="idx_useAutoComplete" name="useAutoComplete" value="0"/>
<input type="hidden" name="OrderBy" value=" " id="OrderBy"/>
<input type="text" id="topKeywords" autocomplete="off" onkeyup="judgeShowSuggest();" value="习近平讲故事" onfocus="if (value =='习近平讲故事'){value =''};this.style.color='#000'"/><input type="submit" value=""/><span style="margin-left:10px;font-size:16px;border-bottom:1px solid black;"><a href="#">高级搜索</a></span>
<div class="hot-search">
<div class="hotSea">
热门搜索：
<a href="#" target="_blank">互联网+</a>
<a href="#" target="_blank">自助游</a>
<a href="#" target="_blank">瘦身</a>
<a href="#" target="_blank">国学课堂</a>
<a href="#" class="more">更多&gt;&gt;</a>
</div>
</div>
</form>
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
<a href="">热点</a>
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
<a href="# #" title=" 小屁孩日记" target='_blank'>
小屁孩日记 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">小说</a>
</dt>
<dd>
<a href="#" title="青春" target='_blank'>
青春 |
</a>
<a href="#" title="职场" target='_blank'>
职场 |
</a>
<a href="#" title="科幻" target='_blank'>
科幻 |
</a>
<a href="#" title="武侠" target='_blank'>
武侠 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">文学/艺术</a>
</dt>
<dd>
<a href="#" title="传记" target='_blank'>
传记 |
</a>
<a href="#" title="漫画" target='_blank'>
漫画 |
</a>
<a href="#" title="设计" target='_blank'>
设计 |
</a>
<a href="#" title="摄影" target='_blank'>
摄影 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">经济/管理</a>
</dt>
<dd>
<a href="#" title="会计" target='_blank'>
会计 |
</a>
<a href="#" title="金融" target='_blank'>
金融 |
</a>
<a href="#" title="营销" target='_blank'>
营销 |
</a>
<a href="#" title="企管" target='_blank'>
企管 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">人文/社科 </a>
</dt>
<dd>
<a href="#" title="哲学" target='_blank'>
哲学 |
</a>
<a href="#" title="宗教" target='_blank'>
宗教 |
</a>
<a href="#" title="政治" target='_blank'>
政治 |
</a>
<a href="#" title="历史 " target='_blank'>
历史 |
</a>
<a href="#" title="法律" target='_blank'>
法律 |
</a>
<a href="#" title="军事" target='_blank'>
军事 |
</a>
<a href="#" title="国学" target='_blank'>
国学 |
</a>
<a href="#" title="励志" target='_blank'>
励志 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">少儿</a>
</dt>
<dd>
<a href="#" title="0--2" target='_blank'>
0--2 |
</a>
<a href="#" title="3--6" target='_blank'>
3--6 |
</a>
<a href="#" title="7-10" target='_blank'>
7-10 |
</a>
<a href="#" title="11-14" target='_blank'>
11-14 |
</a>
<a href="#" title="文学" target='_blank'>
文学 |
</a>
<a href="#" title="益智" target='_blank'>
益智 |
</a>
<a href="#" title="卡通" target='_blank'>
卡通 |
</a>
<a href="#" title="科普" target='_blank'>
科普 |
</a>
<a href="#" title="启蒙" target='_blank'>
启蒙 |
</a>
<a href="#" title="亲子" target='_blank'>
亲子 |
</a>
<a href="#" title="百科" target='_blank'>
百科 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">生活</a>
</dt>
<dd>
<a href="#" title="养生" target='_blank'>
养生 |
</a>
<a href="#" title="两性" target='_blank'>
两性 |
</a>
<a href="#" title="旅游" target='_blank'>
旅游 |
</a>
<a href="#" title="收藏" target='_blank'>
收藏 |
</a>
<a href="#" title="居家" target='_blank'>
居家 |
</a>
<a href="#" title="孕育" target='_blank'>
孕育 |
</a>
<a href="#" title="装扮" target='_blank'>
装扮 |
</a>
<a href="#" title="美食" target='_blank'>
美食 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">语言/教育</a>
</dt>
<dd>
<a href="#" title="外语" target='_blank'>
外语 |
</a>
<a href="#" title="方言" target='_blank'>
方言 |
</a>
<a href="#" title="口才" target='_blank'>
口才 |
</a>
<a href="#" title="教育" target='_blank'>
教育 |
</a>
<a href="#" title="家教" target='_blank'>
家教 |
</a>
<a href="#" title="小学" target='_blank'>
小学 |
</a>
<a href="#" title="初中" target='_blank'>
初中 |
</a>
<a href="#" title="高中" target='_blank'>
高中 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">计算机/科技</a>
</dt>
<dd>
<a href="#" title="科普" target='_blank'>
科普 |
</a>
<a href="#" title="自然科学" target='_blank'>
自然科学 |
</a>
<a href="#" title="计算机" target='_blank'>
计算机 |
</a>
<a href="#" title="医学" target='_blank'>
医学 |
</a>
<a href="#" title="建筑" target='_blank'>
建筑 |
</a>
<a href="#" title="农林" target='_blank'>
农林 |
</a>
<a href="#" title="工业" target='_blank'>
工业 |
</a>
</dd>
</dl>
<dl>
<dt>
<a href="">其它分类</a>
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
<li class="cur">
<a href="/"class="current">首页</a></li>
  <li><a href="#">新书预售</a></li>
  <li><a href="#">新书精选</a></li>
  <li><a href="#">特惠图书</a></li>
  <li><a href="#">畅销图书</a></li>
  <li><a href="#">文创汇</a></li>
  <li><a href="#">签名版</a></li>
  <li><a href="#">电子书</a></li>
  <li><a href="#">广购公告</a></li>
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
</div>
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



     <div id="head_position">您现在的位置：<a href="/">首页</a> &gt;&gt; <a href="#">帮助中心</a>  >>
     
         <a href="#"> 最新公告 </a>  </div>
    <div id="help">
        
    <div class="left">
    <div class="top"></div>
	<div class="box">
      
               
           
                
                
           
		<div class="box1">
	  <h1><a class="" href="#">会员注册</a></h1>
	  <ul>
	    <li><a href="#">新用户注册</a></li><li><a href="#">会员积分政策</a></li>
	  </ul>
		</div>
       
               
           
                
                
           
		<div class="box2">
	  <h1><a class="" href="#">支付方式</a></h1>
	  <ul>
	    <li><a href="#">货到付款</a></li><li><a href="#">银行汇款</a></li><li><a href="#">邮局汇款</a></li><li><a href="#">第三方支付方式</a></li>
	  </ul>
		</div>
       
               
           
                
                
           
		<div class="box3">
	  <h1><a class="" href="#">购物流程</a></h1>
	  <ul>
	    <li><a href="#">订购演示</a></li><li><a href="#">GG卡和GG券使用说明</a></li><li><a href="#">团购服务指引</a></li>
	  </ul>
		</div>
       
               
           
                
                
           
		<div class="box4">
	  <h1><a class="" href="#">配送方式</a></h1>
	  <ul>
	    <li><a href="#">配送费用/时间/范围</a></li>
	  </ul>
		</div>
       
               
           
                
                
           
		<div class="box5">
	  <h1><a class="" href="#">售后服务</a></h1>
	  <ul>
	    <li><a href="#">发票制度</a></li><li><a href="#">退款方式</a></li><li><a href="#">退换货流程</a></li><li><a href="#">联系我们</a></li>
	  </ul>
		</div>
       
               
           
                
                
           
		<div class="box6">
	  <h1><a class="" href="#">常见问题</a></h1>
	  <ul>
	    <li><a href="#">订单查询</a></li><li><a href="#">常见问题</a></li>
	  </ul>
		</div>
       
	</div>
	<div class="bottom"></div>
   </div>

      <div class="right">
        <div class="top"></div>
        <div class="box">
           <h1>图书最新报道</h1>
          <div style="width:730px; line-height:18px;overflow:hidden;margin:0 20px;">
             
                      <p><span style="color: rgb(51, 51, 51); font-family: 宋体; line-height: 27px;"><span style="font-size: 16px;">春节期间可照常下单，发货时间有所延迟，具体如下：</span></span></p>
<p>&nbsp;</p>
<p><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 16px; line-height: 27px;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 16px; line-height: 27px;">广州市：</span><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 16px; line-height: 27px;">2016年2月4日-2月12日的订单，将延迟至</span><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 16px; line-height: 27px;">2月</span><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 16px; line-height: 27px;">13日发货。</span></p>
<div style="color: rgb(51, 51, 51); font-family: 宋体; line-height: 18px;"><span style="line-height: 27px;"><span style="font-size: 16px;">&nbsp; &nbsp; &nbsp; &nbsp; 广州市以外地区：2016年1月30日-2月14日的订单，将延迟至2月15日发货。</span></span></div>
<div style="color: rgb(51, 51, 51); font-family: 宋体; line-height: 18px;"><span style="font-size: 16px; line-height: 27px;">&nbsp; &nbsp; &nbsp; &nbsp; 如有不便之处，敬请见谅</span></div>
<div style="color: rgb(51, 51, 51); font-family: 宋体; line-height: 18px;">&nbsp;</div>
<div style="color: rgb(51, 51, 51); font-family: 宋体; line-height: 18px;"><span style="font-size: 16px; line-height: 27px;">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style="font-size: 16px; line-height: 27px;">&nbsp;</span><span style="line-height: 27px;"><span style="font-size: 16px;">顺祝各位读者新春愉快、万事顺心如意！</span></span></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


                      
                
           </div>
            <div class="clear"></div>
        </div>
        <div class="bottom"></div>
      </div>
  <div class="clear"></div>
</div>
    















<div class="footer">
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

  </body>
</html>
