var sumoprice;var sumprice;var bestcount=1;function unitAll(){if(typeof prodJson!="undefined"&&prodJson!=-1){for(var i=1;i<prodJson.prod.length;i++){if(i!=1){jQuery("#ck"+ prodJson.prod[i].pid).attr("checked",false);}else{jQuery("#ck"+ prodJson.prod[i].pid).attr("checked",false);}}
sumoprice=parseFloat(prodJson.prod[0].oprice)+ parseFloat(prodJson.prod[1].oprice);sumprice=parseFloat(prodJson.prod[0].price)+ parseFloat(prodJson.prod[1].price);}}
function showsumprice(sumoprice,sumprice){jQuery("#sumopriceDiv").html("\uffe5"+ changeTwoDecimal_f(sumoprice));jQuery("#sumpriceDiv").html("\uffe5"+ changeTwoDecimal_f(sumprice));}
function tomatchjsonid(id){for(var i_id=1;i_id<prodJson.prod.length;i_id++){if(prodJson.prod[i_id].pid==id){return i_id;}}
return-1;}
function checkbox(chkbox,id){var len=jQuery(":checkbox:checked").length;if(len==0){jQuery("#packMess").show();$("#fitting-suit .infos input[type=submit]").attr("disabled",true);}else{jQuery("#packMess").hide();$("#fitting-suit .infos input[type=submit]").attr("disabled",false);}
GetCount();}
function GetCount(){var defaultV=parseFloat($("#match-con-01 .master input").val());var conttes=defaultV;var aa=0;$("#match-con-01 .suits input").each(function(){if($(this).is(':checked')){conttes+=parseFloat($(this).val().substr(1));aa+=1;}});jQuery("#bestcount").html(aa);jQuery("#sumopriceDiv").html(conttes.toFixed(2));}
function changeTwoDecimal_f(x){var f_x=parseFloat(x);if(isNaN(f_x)){alert("\u4e24\u4f4d\u5c0f\u6570\u683c\u5f0f\u8f6c\u6362\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u975e\u6570\u5b57\uff01");return false;}
var f_x=Math.round(x*100)/ 100;var s_x=f_x.toString();var pos_decimal=s_x.indexOf(".");if(pos_decimal<0){pos_decimal=s_x.length;s_x+=".";}
while(s_x.length<=pos_decimal+ 2){s_x+="0";}
return s_x;}
function checkBForm(){var destObjIds=new Array(),i_x=0;for(var i=1;i<prodJson.prod.length;i++){if(jQuery("#ck"+ prodJson.prod[i].pid).is(":checked")==true){destObjIds[i_x++]=prodJson.prod[i].pid;}}
jQuery("#destObjIds").val(destObjIds);return true;}