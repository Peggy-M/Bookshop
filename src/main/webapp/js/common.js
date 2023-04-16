function trim(s)
{var re=/^\s*(\S*)\s*$/;return s.replace(re,"$1");}
function isemail(s)
{if(s.length>100)
{window.alert("email地址长度不能超过100位!");return false;}
var regu="^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$"
var re=new RegExp(regu);if(s.search(re)!=-1){return true;}
else
{window.alert("请输入有效合法的E-mail地址 ！")
return false;}}
function radiocheck(radioname){var selectopt=false;var radioopt=document.getElementsByName(radioname);var radiolen=radioopt.length;if(radiolen<1){selectopt=true;}else if(radiolen==1){if(radioopt[0].checked==true&&radioopt[0].disabled==false){selectopt=true;}}else{for(var i=0;i<radiolen;i++){if(radioopt[i].checked==true&&radioopt[i].disabled==false){selectopt=true;}}}
return selectopt;}
function checkvalue(elementname){var elementvalue=$(elementname).value;if(elementvalue==""){$(elementname).focus();return false;}else{return true;}}
function changeClassName(eName,cName){eName.className=cName;}