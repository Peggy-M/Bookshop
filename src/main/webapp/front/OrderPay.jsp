<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath = request.getContextPath(); %>

<html>
<head>
<title>下单成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<link href="<%=basePath%>/css/header.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/buyCar.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/cart.css"/>

<script type="text/javascript" src="<%=basePath %>/js/jquery-1.2.6.min.js.下载"></script>
<script type="text/javascript" language="javascript" src="<%=basePath %>/js/jquery.form.js.下载"></script>

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
<script type="text/javascript" defer="true">
var isHasP = false;
var isChooseP = false;
function decamount(cartItemId,merId,buyer,divId,count,objId,combiType,price,integral,currAmount,cartType){
    if(cartType == 1003){
       alert("0折抢购商品只能够买一个！");
       jQuery("#amount"+itemId).val(1);
       return false;
    }
    var amount=jQuery("#amount"+cartItemId);
    if(amount.val()>1){
      amount.val(Number(amount.val())-1);
      updateAmount(cartItemId,amount.val(),merId,buyer,"amount"+cartItemId,divId,count,objId,combiType,price,integral,currAmount,cartType);
    }
  }
  function addamount(cartItemId,merId,buyer,divId,count,objId,combiType,price,integral,currAmount,cartType){
     if(cartType == 1003){
       alert("0折抢购商品只能够买一个！");
       jQuery("#amount"+itemId).val(1);
       return false;
    }
    var amount=jQuery("#amount"+cartItemId);
	/*if(amount.val()>=currAmount){
	  alert("对不起，仅能订购"+currAmount+"件!");
      amount.val(currAmount);
      updateAmount(cartItemId,amount.val(),merId,buyer,"amount"+cartItemId,divId,count,objId,combiType,price,integral,currAmount,cartType);
      return false;  
	}*/
	if(combiType==1){
	  amount.val(Number(amount.val())+1);
      updateAmount(cartItemId,amount.val(),merId,buyer,"amount"+cartItemId,divId,count,objId,combiType,price,integral,currAmount);
	}else{
    //if(amount.val()<currAmount){
      amount.val(Number(amount.val())+1);
      updateAmount(cartItemId,amount.val(),merId,buyer,"amount"+cartItemId,divId,count,objId,combiType,price,integral,currAmount);
    //}
	}
  }

  function updateAmount(itemId,newAmount,merId,buyer,elemId,divId,count,objId,combiType,price,integral,currAmount,cartType){
      if(isNaN(newAmount) || newAmount<=0) {
        alert("请输入正确的商品数量！");
        jQuery("#amount"+itemId).val(1);  
        return false;
      }else if(cartType==1003){
        alert("0折抢购商品只能够买一个！");
        jQuery("#amount"+itemId).val(1);
        return false;
      }else {
      
        var amount=jQuery("#amount"+itemId);
        
        //alert("amount="+amount);
        //alert("newAmount="+newAmount);
        //alert("currAmount="+currAmount);
      /*  
       if(amount.val()<currAmount){
		
		}else{
		  newAmount=currAmount
		  jQuery("#amount"+itemId).val(newAmount);  
		}
		*/
	           var params=new Object();
	           params["randomT"]=Math.random();
	           params["itemId"]=itemId;
	           params["newAmount"]=newAmount;
	           params["merId"]=merId;
	           params["buyer"]=buyer;
	           params["elemId"]=elemId;
			   jQuery.post("/Cart/UpdateAmounForjQuery.do",params,function(data){
			       //alert(data);
				   onUpdateSuccess(data,elemId ,itemId,count,objId,newAmount,combiType,price,divId,integral);
				   }); 
      }
    }

  function onUpdateSuccess(StringData,elemId,itemId,count,objId,newAmount,combiType,price,divId,integral){  
	   jQuery.ajaxSettings['contentType'] = "application/x-www-form-urlencoded; charset=utf-8";
	    jQuery.post("/Cart/hasMoneyPresent.do",function(data){jQuery("#hasMoneyPresentDiv").html(data);});
        jQuery.post("/Cart/hasPresentByCount.do",{objId:objId,objType:combiType,itemId:itemId,count:newAmount},function(data){jQuery("#selectPresent").html(data);});
		jQuery("#cardPromts").load("/Cart/hasCardPrompts.do",StringData);		
	   var data=StringData.split("---");
      if(data.length==1){
         alert(data[0]);
         window.location.reload();
       }
       if(data.length==2){
         alert(jQuery.trim(data[0]));
         window.location.reload();
       }
       else if(data.length==7){
       	var paramsForCookie = new Object();
       	paramsForCookie["itemId"]=itemId;
       	paramsForCookie["newAmount"]=data[1];
       	jQuery.post("/Cart/changeGoodsAmountForCookie.do",paramsForCookie,function(){});
         //if(data[4]==1){
           // alert('您还可以选择更多的赠品')
         //} 
         if(data[5]) {
		
                var datas=data[5].split(':');
                if(datas[0]==1002){
                    if(parseInt(datas[2])>parseInt(datas[1])){ 
                   jQuery("#amount"+itemId).val(datas[1]);
                     alert('抢购商品每次最大的购买数为'+datas[1]+"件");   
                    return;
                        }
                }
              //alert("");
         }

         jQuery("#numtotalprice"+itemId).html(data[2]);
         jQuery("#totalPrice").html(data[2]);
		 jQuery("#totalPrice4").html(data[2]);
         //jQuery("#totalPrice2").html(data[2]);
		 // jQuery("#totalPrice3").html(data[2]);
		 jQuery("#totalSavePrice").html(data[3]);
		 //jQuery("#totalIntegral").html(FormatNumber(data[6],2));
		 jQuery.post("/Cart/TotalNeddPayIntegral.do",function(data){jQuery("#totalIntegral").html(data);});
		  var price1="50.00";
		  var price2 = data[2].replace("￥","");
		  var allPrice = parseFloat(price1)-parseFloat(price2);
		   //目前50免运费先写死
		   //if(allPrice>0){
		   // jQuery("#freePrice").html("·您目前的订单金额为<span>"+data[2]+"</span>，还差<span>￥"+allPrice.toFixed(2)+"</span> 就可免运费！<a href='#' onClick='goBackUrl();'>继续购物</a>");			  
		   // }else{
			// jQuery("#freePrice").html("·您目前的订单金额为<span>"+data[2]+"</span>，可以免运费！<a href='#' onClick='goBackUrl();'>继续购物</a>");		 
			//}
         showDelAllCart(divId,itemId);
         if(combiType==1){
           var data2 = new Object();
           data2["articleId"] = objId;
           data2["cartItemAmount"] = newAmount;
           jQuery.ajaxSettings['contentType'] = "application/x-www-form-urlencoded; charset=utf-8";
           jQuery("#bomobjectDiv").load("/IncludeAmount.jsp",data2);

         }
       }
     }
  
  /* 显示删除确认界面 */
  function showDelAllCart(id,index){
      jQuery("#"+id+index).slideToggle("fast");
      if(id=="num"){
    	 // document.location.reload();
      }
      setTimeout(function(){jQuery('#'+id+index).hide();},3000);
    }


  function readCookie(name){
	  var cookieValue = "";
	  var search = name + "=";
	  if(document.cookie.length > 0){
	    offset = document.cookie.indexOf(search);
	    if (offset != -1){
	      offset += search.length;
	      end = document.cookie.indexOf(";", offset);
	      if (end == -1) end = document.cookie.length;
	      cookieValue = unescape(document.cookie.substring(offset, end))
		   }
	   }
	  return cookieValue;
	  }

  function goBackUrl()
  {
  	var goBackUrl = readCookie("ShoppingCartGoBack");
  	if(goBackUrl==""){
  		location.href="/?mid=0";
  	} else {
  		location.href=goBackUrl;
  	}
  }	

  // 格式化保留两位小数
  function FormatNumber(srcStr,nAfterDot){
	var srcStr,nAfterDot;
	var resultStr,nTen;
	srcStr = ""+srcStr+"";
	strLen = srcStr.length;
    dotPos = srcStr.indexOf(".",0);
	if (dotPos == -1){
	resultStr = srcStr+".";
	for (i=0;i<nAfterDot;i++){
	resultStr = resultStr+"0";
	}
	return resultStr;
	}
	else{
	if ((strLen - dotPos - 1) >= nAfterDot){
	nAfter = dotPos + nAfterDot + 1;
	nTen =1;
	for(j=0;j<nAfterDot;j++){
	nTen = nTen*10;
	}
	resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
	return resultStr;
	}
	else{
	resultStr = srcStr;
	for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
	resultStr = resultStr+"0";
	}
	return resultStr;
	}
	}
	}
	  
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
	
	<div class="bottom wrapper">
		<div class="clear"></div>
		<h1> 
			<a href='<%=basePath%>/frontbook/home'><img src='<%=basePath%>/img/20161208022939348.jpg' width='200' height='30' alt='图书商城' border='0'/></a>
		</h1>
		<div class="search" style="text-align:right;margin-top:20px;float:right;">
			<form id="searchform" name="searchform" method="post" style="margin:0px" action="<%=basePath%>/frontbook/Search">
				<input type="hidden" id="thKeywords" name="topKeywords">
				<input id="topKeywords" type="text" value="习近平讲故事" onfocus="if (value =='习近平讲故事'){value =''};"/>
				<input type="button" onclick="searchByKeyWords()" value=""/>
			</form>
			<script type="text/javascript">
				/* 点击搜索按钮搜索 */
			 	function searchByKeyWords() {
					var keyWordsValue = $('#topKeywords').val();
					var keyWords = keyWordsValue.replace(/(^\s*)|(\s*$)/g,"");
					$('#thKeywords').val(keyWords);
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
 
<div class="buyCar wrapper">
<div class="path">
<ul>
<li><span style="background-image:url(<%=basePath%>/img/carPath1.png);"></span>我的购物车<i></i></li>
<li><span style="background-image:url(<%=basePath%>/img/carPath2.png);"></span>确认订单信息<i></i></li>
<li class="cur"><span style="background-image:url(<%=basePath%>/img/carPath3.png);"></span>成功提交订单<i></i></li>
</ul>
</div>
</div>
 
 
<div id="cartMain" class="wrapper wrapper1">
	<div class="cartOk">
		<h1>订单已提交，我们会尽快安排发货</h1>
		<div class="underline"></div>
		<h2>您的订单号：<b>${orderDTO.orderNumber}</b> 应付金额：<b>${orderDTO.orderPrice/100}</b> 元 您选择的支付方式是：<span>支付宝支付</span>
		<font color="red"></font></h2>
		<div id="BankPaymentDiv"></div>
		<h4>还差一步, 请立即支付（请您在3日内完成支付，否则订单会被自动取消）</h4>
		<div class="Item">
			<ul class="ul1">
				<li>
					<!--立即支付： 跳转到支付宝支付页面 -->
					<form onsubmit="return false;">
						<input type='submit' id='alipayPayButton' class='alipayPayButton' value='' onclick="payNow(${orderDTO.orderId})" style='border:0px;background:url(<%=basePath%>/img/btn_pay.gif); width:125px;height:42px;cursor:hand;'>
					</form>
				</li>
			</ul>
		</div>
		<div class="cartOK_btn"><p>完成支付后你可以：</p><a href="<%=basePath%>/Member/allOrderList.do"><img src="<%=basePath%>/img/cartOK_btn5.png"/></a>&nbsp;<a href="<%=basePath%>/frontbook/home"><img src="<%=basePath%>/img/cartOK_btn6.png"/></a></div>
		
		<script type="text/javascript">
			//点击立刻支付
			function payNow(orderId) {
				var result = confirm('是否立即支付?');
				if (result) {
					window.location.href = '<%=basePath%>/Member/payNow.do?orderId='+orderId;
				}
			}
		</script>
		
	</div>
<script type="text/javascript">
	/* <![CDATA[ */
	var google_conversion_id = 979087005;
	var google_conversion_language = "ar";
	var google_conversion_format = "3";
	var google_conversion_color = "ffffff";
	var google_conversion_label = "hZUvCLPgsAIQnd3u0gM";
	var google_conversion_value = 0;
	/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js"></script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/979087005/?label=hZUvCLPgsAIQnd3u0gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</div>
 
 
 
 
 
<script type="text/javascript">
var orderInfo = {
                "orderId": '1707051457001',
                "orderTotal": '29.4',
                "item": []
            };
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-16647225-1']);
  _gaq.push(['_setDomainName', '.gg1994.com']);
  
   _gaq.push(['_setCustomVar',
      1,                   // This custom var is set to slot #1.  Required parameter.
      'ownerLoginId',     // The name acts as a kind of category for the user activity.  Required parameter.
      '309673435@qq.com',               // This value of the custom variable.  Required parameter.
      3                    // Sets the scope to session-level.  Optional parameter.
   ]);
   _gaq.push(['_setCustomVar',
      2,                   // This custom var is set to slot #1.  Required parameter.
      'buyerName',     // The name acts as a kind of category for the user activity.  Required parameter.
      '陈博伦',               // This value of the custom variable.  Required parameter.
      3                    // Sets the scope to session-level.  Optional parameter.
   ]);
   _gaq.push(['_setCustomVar',
      3,                   // This custom var is set to slot #1.  Required parameter.
      'sendAreaName',     // The name acts as a kind of category for the user activity.  Required parameter.
      '中国湖北省武汉市',               // This value of the custom variable.  Required parameter.
      3                    // Sets the scope to session-level.  Optional parameter.
   ]);
   
  _gaq.push(['_trackPageview']);
  
  _gaq.push(['_addTrans',
    '1707051457001',           // order ID - required
    '',  // affiliation or store name
    '29.4',          // total - required
    '',           // tax
    '6.0',              // shipping
    '中国湖北省武汉市',       // city
    '省份',     // state or province
    '国'             // country
  ]);
  
  

	
		
	
		
			
		
	
		
	
		
	
	

   // add item might be called for every item in the shopping cart
   // where your ecommerce engine loops through each item in the cart and
   // prints out _addItem for each
  _gaq.push(['_addItem',
    '1707051457001',           // order ID - required
    '3409090',           // SKU/code - required
    '三国演义(价值阅读足本典藏)(精)()',        // product name
    '601/603/50000/66260/66263',   // category or variation
    '23.4',          // unit price - required
    '1'               // quantity - required
  ]);
	
	orderInfo.item.push({
                "skuId": '3409090',
                "skuName": '三国演义(价值阅读足本典藏)(精)()',
                "category": '601/603/50000/66260/66263',
                "Price": '23.4',
                "Quantity": '1'
            });
	



  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
 
<script type="text/javascript">
_hmt.push(['_trackOrder', orderInfo]);
</script>
 

<!-- end 中间部分 -->


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
		<img src="<%=basePath %>/img/dyh.jpg" width="100px" hight="100px" style="margin-left:0px;" />
		<img src="<%=basePath %>/img/fwh.jpg" width="100px" hight="100px" style="margin-left:10px;" />
	</div>
	<!--google-->   
	<!-- UA--><!--UA end-->           
	<!-- end 页脚-->
</div>
 
<!-- end 页脚-->
	
<script type="text/javascript">
    /* //设置飘浮目录
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
        document.getElementById("rightDiv").style.top = parseInt(document.getElementById("rightDiv").style.top)+percent+"px";
        lastScrollY=lastScrollY+percent;
        //alert(lastScrollY);
    }

    window.setInterval("heartBeat()",5); */

</script>
    
<!-- JiaThis Button BEGIN -->
<script type="text/javascript" id="bdshare_js" data="type=slide&amp;pos=left&amp;uid=6456503" ></script>  
<script type="text/javascript" id="bdshell_js" data="type=uid=6456503" ></script> 
<script type="text/javascript">
	document.getElementById('bdshell_js').src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>

<!-- JiaThis Button END -->
<script type="text/javascript">
	function getCard() {
		if (usr==null||usr=="null") {
			$("#dialogContent").show();
			$("#dialog").slideDown();
			setTimeout("$('#dialog').slideUp();$('#dialogContent').hide();",2000);
		}
	}
</script>
</body>
</html>


