var hasBegin=false;jQuery.fn.countdown=function(options){if(!options)options='()';if(jQuery(this).length==0)return false;var obj=this;if(options.seconds<0||options.seconds=='undefined')
{if(options.callback)eval(options.callback);return null;}
window.setTimeout(function(){var day=options.seconds/(1000*60*60*24);var timeContent="";if(day<=1){var h=Math.floor((options.seconds)/(1000*60*60));
options.seconds=options.seconds-1000;if(options.seconds<0)options.seconds=0;jQuery(obj).countdown(options);},1000);return this;}
jQuery.fn.countdown.stop=function(){window.clearTimeout(setTimeout("0")-1);}