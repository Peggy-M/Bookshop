function loadViewHistory(){jQuery("#viewHistory").load(frontPath+"/ProductList/ViewHistory.do");}
function clearHistory(){var strCookie=document.cookie;if(strCookie!=null){var hasView=false,temp=false;var expires=new Date();expires.setDate(expires.getDate()- 1);var arrCookie=strCookie.split(";");for(var i=0;i<arrCookie.length;i++){var arr=arrCookie[i].split("=");if(arr[0].indexOf("ViewHistory")>0){temp=true;hasView=hasView||temp?true:false;document.cookie="ViewHistory"+arr[1]+"=;expires="+expires.toGMTString()+";path="+(frontPath==""?"/":frontPath);}}}
if(!hasView){return false;}
loadViewHistory();return true;}
function showSelectDiv(){document.getElementById("listSelectDiv").style.display="";}
function hideSelectDiv(){document.getElementById("listSelectDiv").style.display="none";}
function isGoToCart(articleId){var params=new Object();params["ObjectId"]=articleId;params["merId"]=0;params["isRedirectCart"]="isRedirectCart";jQuery.ajaxSettings['contentType']="application/x-www-form-urlencoded; charset=utf-8";jQuery.post(frontPath+"/AddToCart.do",params,function(data){if(data.indexOf("赠品页")>0){window.location.href="/AddToCart.do?ObjectId="+articleId+"&jianshu=0";setTimeout("",500);}
var paramsTT=new Object();paramsTT["randomT"]=Math.random();paramsTT["ObjectId"]=articleId;jQuery("#showIncludeCart"+articleId).load(frontPath+"/IncludeCart.do",paramsTT);jQuery("#IncludeSmallCartDiv").load(frontPath+"/"+webIndex+"/FInclude/IncludeSearchCart.do",paramsTT);});}
function closeDiv(articleId){jQuery("#addTC_boxDiv"+articleId).hide();}
String.prototype.Trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"");};function checkPLSearchform(){var keyword=document.getElementById("pLKeywords").value.Trim();if(keyword==""){alert("关键字不能为空！");return false;}else{var text=keyword.replace(/([\u0391-\uFFE5])/ig,'mm');if(text.length<2){alert("关键字太短了！");return false;}else if(text.length>50){alert("关键字太长了！");return false;}else{if(keyword.indexOf("&")>0){keywordArray=keyword.split("&");keyword=keywordArray[0];}
keyword+=",title,keyword,b_author,b_isbn,code,b_contentsynopsis";}}
var thKeywords=document.getElementById("theProductListKeyword");thKeywords.value=keyword;return true;}
function writeCookie(name,value,hours){var expire="";if(hours!=null){expire=new Date((new Date()).getTime()+ hours*3600000);expire="; expires="+ expire.toGMTString();}
document.cookie=name+"="+ escape(value)+ expire;}
function setCartBackCookie(){var url=location.href;if(url.indexOf("Keywords")<0&&kwd!=""){var urlAddKw="?Keywords="+kwd;url+=urlAddKw;}
writeCookie("ShoppingCartGoBack",url,24*7);}
setCartBackCookie();