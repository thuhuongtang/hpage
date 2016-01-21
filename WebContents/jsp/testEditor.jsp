<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>
<%@ page import="java.util.*"%>
<%@ page import="com.ckeditor.CKEditorConfig"%>
<%@ page import="com.ckeditor.EventHandler"%>
<%@ page import="com.ckeditor.GlobalEventHandler"%>
<%@ page import="com.posdata.glue.util.log.PosLogFactory"%>
<%@ page import="com.posdata.glue.util.log.PosLog"%>
<%@ page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@ page import="com.posdata.glue.context.PosContext" %>
<%@ page import = "com.posdata.glue.dao.vo.*" %>
<%@ page import = "com.posdata.glue.web.control.PosWebConstants" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRowSet" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRow" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.posdata.glue.xplatform.common.Converter" %>
<%@ page import = "com.tobesoft.xplatform.data.DataSet" %>
<%
	String value = "My first <strong>CKEditor</strong> Java tag";
	String no="";
	String title="";
	String desc="";
	String lang="";
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("width", "900");
	settings.addConfigValue("language", "${pageContext.request.contextPath}/ictvietnam.dolish");
	settings.addConfigValue("basicEntities",false);
	settings.addConfigValue("entities_latin",false);
	//settings.addConfigValue("toolbar","[{name: 'document', items: ['Source', '-', 'NewPage']},'/',{name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline' ]},{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },]");
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	PosLog logger = PosLogFactory.getLogger(String.class);
	
%>
<script type="text/javascript">
/* CKEDITOR.replace( 'job_desc',
{
	filebrowserBrowseUrl : '/ckfinder/ckfinder.html',
	filebrowserImageBrowseUrl : '/ckfinder/ckfinder.html?type=Images',
	filebrowserFlashBrowseUrl : '/ckfinder/ckfinder.html?type=Flash',
	filebrowserUploadUrl : 
 	   '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files&currentFolder=/archive/',
	filebrowserImageUploadUrl : 
	   '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images&currentFolder=/upload/',
	filebrowserFlashUploadUrl : '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
}); */

function makeUrl(eventNm) {
	
	if(eventNm == 'save') {
		//$param = "&no="+$('#no').val();//+"title="+$('#title').val()+"&lang="+$('#lang').val();
		//alert("there there");
		//var root = window.location.pathname;
		//var root = window.location.href;
		//var title = document.getElementById("title").value;
		//var desc =String(CKEDITOR.instances.job_desc.getData());		
		document.form.action = "${pageContext.request.contextPath}/editor.do?ServiceName=Recruitment-service&save=1";	
		document.forms["form"].submit();
	//	$(form).submit();		
	} 
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
	<form name="form" action="editor.do" method="post">
		<p><label>No : </label><input id="no" name="no" type="text" value="<%=no%>"></p>
		<p><label>Title : </label><input id="title" name="title" type="text" value="<%=title%>"></p>
		<p><label>Language : </label><input id="lang" name="lang" type="text" value="<%=lang%>"></p>
		<p>
			<label for="job_desc">Editor 1:</label>
			<textarea cols="80" id="job_desc" name="job_desc" rows="10" value="<%=desc%>"></textarea>
		</p>
		<p>
			<input type="submit" value="Submit" />
		</p>
		<p>
			<ul class="btn-admin">
				<li><a href="javascript:makeUrl('save');"><i class="fa fa-search"></i>Save</a></li>
			</ul>
		</p>
		
		<ckfinder:setupCKEditor basePath="./ckfinder/" editor="job_desc" />
		<ckeditor:editor basePath="./ckeditor/" config="<%=settings %>" editor="job_desc"/>
	</form>
</body>
</html>
	