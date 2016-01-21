<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@page import="java.util.Locale"%>

<%
	// Get title
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	request.setAttribute("eleen000", Text.getText(resource, "eleen000", null, locale));
	for(int i=6; i<=15; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
	
	PosRowSet RS_RESULT = null;
	
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	String subTitle="";
	String subTitle1="";
	String subTitle2="";
	String contentDetails="";
	if(ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT!=null && RS_RESULT.count()>0) {
			PosRow row = RS_RESULT.next();
			subTitle=row.getAttribute("sub_title").toString();
			subTitle1=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("sub_title_1"));
			subTitle2=(String)row.getAttribute("sub_title_2");
			contentDetails=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details"));
		}
	}	
	
	request.setAttribute("subTitle", subTitle);
	request.setAttribute("subTitle1", subTitle1);
	request.setAttribute("subTitle2", subTitle2);
	request.setAttribute("contentDetails", contentDetails);
%>

<template:tmpt title="${menu008}">
	<jsp:attribute name="sub_menu">
		<H2>${menu015}</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${menu006}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM')">${menu007}</A>
			</LI>
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE')">${menu008}</A>
			</LI>	
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI')">${menu009}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD')">${menu010}</A>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu015} &gt; ${menu008}
		</DIV>
		<!-- con_head -->
		<DIV class=hg>
			<H3>${menu008}</H3>
			<P style="text-align: left;">${eleen000}</P>
			<IMG style="overflow: auto; float: right; margin-top: -150px;" src="img/windpower-icon.png">
		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body ci">
			${contentDetails }
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>