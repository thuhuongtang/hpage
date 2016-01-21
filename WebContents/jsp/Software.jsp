<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.TreeMap"%>
<%@page import="com.posco.ict.hp.resource.HPageContent"%>
<%@page import="java.util.Map"%>
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
	request.setAttribute("softw000", Text.getText(resource, "softw000", null, locale));
	for(int i=6; i<=15; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
	
	// Get data
	PosRowSet RS_RESULT = null;
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	Map<String, HPageContent> map=new TreeMap<String, HPageContent>();
	
	if(ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT!=null && RS_RESULT.count()>0) {
			while(RS_RESULT.hasNext()) {
				PosRow row = RS_RESULT.next();
				int contentId = Integer.valueOf(row.getAttribute("content_seq").toString());
				String subTitle1=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("sub_title_1"));
				String contentDetails=PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details"));
				HPageContent content=new HPageContent(contentId,subTitle1,contentDetails);
				map.put(String.valueOf(contentId), content);
			}
		}
	}
	request.setAttribute("map", map);
%>

<template:tmpt title="${menu010}">
	<jsp:attribute name="sub_menu">
		<H2>${menu015}</H2>
		<UL class=s_dep02>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${menu006}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM')">${menu007}</A>
			</LI>
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE')">${menu008}</A>
			</LI>	
			<LI>
				<A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI')">${menu009}</A>
			</LI>
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD')">${menu010}</A>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class="con_head biz_ref">
		<DIV class=bcs>
			<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
			${menu015} &gt; ${menu010}
		</DIV>
		<!-- con_head -->
		<DIV class=hg>
			<H3>${menu010}</H3>
			<P>${softw000}</P>
			<IMG style="overflow: auto; float: right; margin-top: -150px;" src="img/software-ico.png">
		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body ci">
			<input type="hidden" name="id_img" id="id_img">	
			<c:forEach items="${map}" varStatus="counter" var="item">
				<LI>
					<DIV style="padding-bottom:8px;">
						<p class="con_desc">
							<A href="javascript:void(0)" onclick="showContent('${item.key}');" >
								<strong style="color: #00457c; font-size: 18px;">
									<i id="i${item.key}" class="fa fa-arrow-circle-right" style="font-size: 16px;"></i>&nbsp; ${item.value.subtitle1}
								</strong>
							</A>
						</p>
					</DIV>
				</LI>
				<DIV  id="${item.key}" class="content_group" >${item.value.contentDetails}</DIV>
			</c:forEach>
		</DIV>
	</DIV>
	</jsp:attribute>
</template:tmpt>
<SCRIPT type="text/javascript">
	function showContent(div_id) {
		var i_id = "#i"+div_id;
		var classTp = $(i_id).attr("class");
		
		if(classTp.indexOf("right") > -1) { // expand
			$(i_id).switchClass("fa-arrow-circle-right","fa-arrow-circle-down");
			$("#"+div_id).css("display","block");
		
		} else { // collapse
			$(i_id).switchClass("fa-arrow-circle-down","fa-arrow-circle-right");
			$("#"+div_id).css("display","none");
		}
	}
</SCRIPT>