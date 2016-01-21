<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Collections"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.posdata.glue.dao.vo.PosRow"%>
<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="com.posdata.glue.web.control.PosWebConstants"%>
<%@page import="com.posdata.glue.context.PosContext"%>
<%@page import="com.posdata.glue.dao.vo.PosRowSet"%>
<%@page import="com.posco.ict.hp.resource.HPageContent" %>

<%
	//Get title
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	request.setAttribute("newsn000", Text.getText(resource, "newsn000", null, locale));
	for(int i=11; i<=16; i++) {
		String menuId = "menu0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(menuId, Text.getText(resource, menuId, null, locale));	
	}
	
	// Get data
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	PosRowSet RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
	
	int nPage = 0;
	Map<String, HPageContent> map=new TreeMap<String,HPageContent>(Collections.reverseOrder());
	request.setAttribute("map", map);
	request.setAttribute("totalPage", ctx.get("totalPage"));
	while(RS_RESULT.hasNext()) {
		PosRow row = RS_RESULT.next();
		HPageContent pc=new HPageContent("0"
				 						  , row.getAttribute("sub_title_1").toString()
				 						  , row.getAttribute("sub_title_2").toString()
				 						  , row.getAttribute("represent_resource").toString()
				 						  , row.getAttribute("posted_date").toString()
				 						  , row.getAttribute("content_details").toString());
		map.put(String.valueOf(row.getAttribute("content_seq")), pc); 
	}
%>

<template:tmpt title="${menu011}">
	<jsp:attribute name="sub_menu">
		<H2>${menu016}</H2>
		<UL class=s_dep02>
			<LI class=on>
				<A  href="javascript:void(0)" onclick="navigate('./news.do','News-service','NN')">${menu011}</A></LI>
			<LI>
				<A  href="javascript:void(0)" onclick="navigate('./act.do','News-service','AT')">${menu012}</A>
			</LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
	
		<DIV class="con_head biz_ref">
			<DIV class=bcs>
				<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt; ${menu016} &gt;
				${menu011}
			</DIV>
			<DIV class=hg>
				<H3>${menu011}</H3>
				<P>${newsn000}</P>
				<IMG alt="" style="overflow: auto; float: right; margin-top: -150px;" src="img/news.jpg">
			</DIV>

		</DIV>
		<!-- con_head -->
		<!-- con_body -->
		<DIV class="con_body refroom">
			<DIV class=board style="position:fix; margin-top:0;">
			<DIV class=board_bd>
				<!--// board_bd -->
				<UL class=list id="result">
					<c:forEach items="${map}" var="item" varStatus="count">
						<LI>
							<SPAN><IMG style="width:193px;height:145px;" src="${item.value.representResource }"></SPAN>
							<dl>
								<dt>
									<a href="javascript:void(0)" onclick="navigate('./newsDtl.do?search_dtl=1','News-service','NN','${item.key}')">
										${item.value.subtitle1}
									</a>
								</dt>
								<DD class=desc>${item.value.subtitle2}</DD>
								<DD class=date_news>${item.value.postedDate}</DD>
							</dl>
						</LI>	
					</c:forEach>
				</UL>
				<div id="demo_pag1"></div>
		
			</DIV>				
			<UL id=d_pageing class="pg d radio_class"></UL><!--// DeskTop pagination -->
			<UL id=m_pageing class="pg m radio_class"></UL>
			</DIV>
		</DIV>
	</jsp:attribute>
</template:tmpt>
<script type="text/javascript">

		$(function() {
			var  totPage = "${totalPage}";
			var currPage = "${param.nPage}";
			if(currPage == "") {
				currPage = 1;
			}
		
		$("#demo_pag1")
				.jui_pagination(
						{
							currentPage : currPage,
							visiblePageLinks : 5,
							totalPages : totPage,
							containerClass : 'container1',

							useSlider : true,
							sliderInsidePane : true,
							sliderClass : 'slider1',

							disableSelectionNavPane : true,

							navRowsPerPageClass : 'rows-per-page1  ui-state-default ui-corner-all',
							navGoToPageClass : 'goto-page1 ui-state-default ui-corner-all',

							onChangePage : function(event, page_num) {
								if (isNaN(page_num) || page_num <= 0) {
									alert('Invalid page' + ' (' + page_num
											+ ')');
								} else {
									var root = window.location.pathname;
									document.form.action = root +"?nPage="+page_num;
									$(form).submit();
									s_html="";
									//alert("pagep page page");
									
								}
							},
							onSetRowsPerPage : function(event, rpp) {
								if (isNaN(rpp) || rpp <= 0) {
									alert('Invalid rows per page' + ' (' + rpp
											+ ')');
								} else {
									alert('rows per page successfully changed'
											+ ' (' + rpp + ')');
									$(this).jui_pagination({
										rowsPerPage : rpp
									})
								}
							},
							onDisplay : function() {
								var showRowsInfo = $(this).jui_pagination(
										'getOption', 'showRowsInfo');
								if (showRowsInfo) {
									var prefix = $(this).jui_pagination(
											'getOption',
											'nav_rows_info_id_prefix');
									$("#" + prefix + $(this).attr("id")).text(
											'Total rows: XXX');
								}
							}
						});
		
	});
</script>