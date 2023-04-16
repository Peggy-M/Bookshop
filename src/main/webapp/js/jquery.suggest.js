(function($){$.suggest=function(input,options){var $input=$(input).attr("autocomplete","off");var $results=$(document.createElement("div"));var timeout=false;var prevLength=0;var prevVal="";var cache=[];var cacheSize=0;$results.addClass(options.resultsClass).appendTo('body');$results.css("width",input.offsetWidth-2);$results.css("padding-top",2);resetPosition();$(window).load(resetPosition).resize(resetPosition);timeout=setTimeout(suggest,options.delay);$input.blur(function(){setTimeout(function(){$results.hide()},200);});try{$results.bgiframe();}catch(e){}
if($.browser.mozilla)
$input.keypress(processKey);else
$input.keydown(processKey);function resetPosition(){var offset=$input.offset();$results.css({top:(offset.top+ input.offsetHeight+1)+'px',left:offset.left+'px'});}
function processKey(e){if((/27$|38$|40$/.test(e.keyCode)&&$results.is(':visible'))||(/^13$|^9$/.test(e.keyCode)&&getCurrentResult())){if(e.preventDefault)
e.preventDefault();if(e.stopPropagation)
e.stopPropagation();e.cancelBubble=true;e.returnValue=false;switch(e.keyCode){case 38:prevResult();break;case 40:nextResult();break;case 9:case 13:selectCurrentResult();break;case 27:$results.hide();break;}}else{}}
function suggest(){timeout=setTimeout(suggest,options.delay);var q=$.trim($input.val());if(q.length>=options.minchars&&prevVal!=q){prevVal=q;cached=checkCache(q);if(cached){displayItems(cached['items']);}else{$.post(options.source,{q:q},function(txt){var items=parseTxt(txt,q);displayItems(items);addToCache(q,items,txt.length);});}}
else{if(q.length<options.minchars){prevVal=q;$results.hide();}}}
function checkCache(q){for(var i=0;i<cache.length;i++)
if(cache[i]['q']==q){cache.unshift(cache.splice(i,1)[0]);return cache[0];}
return false;}
function addToCache(q,items,size){while(cache.length&&(cacheSize+ size>options.maxCacheSize)){var cached=cache.pop();cacheSize-=cached['size'];}
cache.push({q:q,size:size,items:items});cacheSize+=size;}
function displayItems(items){if(!items)
return;if(!items.length){$results.hide();return;}
var html='<table style="width:100%;border-collapse:collapse;border-width:0;border-style:none;"><tbody>';for(var i=0;i<items.length;i++){var parts=items[i].split(",");html+='<tr><td class="ac_word">'+ parts[0]+'</td>'+'<td class="ac_desc">'+ parts[1]+'</td></tr>';}
html+="</tbody></table>"
$results.html(html).show();jQuery("table > tbody > tr",$results).mouseover(function(){var currentResult=getCurrentResult();if(currentResult){currentResult.removeClass(options.selectClass);}
$(this).addClass(options.selectClass);}).click(function(e){e.preventDefault();e.stopPropagation();selectCurrentResult();});}
function parseTxt(txt,q){var items=[];var tokens=txt.split(options.delimiter);for(var i=0;i<tokens.length;i++){var token=$.trim(tokens[i]);if(token){items[items.length]=token;}}
return items;}
function getCurrentResult(){if(!$results.is(':visible'))
return false;var $currentResult=jQuery("table > tbody > tr."+ options.selectClass,$results);if(!$currentResult.length)
$currentResult=false;return $currentResult;}
function selectCurrentResult(){$currentResult=getCurrentResult();if($currentResult){var text=jQuery(jQuery("td",$currentResult)[0]).text();$input.val(text);$results.hide();if(options.onSelect)
options.onSelect.apply($input[0]);}}
function nextResult(){$currentResult=getCurrentResult();if($currentResult)
$currentResult.removeClass(options.selectClass).next().addClass(options.selectClass);else{var table=$results.children("table");var tbody=table.children("tbody");var tr=tbody.children("tr")[0];jQuery(tr).addClass(options.selectClass);}}
function prevResult(){$currentResult=getCurrentResult();if($currentResult)
$currentResult.removeClass(options.selectClass).prev().addClass(options.selectClass);else
{var table=$results.children("table");var tbody=table.children("tbody");var tr=tbody.children("tr")[0];jQuery(tr).addClass(options.selectClass);}}}
$.fn.suggest=function(source,options){if(!source)
return;options=options||{};options.source=source;options.delay=options.delay||100;options.resultsClass=options.resultsClass||'ac_results';options.selectClass=options.selectClass||'ac_over';options.matchClass=options.matchClass||'ac_match';options.minchars=options.minchars||2;options.delimiter=options.delimiter||'\n';options.onSelect=options.onSelect||false;options.maxCacheSize=options.maxCacheSize||65536;this.each(function(){new $.suggest(this,options);});return this;};})(jQuery);