function decrease(){var amount=jQuery("#amount");if(amount.val()>1){amount.val(amount.val()-1);}}
function changeAmount(SellableCount){var obj=document.getElementById("amount");if(!/^[0-9]*$/.test(obj.value)){alert("请输入正确的商品数量！");obj.value=1;obj.focus();return false;}
if(obj.value==""||obj.value<=0){obj.value=1;}}
function changeAmount2(canSelect){var obj=document.getElementById("amount");if(canSelect){if(obj.value>100000){obj.value=1;obj.focus();return false;}}
if(obj.value==""||obj.value<=0){obj.value=1;}}
function adding(canSelect){var amount=jQuery("#amount");amount.val(Number(amount.val())+1);}
function loadViewHistory(){var $viewHistory=jQuery("#viewHistory");$viewHistory.load("/Product/ViewHistory.do");}
function loadPPrice(pid,div,m_id){var data={id:pid,mid:m_id};jQuery.ajaxSettings['contentType']="application/x-www-form-urlencoded; charset=utf-8";var divid="#"+div
jQuery(divid).load(frontPath+"/ProductPrice.do",data);}
function showPresentTab(id,n){if(n==1){jQuery("div[id^='present']").hide();}
jQuery("#"+id).show();}
function closePresent(id){jQuery("#"+id).hide()}
var currImg=0;function selectImg(id){if(currImg!=id){jQuery("#midImg_"+currImg).css("display","none");jQuery("#midImg_"+id).removeAttr("style");jQuery("#img40_"+id).attr("class","sPicDiv cur");jQuery("#img40_"+currImg).attr("class","sPicDiv");currImg=id;}}
jQuery(document).ready(function(){selectTab()
changeTable();selectSmallPic()});function changeTable(){var $table=jQuery("#pArgument table");$table.find("tr:first").addClass("first");if($table.find("tr").length>1){$table.find("tr:last").addClass("last")}}
function selectTab(){var $menuTab=jQuery("#menuTab > div");$menuTab.click(function(){var $curTab=jQuery(this);$menuTab.removeClass();if($curTab.attr("id")=="dp"){$curTab.addClass("dpcur");}else{$curTab.addClass("cur");jQuery("#dp").addClass("dp");}
$menuTab.each(function(){var tabAttr=jQuery(this).attr("tab");jQuery("#"+tabAttr).css("display","none");if(this==$curTab[0]){jQuery("#"+tabAttr).css("display","block");if(tabAttr=='pRemark'){dyniframesize('productframe');}}});});}
function selectSmallPic(){var $content=jQuery("#detail_scro");var i=5;var m=5;var l=0;var count=$content.find("div").length;jQuery("#ctrlR").click(function(){if(!$content.is(":animated")){if(m<count){m++;$content.animate({left:l-53},600);l=l-53;jQuery("#ctrlL > img").attr("src",frontPath+"/guanggou/templets/"+webIndex+"/Default/images/2.gif");}
if(m==count){jQuery("#ctrlR > img").attr("src",frontPath+"/guanggou/templets/"+webIndex+"/Default/images/3.gif")}}});jQuery("#ctrlL").click(function(){if(!$content.is(":animated")){if(m>i){m--;$content.animate({left:l+53},600);l=l+53;jQuery("#ctrlR > img").attr("src",frontPath+"/guanggou/templets/"+webIndex+"/Default/images/detail_icon3.gif");}
else{jQuery("#ctrlL > img").attr("src",frontPath+"/guanggou/templets/"+webIndex+"/Default/images/detail_icon1.gif");}}});}
function splitCartSubmit(){if(getRadioValue("toCartId")==null){alert("请选择商品要加入到哪张订单！");return false;}else{document.getElementById("cartId").value=getRadioValue("toCartId");document.getElementById("buyForm").submit();}
return true;}
function getRadioValue(radioName){var obj=document.getElementsByName(radioName);if(obj!=null){for(var i=0;i<obj.length;i++){if(obj[i].checked){return obj[i].value;break;}}}
return null;}
function specialPriceTime(id,pastTime){var time=0,time2=0;var intervalId=setInterval(function(){if(pastTime>0){time=pastTime;var day=parseInt(time/(1000*60*60*24));time=(time%(1000*60*60*24));var h=Math.floor(time/(1000*60*60));var m=Math.floor(time/(1000*60))%60;var s=Math.floor(time/(1000))%60;if(day>0){jQuery("#spacialTime").html("剩余时间："+day+"天"+h+"时"+m+"分"+s+"秒");}else{jQuery("#spacialTime").html("剩余时间："+h+"时"+m+"分"+s+"秒");}
pastTime-=1000;}
if(pastTime<=0){jQuery("#spacialTime").html("");clearInterval(intervalId);}},1000);}
function scarePriceTime(id,pastTime){var time=0,time2=0;var intervalId=setInterval(function(){if(pastTime>0){time=pastTime;var day=parseInt(time/(1000*60*60*24));time=(time%(1000*60*60*24));var h=Math.floor(time/(1000*60*60));var m=Math.floor(time/(1000*60))%60;var s=Math.floor(time/(1000))%60;if(day>0){jQuery("#"+id).html("剩余时间："+day+"天"+h+"时"+m+"分"+s+"秒");}else{jQuery("#"+id).html("剩余时间："+h+"时"+m+"分"+s+"秒");}
pastTime-=1000;}
if(pastTime<=0){jQuery("#"+id).html("");clearInterval(intervalId);}},1000);}
function showBookDiv(){jQuery("#tag_box").show('slow');}
function closeBookDiv(){jQuery("#tag_box").hide('slow');}
function showFriendTab(id){jQuery("#"+id).show();}
function closeFriendTab(id){jQuery("#"+id).hide();}
function showFriendTab1(divid,id,mid){showFriendTab(divid);if(jQuery("#tb_layer").length>0){jQuery("#tb_layer").hide();}
var timetemp=(new Date()).valueOf();jQuery("#"+divid).load(frontPath+"/Product/IncludeFriends.do?pid="+id+"&mid="+mid+"&pollid="+id+"&t="+timetemp);}