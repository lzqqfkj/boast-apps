function check(theForm){
	var keywords = theForm.keywords.value;
	if(keywords == "输入关键字" || keywords == "" ){
	alert("请输入查询内容！");
	theForm.keywords.focus();
	return false;
	}
	return true;
}
function changeLinkStyle(div, aid){
	var nowdiv = document.getElementById(div);
	var A=nowdiv.getElementsByTagName("A");
	for(var i=0;i<A.length;i++)
	{
		A[i].className="e";
	}
	aid.className="be";
}