function showTab(id){jQuery("#"+id).show();}
function hideTab(id){jQuery("#"+id).hide();}
var vipform=null;jQuery(document).ready(function(){var options={beforeSubmit:checkvipForm,success:vipAddResult};jQuery("#vipAddForm").ajaxForm(options);vipform=document.getElementById('vipAddForm');});function showMsg(msg){jQuery("#showMsg").html(msg).show();setTimeout(function(){jQuery("#showMsg").hide();},3000);}
function showg(mg){jQuery("#vipBox").html(mg);jQuery("#vipBox").attr("style","text-align:center;font-size:larger;margin-top:30px;font-weight:bold;");setTimeout(function(){jQuery("#vip").hide();},3000);}
function checkvipForm(){if(vipform.vipcard.value==null||vipform.vipcard.value==""){showMsg("标题不能为空,请重新输入");vipform.vipcard.focus();return false;}
if(vipform.vipps.value==null||vipform.vipps.value==""){showMsg("内容不能为空,请重新输入");vipform.vipps.focus();return false;}
if(vipform.validateCode.value==null||vipform.validateCode.value==""){showMsg("验证码不能为空,请重新输入");vipform.validateCode.focus();return false;}}
function vipAddResult(msg){var aData=msg.split(",");if(aData[0]==1){showg("你的申请已提交，请耐心等待审核！");return false;}
if(aData[0]==4||aData[0]==3){showMsg("验证码不正确,请重新输入");vCodeRefresh();return false;}
if(aData[0]==0){showMsg("申请失败！");return false;}
if(aData[0]==5){showMsg("你已申请过，请等待审核！");return false;}}
function vCodeRefresh(){jQuery("#ValidateCode").attr("src",frontPath+"/ValidateCode?dumy="+ Math.random());}
function addbigRigister(){jQuery.post(frontPath+"/Member/BigRigister.do",function(msg){var aData=msg.split(",");if(aData[0]==0){shows("你的申请已提交，请耐心等待审核！");}
if(aData[0]==1){shows("申请失败！");}});}
function shows(msg){jQuery("#shows").html(msg);setTimeout(function(){jQuery("#big").hide();},2000);}