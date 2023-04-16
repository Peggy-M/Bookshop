var indexL=$(".banner>ul li").length;
$(".banner>ul").css("width",indexL+"00%");
$(".banner>ul li").css("width",100/indexL+"%");

for(iN=0;iN<indexL;iN++){
	ii=iN+ 1;
	$(".circular-list").append("<i>"+ ii+"</i>");
}

$(".circular-list i:first-child").addClass("cur");
$(".circular-list").css("margin-left",-indexL*15);

function move(){
	$(".banner .circular-list i").eq(i).addClass("cur").siblings().removeClass("cur");
	$(".banner>ul").stop(true).animate({"margin-left":-i+"00%"},500);
}

var i=0;
$(".banner .circular-list i").hover(
		function(){
			i=$(this).index();
			move();
		},function(){}
);

$(".banner .LR-btn span.prev").click(function(){
	i--;
	if(i<0){
		i=indexL- 1
	}
	move();}
);

$(".banner .LR-btn span.next").click(function(){
	i++;
	i=i%indexL;
	move();
});

var timer=setInterval(function(){
	i++;
	i=i%indexL;
	move();
},3000);

$(".banner").hover(function(){
	clearInterval(timer);
	},function(){
		timer=setInterval(function(){
			i++;
			i=i%indexL;
			move();},3000)});

$(".activityPic a:nth-child(2) img").css("margin-bottom","0");