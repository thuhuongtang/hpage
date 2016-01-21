<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@page import="java.util.Locale"%>

<%
	// Get title
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	request.setAttribute("sitemap0", Text.getText(resource, "sitemap0", null, locale));
	for(int i=0; i<=16; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
%>

<template:tmpt title="Site Map">
	<jsp:attribute name="sub_menu">
		<H2>Site Map</H2>
		<UL class=s_dep02>
			<LI class=on>
				<A href="javascript:void(0)" onclick="goHome('./sitemap.do','${param.lang}');">Site Map</A>
			</LI>				
		</UL>
	</jsp:attribute>
	
	<jsp:attribute name="content">
		<DIV class="con_head biz_ref">
			<DIV class=bcs>
				<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt; Site Map
			</DIV>
			<DIV class=hg>
				<H3>Site map</H3>
				<P>${sitemap0}</P>
				<IMG alt="posco ict vietnam" style="overflow: auto; float: right;margin-top: -150px;" src="img/sitemap.png">
			</DIV>
			<!-- con_head -->
			
			<DIV style="margin-top: 20px;">
				<P class=p_sm>${menu000}</P>
				<ul class=ul_sm>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./overview.do','hpage_contents-service','OV')">${menu001}</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./message.do','hpage_contents-service','GD')">${menu002}</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./pglobal.do','hpage_contents-service','GP')">${menu003}</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./headquarters.do','hpage_contents-service','HQ')">${menu004}</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./ictvietnam.do','hpage_contents-service','IV')">${menu005}</A></p>
					</li>
				</ul>
				<P class=p_sm>${menu015 }</P>
				<ul class=ul_sm>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${menu006}</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM')">${menu007 }</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE')">${menu008 }</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI')">${menu009 }</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD')">${menu010 }</A></p>
					</li>
				</ul>
				<P class=p_sm>${menu016 }</P>
				<ul class=ul_sm>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./news.do','News-service')">${menu011 }</A></p>
					</li>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./act.do','News-service','AT')">${menu012 }</A></p>
					</li>
				</ul>
				<P class=p_sm>${menu013 }</P>
				<ul class=ul_sm>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./recruit.do','Recruitment-service')">${menu013 }</A></p>
					</li>
				</ul>
				<P class=p_sm>${menu014 }</P>
				<ul>
					<li class=li_sm>
						<p><A href="javascript:void(0)" onclick="navigate('./cont.do','hpage_contents-service','CT')">${menu014 }</A></p>
					</li>
				</ul>
			</DIV>			
		</DIV>
	</jsp:attribute>
</template:tmpt>