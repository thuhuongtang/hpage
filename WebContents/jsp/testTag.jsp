<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>

<template:tmpt title="ssss">
<jsp:attribute name="sub_menu">
<H2>Company</H2>
				<UL class=s_dep02>
					<LI class=on><A class=indep3
						href="http://localhost:9090/HPage/jsp/Overview_en.jsp">Overview</A></LI>
					<LI><A
						href="http://localhost:9090/HPage/jsp/History_en.jsp#">History	</A></LI>
					<LI><A onclick="location.href='/jsp/GDmessage_en.jsp'"
						href="http://localhost:9090/HPage/jsp/GDmessage_en.jsp#">G.D's Message</A></LI>
					<LI><A
						onclick="location.href='jsp/Vision_en.jsp#'"
						href="http://localhost:9090/HPage/jsp/Vision_en.jsp#">Vision</A></LI>					
				</UL>
				</jsp:attribute>
	<jsp:attribute name="content">
		<h1>this is a specical content</h1>
	</jsp:attribute>
</template:tmpt>