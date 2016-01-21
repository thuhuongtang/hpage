<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>

<%
	// Get title
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	request.setAttribute("gdmsg000", Text.getText(resource, "gdmsg000", null, locale));
	for(int i=0; i<=5; i++) {
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

<template:tmpt title="${menu002 }">
	<jsp:attribute name="sub_menu">
		<H2>${menu000 }</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./overview.do','hpage_contents-service','OV')">
					${menu001 }
				</A>
			</LI>
			<LI class=on>
				<A class=indep3 href="javascript:void(0)" onclick="navigate('./message.do','hpage_contents-service','GD')">
					${menu002 }
				</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./pglobal.do','hpage_contents-service','GP')">
					${menu003 }
				</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./headquarters.do','hpage_contents-service','HQ')">
					${menu004 }
				</A>
			</LI>	
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./ictvietnam.do','hpage_contents-service','IV')">
					${menu005 }
				</A>
			</LI>				
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu000 } &gt; ${menu002 }
		</DIV>
		<!-- con_head -->
		<DIV class=hg>
			<H3>${menu002 }</H3>
			<P>${gdmsg000 }</P>
			<IMG alt="posco ict vietnam" style="overflow: auto; float: right;margin-top: -150px;" src="img/manager.jpg">
		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body ci">
			${contentDetails }
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>