<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML lang=en class=no-js>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<META charset=UTF-8>
<META content=IE=edge http-equiv=X-UA-Compatible>
<LINK rel="shortcut icon" type=image/x-icon href="/images/favicon.ico">
<TITLE>POSCO ICT-VIETNAM</TITLE>
<LINK rel=stylesheet type=text/css href="../css/default.css">
<LINK rel=stylesheet href="../css/global.css">
<LINK rel=stylesheet href="../css/common_en.css">
<LINK rel=stylesheet href="../css/normalize.v2.1.1.css">
<LINK rel=stylesheet href="../css/jquery.bxslider.css">
<LINK rel=stylesheet href="../css/m_side.css">
<SCRIPT src="../js/verify_device.js"></SCRIPT>
<SCRIPT src="../js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT src="../js/jquery.bxslider.min.js"></SCRIPT>
<SCRIPT src="../js/common.js"></SCRIPT>
<SCRIPT src="../js/pageing.js"></SCRIPT>
<SCRIPT>
	var doView = function(seq) {
		var f = document.base_form;
		f.seq.value = seq;
		f.mode.value = "view";
		f.submit();
	}

	var searchFindVal = function() {
		var f = document.base_form;
		f.mode.value = 'list';
		f.page.value = '1';
		f.submit();
	}

	$(document).ready(function() {
		paging($("#page").val(), 47, 5, 5);

		$('#find_val').live('keypress', function(e) {
			if (e.which == 13) {
				searchFindVal();
			}
		});
	});
</SCRIPT>
<SCRIPT>
	(verify_device.detect() == 'desktop')
			|| document.write('<link rel="stylesheet" href="/css/mq.css">')
</SCRIPT>
<SCRIPT>
	window.jQuery
			|| document.write('<script src="/js/libs/jquery-1.9.1.min.js">')
</SCRIPT>
<SCRIPT src="../js/jquery-migrate-1.1.1.js"></SCRIPT>
<SCRIPT src="../js/modernizr.min.js"></SCRIPT>
<SCRIPT>
	window.Modernizr
			|| document.write('<script src="/js/libs/modernizr.min.js">')
