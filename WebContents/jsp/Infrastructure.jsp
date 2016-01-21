<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.posco.ict.hp.resource.HPageContent"%>
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
	request.setAttribute("comin000", Text.getText(resource, "comin000", null, locale));
	for(int i=6; i<=15; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
	
	PosRowSet RS_RESULT = null;
	
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	HPageContent comInfra;
	
	if(ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT!=null && RS_RESULT.count()>0) {
			PosRow row = RS_RESULT.next();
			int contentId = Integer.valueOf(row.getAttribute("content_id").toString());
			String subTitle=row.getAttribute("sub_title").toString();
			String subTitle1=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("sub_title_1"));
			String subTitle2=(String)row.getAttribute("sub_title_2");
			String contentDetails=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details"));
			
			comInfra = new HPageContent(contentId, subTitle, subTitle1, subTitle2, contentDetails);
			request.setAttribute("comInfra", comInfra);
			
			// Get projects
			Map<String, HPageContent> pros = new TreeMap<String, HPageContent>();
			while(RS_RESULT.hasNext()) {
				row = RS_RESULT.next();
				contentId = Integer.valueOf(row.getAttribute("content_id").toString());
				subTitle1 = row.getAttribute("sub_title_1").toString();
				HPageContent cont = new HPageContent(contentId, subTitle1, "");
				pros.put(row.getAttribute("content_seq").toString(), cont);
			}
			request.setAttribute("pros", pros);
		}
	}	
	
%>

<template:tmpt title="${menu009}">
	<jsp:attribute name="sub_menu">
		<H2>${menu015}</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB','')">${menu006}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM','')">${menu007}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE','')">${menu008}</A>
			</LI>	
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI','')">${menu009}</A>
				<UL class=s_dep03>
					<c:forEach items="${pros}" varStatus="counter" var="pro">
						<LI>
							<DIV>
								<A href="javascript:void(0)" onclick="navigate('./project.do?pdtl=1','hpage_contents-service','CI','${pro.key}')">
									${pro.value.subtitle1}
								</A>
							</DIV>
						</LI>
					</c:forEach>
				</UL>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD','')">${menu010}</A>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu015} &gt; ${menu009}
		</DIV>
		<!-- con_head -->
		<DIV class=hg>
			<H3>${menu009}</H3>
			<P style="text-align: left;">${comin000}</P>
			<IMG alt="posco ict vietnam" style="overflow: auto; float: right;margin-top: -150px;" src="img/infra.jpeg">
		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body ci">
			${comInfra.contentDetails }
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>