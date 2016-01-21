// 첨부파일 등록 :jsAddFile(파일 종류)
function jsAddFile(filetype){
	var attpop = window.open('/kor/_common/popFileSave.asp?ft='+filetype,'attpop','width=400,height=300');
	attpop.focus();
}

// 첨부파일 추가시 파일 정보 부분 HTML 추가 : jsAddFileHTML(HTML DOM ID ,파일원본이름 ,저장된파일이름 ,파일크기 ,파일종류)
function jsAddFileHTML(domid ,orgfilename ,savefilename ,filesize ,filetype){

	var obj = $('#'+domid);
	obj.show();
	obj.find('.file_name').html(orgfilename);
	obj.find('.file_data').html(filesize);
	obj.find('#file_down').attr('onclick','jsGetFile(\''+orgfilename+'\',\''+savefilename+'\',\''+filetype+'\');');
	obj.find('#file_del').attr('onclick','jsDelFile(\''+domid+'\' ,\''+orgfilename+'\',\''+savefilename+'\',\''+filetype+'\');');
}

//첨부파일 삭제 : jsDelFile(파일원본이름 ,저장된파일이름 ,파일종류)
function jsDelFile(domid ,orgfilename ,savefilename ,filetype){
	if(confirm('파일이 실제로 삭제 됩니다\n삭제하시겠습니까?')){
		var attpop = window.open('/kor/_common/popFileDel.asp?fn='+ orgfilename +'&fs='+ savefilename +'&ft='+ filetype,'attpop','width=0,height=0');
		//attpop.focus();
		jsDelFileHTML(domid);
	}
}

// 첨부파일 삭제시 파일 정보 부분 HTML 가리기
function jsDelFileHTML(domid){
	$('#'+domid).hide();
}

// 첨부파일 다운로드 : jsGetFile(파일원본이름 ,저장된파일이름 ,파일종류)
function jsGetFile(orgfilename,savefilename,filetype){
	//var fd = window.open('/_common/popFileDown.asp?fn='+ orgfilename +'&fs='+ savefilename +'&ft='+ filetype,'filepop','width=0,height=0');
	document.location.href='/kor/_common/popFileDown.asp?fn='+ orgfilename +'&fs='+ savefilename +'&ft='+ filetype;

}