<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/WEB-INF/functions.tld" prefix="f" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>

<%
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

<c:set var="resource" value="HPResource"/>
<c:set var="menu007" value="${f:text(resource, 'menu007', '', locale)}"/>
<c:set var="menu015" value="${f:text(resource, 'menu015', '', locale)}"/>

<template:tmpt title="${menu007}">
	<jsp:attribute name="sub_menu">
		<H2>${menu015}</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB','')">${f:text(resource, 'menu006', '', locale)}</A>
			</LI>
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM','')">${menu007}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE','')">${f:text(resource, 'menu008', '', locale)}</A>
			</LI>	
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI','')">${f:text(resource, 'menu009', '', locale)}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD','')">${f:text(resource, 'menu010', '', locale)}</A>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu015} &gt; ${menu007}
		</DIV>
		<!-- con_head -->
		<DIV class=hg>
			<H3>${menu007}</H3>
			<P>${f:text(resource, 'airmn000', '', locale)}</P>
			<IMG alt="" style="overflow: auto; float: right; margin-top: -150px;" src="img/airlines-logo.jpg">
		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body ci">
			${contentDetails }
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>