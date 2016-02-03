<%@page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@page import="java.util.Locale"%>
<%@page import="com.posco.ict.hp.resource.Text"%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%
	String resource = "HPResource";
	Locale locale = (Locale)request.getAttribute("locale");
	
	for(int i=0; i<=15; i++) {
		String indexId = "index0" + PictvnHpStringUtil.lpad(i + "", "0", 2);
		request.setAttribute(indexId, Text.getText(resource, indexId, null, locale));	
	}
	
 %>

<template:tmpt title="POSCO ICT VIETNAM">
	<jsp:attribute name="sub_menu">
	</jsp:attribute>
	<jsp:attribute name="content">
	<DIV class=container1 style="margin-top: -40px;"></DIV>
	<DIV id=content style ="margin-left: -40px;width:135%;">
		<DIV>
			<UL class="bxslider">
			  <li><img style="width: 964px; height: 500px;" src="img/main_slide1.jpg"/>
				  <div class="geraet-box"style="padding: 65px;">
					<h1 style="font-size:40px;color:white;font-weight:bold;text-shadow: 1px 1px 2px black, 0 0 15px lightgray, 0 0 5px lightgray;">${index003}<br/><br/><br/></h1>
					<h1 style="font-size:30px;color:white;text-shadow: 1px 1px 2px black, 0 0 25px lightgray, 0 0 5px lightgray;">${index005}</h1>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h1 style="font-size:15px;font-style :italic;font-weight:bold;color:#1B5980;text-align:right;margin-right:-200px;">${index006}</h1>
					<h1 style="font-size:15px;font-style :italic;font-weight:bold;color:#1B5980;text-align:right;margin-right:-200px;">${index007}</h1>
					<h1 style="font-size:15px;font-style :italic;font-weight:bold;color:#1B5980;text-align:right;margin-right:-200px;">${index008}</h1>
				  </div>
			  </li>
			  <li><img style="width: 100%; height: 500px;" src="img/main_slide2.jpg"/>
				  <div class="geraet-box" style="padding: 85px;">
					<h1 style="font-size:35px;color:gray;">${index009}<br/><br/><br/></h1>
					<h1 style="font-size:60px;color:gray;">${index010}</h1><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h1 style="font-size:20px;color:gray;font-style :italic;margin-right:-200px;text-align:right;">${index011}</h1>
				  </div>
			  </li>
			  <li><img style="width: 100%; height: 500px;" src="img/main_slide3.jpg"/>
				  <div class="geraet-box" style="padding:55px;">
					<h1 style="font-size:40px;color:white;">${index012}</h1><br/><br/>
					<h1 style="font-size:30px;color:white;">${index013}</h1><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h1 style="font-size:15px;font-style :italic;color:white;text-shadow: 1px 1px 2px black, 0 0 15px lightgray, 0 0 5px lightgray;">${index014}</h1>
					<h1 style="font-size:15px;font-style :italic;color:white;text-shadow: 1px 1px 2px black, 0 0 15px lightgray, 0 0 5px lightgray;">${index015}</h1>
				  </div>
			  </li>
			</UL>
		</DIV>
		<!-- add new banner -->
		<DIV class=art-content-layout>
			<DIV class=art-content-layout-row>
				
				<DIV
					style="color: #808080; font-size: 26px; font-style: normal; font-weight: bold; margin-top: 200px;"
					class="art-layout-cell layout-item-3">
					<H3 style="margin-top: 15px;text-align:center;">Smart Transport</H3>
					<P style="TEXT-ALIGN: center; margin-top: 15px;">
						<IMG alt="" src="img/global-navigation.jpg" width=140 height=140>
					</P>
					<H5>
						<SPAN style="LINE-HEIGHT: 19px; COLOR: rgb(135, 135, 135); FONT-WEIGHT: normal; FONT-SIZE: 12px;">
							${index001}
						</SPAN><BR>
					</H5>
					<P>
						<A class=art-button href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB','')">
							${index004}
						</A>
						&nbsp;
					</P>
				</DIV>
				<DIV
					style="color: #808080; font-size: 26px; font-style: normal; font-weight: bold; margin-top: 200px;"
					class="art-layout-cell layout-item-3">
					<H3 style="margin-top: 15px;text-align:center;">Smart Infrastructure</H3>
					<P style="TEXT-ALIGN: center; margin-top: 15px;">
						<IMG alt="" src="img/wireless_building.jpg" width=140 height=140><BR>
					</P>
					<H5>
						<SPAN style="LINE-HEIGHT: 19px; COLOR: rgb(135, 135, 135); FONT-WEIGHT: normal; FONT-SIZE: 12px;">
							${index002}
						</SPAN><BR>
					</H5>
					<P>
						<A class=art-button href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI','')">
							${index004}
						</A>
						&nbsp;
					</P>
				</DIV>
				<DIV
					style="color: #808080; font-size: 26px; font-style: normal; font-weight: bold; margin-top: 200px;"
					class="art-layout-cell layout-item-3">
					<H3 style="margin-top: 15px;text-align:center;">Smart Factory</H3>
					<P style="TEXT-ALIGN: center; margin-top: 15px;">
						<IMG alt="" src="img/cloud_computing.jpg" width=140 height=140><BR>
					</P>
					<P>
						<H5>
						<SPAN style="LINE-HEIGHT: 19px; COLOR: rgb(135, 135, 135); FONT-WEIGHT: normal; FONT-SIZE: 12px;">
							${index000}
						</SPAN><BR>
					</H5>
					<P> 
						<A class=art-button href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD','')">
							${index004}
						</A>
						&nbsp;
					</P>
				</DIV>
			</DIV>
		</DIV>
		<!-- e: main slide banner -->
	</DIV>	
	</jsp:attribute>
</template:tmpt>

<SCRIPT type=text/javascript>
	$(document)
	.ready(
			function() {
				$('.bxslider').bxSlider({
					auto: true,
					autoControls: false,
					adaptiveHeight: false,
					captions: false
				 }
				);
			}); // ready
</SCRIPT>
