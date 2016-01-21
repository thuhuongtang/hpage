<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/functions.tld" prefix="f" %>
<%@ page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@ page import="com.posdata.glue.context.PosContext" %>
<%@ page import = "com.posdata.glue.web.control.PosWebConstants" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRowSet" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRow" %>
<%@ page import = "java.util.*" %>
<%@page import="com.posco.ict.hp.resource.HPageContent"%>

<%
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	
	Map<String,HPageContent> jobs=new TreeMap<String,HPageContent>(); 
	request.setAttribute("jobs", jobs);
	
	if (ctx != null) {
		PosRowSet RS_RESULT = null;
		PosRowSet rsInfo = null;
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT != null) {
			while(RS_RESULT.hasNext()) {
				PosRow row=RS_RESULT.next();
				String contentSeq = row.getAttribute("content_seq").toString();
				String title = (String)row.getAttribute("TITLE");
				String job = PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("JOB_DESC"));
				HPageContent content = new HPageContent(title, job);
				
				jobs.put(contentSeq, content);
			}
		}
		
		rsInfo = ctx.getRowSet("RS_RESULT1");
		if(rsInfo!=null && rsInfo.hasNext()) {
			PosRow row1=rsInfo.next();
			request.setAttribute("info", row1.getAttribute("sub_title"));
			request.setAttribute("content", row1.getAttribute("content_details"));
		}
	}
%>

<c:set var="resource" value="HPResource"/>
<c:set var="menu013" value="${f:text(resource, 'menu013', '', locale)}"/>

<template:tmpt title="${menu013}">
	<jsp:attribute name="sub_menu">
		<H2>${menu013}</H2>
		<UL class=s_dep02>
			<LI class="on hv">
				<A href="javascript:void(0)" onclick="navigate('./recruit.do','Recruitment-service')" class=indep3>${menu013}</A>
				<c:if test="${not empty jobs}">
					<UL class=s_dep03>
						<c:forEach items="${jobs}" varStatus="counter" var="job">
							<LI><DIV><A href="javascript:void(0)" onclick="showContent('${job.key}');">${job.value.subtitle}</A></DIV></LI>
						</c:forEach>
					</UL>
				</c:if>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu013} &gt; ${menu013}
		</DIV>
		<DIV class=hg>
			<H3>${menu013}</H3>
			<p>${info}</p>
			<IMG style="overflow: auto; float: right; margin-top: -150px;" src="img/career-icon.png">
		</DIV>
		<DIV class="con_body ci">
			<div id="hr_contact">${content}</div>
			<c:forEach items="${jobs}" var="job" varStatus="">
				<DIV  id="${job.key}" class="content_group" >${job.value.contentDetails}</DIV>
			</c:forEach>
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>
<SCRIPT type="text/javascript">
	function showContent(div_name) {

		$(".content_group").hide();
		$("#"+div_name).css("display","block");
		$("#hr_contact").css("display","none");
	}
</SCRIPT>