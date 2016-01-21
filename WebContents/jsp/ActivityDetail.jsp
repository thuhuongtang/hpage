<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/WEB-INF/functions.tld" prefix="f" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>

<%
	PosRowSet RS_RESULT = null;
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	String contentId="";
	String subTitle1="";
	String subTitle2="";
	String contentDetails="";
	if(ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT!=null && RS_RESULT.count()>0) {
			PosRow row = RS_RESULT.next();
			contentId=row.getAttribute("content_id").toString();
			subTitle1=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("sub_title_1"));
			subTitle2=(String)row.getAttribute("sub_title_2");
			contentDetails=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details"));
		}
	}	
	
	request.setAttribute("contentId", contentId);
	request.setAttribute("subTitle1", subTitle1);
	request.setAttribute("subTitle2", subTitle2);
	request.setAttribute("contentDetails", contentDetails);
%>
<c:set var="resource" value="HPResource"/>
<c:set var="menu012" value="${f:text(resource, 'menu012', '', locale)}"/>
<c:set var="menu016" value="${f:text(resource, 'menu016', '', locale)}"/>

<template:tmpt title="${menu012}">
	<jsp:attribute name="sub_menu">
		<H2>${menu016}</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./news.do?search=1','News-service')">${f:text(resource, 'menu011', '', locale)}</A></LI>
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./act.do','News-service','AT')">${menu012}</A>
			</LI>
		</UL>
	</jsp:attribute>
	
	<jsp:attribute name="content">
		<DIV id=content class=content>
			<DIV class="con_head biz_ref">
				<DIV class=bcs>
					<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt; ${menu016} &gt;
					${menu012}
				</DIV>
				<!-- con_head -->
				<DIV class=hg>
					
					<DIV  id="${contentId}" class="content_group_show" >
						<H4 class=news_title>${subTitle1}</H4>
					</DIV>
					<P style="max-width: 718px;">${subTitle2}</P>
					
				</DIV>
			</DIV>
			<!-- con_head -->
			<!-- con_body -->
			<DIV class="con_body ci">
				
				<DIV  id="${contentId}" class="content_group_show"  style="line-height:2">
					<P>${contentDetails}</P>
				</DIV>
				
			</DIV>
		</DIV>
		<div class="scroll_top" style="display: block;">
			<a href="#"><span class="hide">top</span></a>
		</div>
	</jsp:attribute>
</template:tmpt>