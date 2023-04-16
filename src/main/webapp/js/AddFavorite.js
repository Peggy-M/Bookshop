
//收藏网址
function AddFavorite(sURL,sTitle){
	sURL=encodeURI(sURL);
	try{
		window.external.addFavorite(sURL,sTitle);
	}catch(e){
		try{
			window.sidebar.addPanel(sTitle,sURL,"");
		}catch(e){
			alert("您的浏览器不支持,请按 Ctrl+D 手动收藏!");
		}
	}
}

function SetHome(url){
	if(document.all){
		document.body.style.behavior='url(#default#homepage)';
		document.body.setHomePage(url);
	}else{
		alert("����,�����������֧���Զ�����ҳ��Ϊ��ҳ����,�����ֶ�������������ø�ҳ��Ϊ��ҳ!");
	}
}