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
<c:set var="menu014" value="${f:text(resource, 'menu014', '', locale)}"/>

<template:tmpt title="${menu014}">
	<jsp:attribute name="sub_menu">
		<H2>${menu014}</H2>
		<UL class=s_dep02>					
			<LI class=on>
				<A href="javascript:void(0)" onclick="navigate('./cont.do','hpage_contents-service','CT')">${menu014}</A></LI>
		</UL>
	</jsp:attribute>
	<jsp:attribute name="content">
		<DIV class="con_head biz_ref" style="height: 346px;">
			<DIV class=bcs>
				<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt;
				${menu014} &gt; ${menu014}
			</DIV>
			<DIV class=hg>
				<H3>${menu014}</H3>
				<P>${f:text(resource, 'conta000', '', locale)}</P>
				<IMG style="overflow: auto; float: right; margin-top: -150px;" src="img/contact.jpg">
			</DIV>
			<!-- con_head -->
			<DIV id="div_content" class="con_body ci">
				${contentDetails}
			</DIV>
		</DIV>
		<div id="map-canvas" style="height: 300px; width: 718px"></div>
	</jsp:attribute>
</template:tmpt>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	var map;
	function initialize() {
		var mapOptions = {
			zoom : 17,
			center : new google.maps.LatLng(10.781253, 106.698668),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);

		var infoWindow = new google.maps.InfoWindow;

		var onMarkerClick = function() {
			var marker = this;
			var latLng = marker.getPosition();
			infoWindow.setContent('<p>Posco ICT-Vietnam 604A 6 floor</p>');
			infoWindow.open(map, marker);
		};
		google.maps.event.addListener(map, 'click', function() {
			infoWindow.close();
		});

		var marker1 = new google.maps.Marker({
			map : map,
			position : new google.maps.LatLng(10.781253, 106.698668)
		});

		google.maps.event.addListener(marker1, 'click', onMarkerClick);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>