</SCRIPT>

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
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
</head>
<body>
	<DIV id=wrap class="sub snap-content">
		<DIV class=header_w>
			<DIV class=header>
				<!-- s: lang header -->
				<DIV class=topUtilMenus>
					<A class=menuItem href="http://www.poscoict.co.kr/">POSCO ICT </A>
					<H4 class=menuItem>&nbsp;|&nbsp;</H4>
					<A class=menuItem
						href="http://localhost:9090/HPage/jsp/SiteMap_en.jsp">SITEMAP</A>
					<P class=langGroup>
						<A class="menuItem boldFont"
							href="http://localhost:9000/HomePage/jsp/index_kr.jsp"><IMG
							class=flag alt=Korea src="../css/img/KR.png"></A>
					</P>
					<P class=langGroup>
						<A class="menuItem boldFont"
							href="http://www.poscojapan.co.jp/jpn/"><IMG class=flag
							alt=${pageContext.request.contextPath}/ictvietnam.dolish src="../css/img/US.gif"></A>
					</P>
					<P class=langGroup>
						<A class="menuItem boldFont"
							href="http://www.poscojapan.co.jp/jpn/"><IMG class=flag
							alt=${pageContext.request.contextPath}/ictvietnam.dolish src="../css/img/VN.gif"></A>
					</P>
				</DIV>
				<!-- e: lang header -->
				<H1 class=logo>
					<A href="http://localhost:9001/HomePage"><IMG
						alt="POSCO ICT VIETNAM" src="../css/img/logo_top.JPG"></A>
				</H1>
				<!--//  head menu -->
				<DIV class=gnb>
					<UL id=gnb class="desk dep01 flt ">
						<LI class="biz on"><A
							href="http://localhost:9001/HomePage/jsp/Overview_en.jsp">Company</A>
							<UL class=dep02 style="font-size: 14px;">
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Overview_en.jsp">Overview</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/History_en.jsp">History</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/GDMessage_en.jsp">G.D's
										message</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Vision_en.jsp">Vision</A></LI>
							</UL> <!--// 사업영역 --></LI>
						<LI class="intro "><A
							href="http://localhost:9001/HomePage/jsp/ITS&BRT_en.jsp">Technology</A>
							<UL class=dep02>
								<LI class="hv"><A
									href="http://localhost:9001/HomePage/jsp/ITS&BRT_en.jsp">ITS
										& BRT</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Software_en.jsp">S/W
										Development</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/AirportManagement_en.jsp">Airport
										Management</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Electrical${pageContext.request.contextPath}/ictvietnam.doineering_en.jsp">Electrical
										${pageContext.request.contextPath}/ictvietnam.doineering</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Infrastructure_en.jsp">Communication
										Infrastructure</A></LI>
							</UL> <!--// 기업소개 --></LI>
						<LI class="pr "><A
							href="http://localhost:9001/HomePage/jsp/News_Notices_en.jsp">PR</A>
							<UL class=dep02>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/News_Notices_en.jsp">News
										& Notices</A></LI>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/CIGuide_en.jsp">CI
										Guide</A></LI>
							</UL> <!--// PR센터 --></LI>
						<LI class="cs "><A
							href="http://localhost:9001/HomePage/jsp/Recruitment_en.jsp">Recruitment</A>
							<UL class=dep02>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Recruitment_en.jsp">Recruitment</A></LI>
							</UL></LI>
						<LI class="cs "><A
							href="http://localhost:9001/HomePage/jsp/Contact_en.jsp">Contact</A>
							<UL class=dep02>
								<LI><A
									href="http://localhost:9001/HomePage/jsp/Contact_en.jsp">Contact</A></LI>
							</UL></LI>
					</UL>
					<!--// desk -->

					<!-- mobile -->
				</DIV>
			</DIV>
		</DIV>
		<DIV class=container style="padding-top: 137px;">
			<!-- head include -->
			<DIV class=sidebar_w>
				<DIV class=sidebar>
					<H2>Contact</H2>
					<UL class=s_dep02>
						<LI class=on><A
							href="https://www.poscoict.co.kr/business/solution01_en.jsp">Contact</A></LI>
					</UL>
				</DIV>
			</DIV>
			<!-- sidebar_w -->
			<DIV id=content class=content>
				<DIV class="con_head biz_ref">
					<DIV class=bcs>
						<SPAN class=home><SPAN class=hide>home</SPAN></SPAN> &gt; Contact
						&gt; Contact
					</DIV>
					<DIV class=hg>
						<H3>Contact</H3>
						<P></P>
					</DIV>
				</DIV>
				<div id="map-canvas" style="height: 300px; width: 500px"></div>
				<div class="scroll_top" style="display: block;">
					<a href="#"><span class="hide">top</span></a>
				</div>
				<!-- con_head -->
			</DIV>
		</DIV>
	</DIV>
	<DIV id=footer style="margin-top: 100px;">
		<P class=logo>
			<IMG alt="posco ict vietnam" src="../css/img/logo_bottom.gif">
		</P>
		<P class=copyright>
			<IMG alt="COPYRIGHT(C) 2013 POSCO ICT VIETNAM. ALL RIGHTS RESERVED"
				style="margin-top: 10px" src="../css/img/copyright.gif">
		</P>
	</DIV>
	<SCRIPT>
			var doView = function(seq) {
				var f = document.base_form;
				f.seq.value = seq;
				f.mode.value = "view";
				f.submit();
			}

			var searchFindVal = function() {
				var f = document.base_form;
				f.mode.value = 'list';
				f.page.value = '1';
				f.submit();
			}

			$(document).ready(function() {
				paging($("#page").val(), 47, 5, 5);

				$('#find_val').live('keypress', function(e) {
					if (e.which == 13) {
						searchFindVal();
					}
				});
			});
		</SCRIPT>
</body>
</html>