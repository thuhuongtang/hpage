
var strReplaceTabEnter  = function (str) {
	str = str.replace("\n","");
	str = str.replace("\r","");	
	return str;
}

var checkMobile  = function() {
	var str = "";
	var ua = window.navigator.userAgent.toLowerCase(); 
	if ( /iphone/.test(ua) || /android/.test(ua) || /opera/.test(ua) || /bada/.test(ua) ) {     
		str = "Y";
	} else {
		str = "N";
	}
	return str;
}

var doPageMove = function(page)
{
	$("#page").val(page);	
	$("#mode").val("list");
	$("#base_form").submit();
}

/*
 *  페이징 출력 함수
 *  
 *  @cPage	: 현재 페이지
 *  @tRow	: 총 레코드수
 *  @pRow	: 페이지당 출력 레코드수
 *  @bPage	: 한 블럭당 출력될 페이지수
 */
function paging(cPage, tRow, pRow, bPage)
{
	var html = "";
	var tPage = Math.ceil(Number(tRow) / Number(pRow));
	var pos = Math.ceil(Number(bPage) / 2);
	var sPage = Number(cPage) - pos + 1;
	sPage = (sPage < 1) ? 1 : sPage;
	var ePage = sPage + Number(bPage);
	ePage = (ePage > tPage) ? (tPage + 1) : ePage;
	var gap = ePage - sPage;
	if(gap < Number(bPage)){
		sPage = ((sPage - (Number(bPage) - gap)) < 1) ? 1 : (sPage - (Number(bPage) - gap)); 
	}

	if(sPage > 1)
		html += "<li><a style='cursor:pointer' onClick='doPageMove(1)'>1</a><li>";
	if(sPage > 2)
		html += "··· ";
		
	for(var i = sPage ; i < ePage ; i++) {
		var ClassOn = "";
		if(cPage == i)
			ClassOn = " class='on'";
		html += "<li " + ClassOn + "><a href='javascript:void(0)' style='cursor:pointer' onClick='doPageMove("+i+")' title='"+i+"번째 페이지 입니다.'>" + i + "</a></li>";
		
	}
	// 모바일일때 tPage 를 낮게 해서 표시 숫자 줄이기.
	if(ePage <= (tPage - 1))
		html += "··· ";
	if(ePage <= tPage)
		html += "<li><a href='javascript:void(0)' style='cursor:pointer' onClick='doPageMove("+tPage+")'>" + tPage + "</a></li>";
	

	if(checkMobile() == "Y") {
		$("#m_pageing").html(html);
	} else {
		$("#d_pageing").html(html);
	}
	
}


function viewpaging(cPage, tRow, pRow, bPage)
{
	var html = "";
	var tPage = Math.ceil(Number(tRow) / Number(pRow));
	var pos = Math.ceil(Number(bPage) / 2);
	var sPage = Number(cPage) - pos + 1;
	sPage = (sPage < 1) ? 1 : sPage;
	var ePage = sPage + Number(bPage);
	ePage = (ePage > tPage) ? (tPage + 1) : ePage;
	var gap = ePage - sPage;
	if(gap < Number(bPage)){
		sPage = ((sPage - (Number(bPage) - gap)) < 1) ? 1 : (sPage - (Number(bPage) - gap)); 
	}

	if(sPage > 1)
		html += "<li><a style='cursor:pointer' onClick='viewListSend(1)'>1</a><li>";
	if(sPage > 2)
		html += "··· ";
	
	for(var i = sPage ; i < ePage ; i++) {
		var ClassOn = "";
		if(cPage == i)
			ClassOn = " class='on'";
		html += "<li " + ClassOn + "><a href='javascript:void(0)' style='cursor:pointer' onClick='viewListSend("+i+")' title='"+i+"번째 페이지 입니다.'>" + i + "</a></li>";
	}
	// 모바일일때 tPage 를 낮게 해서 표시 숫자 줄이기.
	if(ePage <= (tPage - 1))
		html += "··· ";
	if(ePage <= tPage)
		html += "<li><a href='javascript:void(0)' style='cursor:pointer' onClick='viewListSend("+tPage+")'>" + tPage + "</a></li>";
			
	if(checkMobile() == "Y") {
		$("#m_pageing").html(html);
	} else {
		$("#d_pageing").html(html);
	}
}
