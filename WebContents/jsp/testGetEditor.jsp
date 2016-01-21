<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ page import="com.posdata.glue.util.log.PosLogFactory"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page import="com.ckeditor.CKEditorConfig"%>
<%@ page import="com.ckeditor.EventHandler"%>
<%@ page import="com.ckeditor.GlobalEventHandler"%>
<%
	PosRowSet RS_RESULT = null;
	PosLog logger = PosLogFactory.getLogger(String.class);
	String value = "My first <strong>CKEditor</strong> Java tag";
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("width", "900");
	settings.addConfigValue("language", "${pageContext.request.contextPath}/ictvietnam.dolish");
	settings.addConfigValue("basicEntities",false);
	settings.addConfigValue("entities_latin",false);
	//settings.addConfigValue("toolbar","[{name: 'document', items: ['Source', '-', 'NewPage']},'/',{name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline' ]},{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },]");
	List<String> titles=new ArrayList<String>();
	Map<String,String> jobs=new HashMap<String,String>(); 
	request.setAttribute("titles", titles);
	request.setAttribute("jobs", jobs);
	request.setAttribute("settings", settings);
	
	if (ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT != null) {
			while(RS_RESULT.hasNext()) {
				PosRow row=RS_RESULT.next();
				String title = (String)row.getAttribute("TITLE");
				String job = (String)row.getAttribute("JOB_DESC_EN");
				job = PictvnHpStringUtil.unescapeHtml3(job);
				
				titles.add(title);
				jobs.put(title, job);
			}
		}
	}
%>
<SCRIPT type="text/javascript">
	function showContent(div_name) {

		$(".content_group").hide();
		//$(".content_group").show();

		//$(".content_group").show();
		//alert(2);
		//$(div_name).hide();	
		//alert(document.getElementsByClassName("content_group")[1]);
		var x = document.getElementsByClassName("content_group")[div_name];
		x.style.display = "block";
	}
</SCRIPT>
<script type="text/javascript">
	window.onload = function () {
		CKEDITOR.instances.job_desc_en.setData("job");
		CKEDITOR.instances.job_desc_vn.setData("<h2>Job Description </h2>");
		CKEDITOR.instances.job_desc_kr.setData("<h2>Job Description </h2>");
	}
</script>
<template:tmpt title="Recruitment">
	<jsp:attribute name="sub_menu">
<H2>Recruitment</H2>
				<UL class=s_dep02>
						<LI class="on hv">
							<A href="${pageContext.request.contextPath}/rcmSearch.do" class=indep3>Recruitment</A>
							<UL class=s_dep03>
								<c:forEach items="${titles}" varStatus="counter" var="title">
									<LI><DIV><A href="javascript:void(0)" onclick="showContent('${counter.index}');">${title}</A></DIV></LI>
								</c:forEach>
							</UL>
						</LI>
					</UL>
				</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
					
					<DIV class="con_body ci">
						<ckeditor:editor basePath="${pageContext.request.contextPath}/ckeditor/" config="${settings}" editor="job_desc_en"/>
						<ckeditor:editor basePath="${pageContext.request.contextPath}/ckeditor/" config="${settings}" editor="job_desc_vn"/>
						<ckeditor:editor basePath="${pageContext.request.contextPath}/ckeditor/" config="${settings}" editor="job_desc_kr"/>
					</DIV>
				</DIV>
				
	</jsp:attribute>
</template:tmpt>
