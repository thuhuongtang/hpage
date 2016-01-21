<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@page import="java.util.Locale"%>
<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>

<%
	//Get title
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	request.setAttribute("newsn000", Text.getText(resource, "newsn000", null, locale));
	for(int i=11; i<=16; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
	
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

<template:tmpt title="${menu011}">
	<jsp:attribute name="sub_menu">
		<H2>${menu016}</H2>
		<UL class=s_dep02>
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./news.do','News-service')">${menu011}</A></LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./act.do','hpage_contents-service','AT')">${menu012}</A>
			</LI>
		</UL>
	</jsp:attribute>
	
	<jsp:attribute name="content">
		<DIV id=content class=content>
			<DIV class="con_head biz_ref">
				<DIV class=bcs>
					<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt; ${menu016} &gt;
					${menu011}
				</DIV>
				<DIV class=hg>
					
					<DIV  id="${contentId}" class="content_group_show" ><H4 class=news_title>${subTitle1}</H4></DIV>
					<P style="max-width: 718px;">${subTitle2}</P>
					
				</DIV>
				<DIV class=hg></DIV>
				<!-- con_head -->
		
			</DIV>
			<!-- con_head -->
			<!-- con_body -->
			<DIV class="con_body ci">
				
				<DIV  id="${contentId}" class="content_group_show"  style="line-height:2"><P>${contentDetails}</P></DIV>
				
			</DIV>
		</DIV>
		<div class="scroll_top" style="display: block;">
			<a href="#"><span class="hide">top</span></a>
		</div>
	</jsp:attribute>
</template:tmpt>