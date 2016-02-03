<%@ tag language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/functions.tld" prefix="f" %>
<%@ tag import="com.posdata.glue.context.PosContext"%>
<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="sub_menu" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>${title}</TITLE>
<!-- <META charset=UTF-8> -->
<META content=IE=edge http-equiv=X-UA-Compatible>

<c:set var="resource" value="HPResource"/>

<!-- favicon -->
<LINK rel="shortcut icon" type=image/x-icon href="img/favicon.ico">
<META name=viewport
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes">
<LINK rel=stylesheet href="css/normalize.v2.1.1.css">
<LINK rel=stylesheet href="css/global.css">
<LINK rel=stylesheet href="css/common_en.css">
<LINK rel=stylesheet type=text/css href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.css">

<!-- jQuery ?? -->
<SCRIPT src="js/jquery-1.9.1.min.js"></SCRIPT>
<SCRIPT src="js/jquery-ui.min.js"></SCRIPT>
<SCRIPT src="js/jquery.ui.touch-punch.min.js"></SCRIPT>
<script src="js/md5.js"></script>
<!-- verifi_device -->
<SCRIPT src="js/verify_device.js"></SCRIPT>
<SCRIPT>
	(verify_device.detect() == 'desktop')
			|| document.write('<link rel="stylesheet" href="/css/mq.css">')
</SCRIPT>
<!--[if lt IE 9]>
<SCRIPT src="js/html5.js"></SCRIPT>

<SCRIPT src="js/selectivizr-min.js"></SCRIPT>

<LINK rel=stylesheet href="css/ie8.css"><![endif]-->
<!--[if lt IE 8]><link rel="stylesheet" href="/css/ie7_en.css"><![endif]-->
<SCRIPT src="js/en.js"></SCRIPT>
<LINK rel=stylesheet type=text/css href="css/jquery-ui.css">

<SCRIPT src="js/jquery-migrate-1.1.1.js"></SCRIPT>
<!-- MODERNIZR -->
<SCRIPT src="js/modernizr.min.js"></SCRIPT>
<SCRIPT src="js/jquery.jui_pagination.min.js"></SCRIPT>
<LINK rel=stylesheet type=text/css href="css/jquery.jui_pagination.css">

<!-- PLUGIN -->
<!-- <script src="/js/plugin.js"></script> -->
<!-- <script src="/js/plugin/jquery.radioClass.js"></script> -->
<!-- bxslider -->
<SCRIPT src="js/jquery.bxslider.min.js"></SCRIPT>
<LINK rel=stylesheet href="css/jquery.bxslider.css">
<!-- m_side -->
<LINK rel=stylesheet href="css/m_side.css">
<!-- APPLICATION -->
<!-- head include -->
<SCRIPT>

	window.onload = function () {
		if('${param.lang}'=='kr') {
			$('body,html').css("fontFamily","Malgun Gothic");
		}
		//For Admin page
		var reqTp = '${reqTp}';
		if(reqTp=='NN' || reqTp=='RC' || reqTp=='AT' || reqTp=='CI' || reqTp=='SD'){
			$("#gridEdit_NN").hide();
			$("#normalEdit").hide();			
			$("#authorityEdit").hide();
			$( "#NN_EN" ).show();
			$( "#NN_VI" ).hide();
			$( "#NN_KR" ).hide();
			$("#gridEdit_NN").css("display","block");
		} else if(reqTp != ''&&reqTp != 'AU'){
			$("#normalEdit").show();
			$("#gridEdit_NN").hide();		
			$("#authorityEdit").hide();
			
			// Set id
			$("#id_en").val("${pageContentEn.contentId}");
			$("#id_vi").val("${pageContentVn.contentId}");
			$("#id_kr").val("${pageContentKr.contentId}");
			
			// Set value for title
			$("#sub_title_en").val("${pageContentEn.subtitle1}");
			$("#sub_title_vi").val("${pageContentVn.subtitle1}");
			$("#sub_title_kr").val("${pageContentKr.subtitle1}");
			
			CKEDITOR.instances.contentEn.setData($("#${pageContentEn.contentId}").html());
			
			$( "#en" ).show();
			$( "#vi" ).hide();
			$( "#kr" ).hide();
		} else if(reqTp == 'AU'){
			$("#normalEdit").hide();
			$("#gridEdit_NN").hide();
			$("#authorityEdit").css("display","block");
			
			//set value
			$("#userId").val("${userId}");
			$("#usernm").val("${userNm}");
			//$("#passwd").val("${passWd}");
			//$("#cfmpasswd").val("${passWd}");
		} else{
			$("#normalEdit").hide();
			$("#gridEdit_NN").hide();	
			$("#authorityEdit").hide();
		}
		var liId='#menu_ul #'+'${reqTp}';
		$('#menu_ul li').eq($(liId).index()).switchClass('nothv sel','on');
	}

	// Read a page's GET URL variables and return them as an associative value.
	function gup( name, url ) {
		if (!url) url = location.href;
		name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
		var regexS = "[\\?&]"+name+"=([^&#]*)";
		var regex = new RegExp( regexS );
		var results = regex.exec( url );
		return results == null ? null : results[1];
	}
	
	function changeLang(lang) {
		var url=location.href.toString();
		
		if(url.indexOf("Dtl.do") > 0) {
			url = url.replace("Dtl","");
			url = url.replace("?search_dtl=1","");
			location.href = url;
		}
		$("#lang").val(lang);
		$('form').submit();
	}
	
	function navigate(actionName, serviceName, contentTp, contentId) {
		$("#ServiceName").val(serviceName);
		$("#content_tp").val((contentTp === undefined)? "" : contentTp);
		$("#content_id").val((contentId === undefined)? "" : contentId);
		$('form').attr('action',actionName);	
		$('form').submit();
	}
	
	function goHome(actionName, lang) {
		$("#lang").val(lang);
		$('form').attr('action',actionName);	
		$('form').submit();
	}
</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.7601.17514">
</HEAD>

<BODY>
<form name="form" id="frm" method="post" action="" >
	<input type="hidden" name="ServiceName" id="ServiceName" value="${param.ServiceName}">
	<input type="hidden" name="lang" id="lang" value="${param.lang}">
	<input type="hidden" name="edtTp" id="edtTp">
	<input type="hidden" name="content_details" id="content_details">
	<input type="hidden" name="old_sub_title" id="old_sub_title">
	<input type="hidden" name="new_sub_title" id="new_sub_title">	
	<input type="hidden" name="sub_title_1" id="sub_title_1">
	<input type="hidden" name="sub_title_2" id="sub_title_2">
	<input type="hidden" name="represent_resource" id="represent_resource">
	<input type="hidden" name="id_en" id="id_en">
	<input type="hidden" name="id_kr" id="id_kr">
	<input type="hidden" name="id_vi" id="id_vi">		
	<input type="hidden" name="userId" id="userId">	
	<input type="hidden" name="userNm" id="userNm">	
	<input type="hidden" name="userPass" id="userPass">	
	<input type="hidden" name="content_id" id="content_id" value=${param.content_id}>
	<input type="hidden" name="content_tp" id="content_tp" value=${param.content_tp}>
	<DIV id=wrap class="sub snap-content">
		<!-- s: header -->
		<!-- e:menu -->
		<DIV class=header_w>
			<DIV class=header>
				<!-- s: lang header -->
				<DIV class=topUtilMenus>
					<A class=menuItem style="font-size:14px;"
						href="javascript:void(0)" onclick="goHome('./sitemap.do','${param.lang}');">Site Map</A>

					<P class=langGroup>
						<A class="menuItem boldFont" href="javascript:void(0)" onclick="changeLang('vn');">
							<IMG class=flag	alt=Vietnam src="img/VN.gif">
						</A>
					</P>
					<P class=langGroup>
						<A class="menuItem boldFont" href="javascript:void(0)" onclick="changeLang('en');">
							<IMG class=flag	alt=English src="img/EN.gif">
						</A>
					</P>
					<P class=langGroup>
						<A class="menuItem boldFont" href="javascript:void(0)" onclick="changeLang('kr');">
							<IMG class=flag alt=Korea src="img/KR.gif">
						</A>
					</P>
				</DIV>
				<!-- e: lang header -->
				<H1 class=logo>
					<A href="javascript:void(0)" onclick="goHome('./index.do','${param.lang}');">
						<IMG alt="POSCO ICT VIETNAM" src="img/logo_top.JPG">
					</A>
				</H1>
				<!--//  head menu -->
				<DIV class=gnb>
					<UL id=gnb class="desk dep01 flt ">
					<!--	<LI class="biz on">-->
					<LI class="biz">
							<A href="javascript:void(0)" onclick="navigate('./overview.do','hpage_contents-service','OV')">${f:text(resource, 'menu000', '', locale)}</A>
							<UL class=dep02 style="font-size: 14px;">
								<LI><A href="javascript:void(0)" onclick="navigate('./overview.do','hpage_contents-service','OV')">${f:text(resource, 'menu001', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./message.do','hpage_contents-service','GD')">${f:text(resource, 'menu002', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./pglobal.do','hpage_contents-service','GP')">${f:text(resource, 'menu003', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./headquarters.do','hpage_contents-service','HQ')">${f:text(resource, 'menu004', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./ictvietnam.do','hpage_contents-service','IV')">${f:text(resource, 'menu005', '', locale)}</A></LI>
							</UL>
						</LI>
						<LI class="intro ">
							<A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${f:text(resource, 'menu015', '', locale)}</A>
							<UL class=dep02>
								<LI><A href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${f:text(resource, 'menu006', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./airportmgt.do','hpage_contents-service','AM')">${f:text(resource, 'menu007', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./elceng.do','hpage_contents-service','EE')">${f:text(resource, 'menu008', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./infra.do','hpage_contents-service','CI')">${f:text(resource, 'menu009', '', locale)}</A></LI>
								<LI><A href="javascript:void(0)" onclick="navigate('./softdev.do','hpage_contents-service','SD')">${f:text(resource, 'menu010', '', locale)}</A></LI>
							</UL>
						</LI>
						<LI class="pr ">
							<A href="javascript:void(0)" onclick="navigate('./news.do','News-service')">
								${f:text(resource, 'menu016', '', locale)}
							</A>
							<UL class=dep02>
								<LI>
									<A href="javascript:void(0)" onclick="navigate('./news.do','News-service')">
										${f:text(resource, 'menu011', '', locale)}
									</A>
								</LI>
								<LI>
									<A href="javascript:void(0)" onclick="navigate('./act.do','News-service','AT')">
										${f:text(resource, 'menu012', '', locale)}
									</A>
								</LI>
							</UL>
						</LI>
						<LI class="cs ">
							<A href="javascript:void(0)" onclick="navigate('./recruit.do','Recruitment-service')">
								${f:text(resource, 'menu013', '', locale)}
							</A>
							<UL class=dep02>
								<LI>
									<A href="javascript:void(0)" onclick="navigate('./recruit.do','Recruitment-service')">
										${f:text(resource, 'menu013', '', locale)}
									</A>
								</LI>
							</UL>
						</LI>
						<LI class="cs ">
							<A href="javascript:void(0)" onclick="navigate('./cont.do','hpage_contents-service','CT')">
								${f:text(resource, 'menu014', '', locale)}
							</A>
							<UL class=dep02>
								<LI>
									<A href="javascript:void(0)" onclick="navigate('./cont.do','hpage_contents-service','CT')">
										${f:text(resource, 'menu014', '', locale)}
									</A>
								</LI>
							</UL>
						</LI>
					</UL>
					<!--// desk -->
					<DIV class="mobile m_top_menu">
						<SPAN class=to_all><A id=open-left
							href="https://www.poscoict.co.kr/servlet/Reference?lang=en#nav-panel"><SPAN
								class=hide>menu</SPAN></A> </SPAN>
						<P class=ttl_now>
							<A href="https://www.poscoict.co.kr/servlet/Reference?lang=en#">Loading</A>
						</P>
						<UL class=to_now data-stat="open">
							<LI class=on><A
								href="https://www.poscoict.co.kr/servlet/Reference?lang=en#">Loading</A></LI>
							<LI><A
								href="https://www.poscoict.co.kr/servlet/Reference?lang=en#">Profile</A></LI>
						</UL>
					</DIV>
					<!-- mobile -->
				</DIV>
				<!--// gnb -->
			</DIV>
		</DIV>
	
		<!--// container -->
		<DIV class=container style="padding-top: 137px;">
			<!-- head include -->
			<DIV class=sidebar_w>
				<DIV class=sidebar>
					<jsp:invoke fragment="sub_menu"></jsp:invoke>
				</DIV>
			</DIV>
			<!-- sidebar_w -->
			<!-- left Menu include -->
			<DIV id=content class=content>
				
					<jsp:invoke fragment="content"></jsp:invoke>
					<!-- con_body -->
				
			</DIV>
			<div class="scroll_top" style="display: block;">
				<a href="#"><span class="hide">top</span></a>
			</div>
			
		</DIV>

		<!-- footer start -->
		<DIV id=footer style="top: 40px;">
			<div style=" vertical-align: middle;    position: relative;        top: 15px;">
				<p class="ftlink">
					<strong style="color:#c0c1c4;">
						<a href="javascript:void(0)" onclick="navigate('./overview.do','hpage_contents-service','OV')">${f:text(resource, 'menu000', '', locale)}</a> |
						<a href="javascript:void(0)" onclick="navigate('./itsbrt.do','hpage_contents-service','IB')">${f:text(resource, 'menu015', '', locale)}</a> | 
						<a href="javascript:void(0)" onclick="navigate('./recruit.do','Recruitment-service')">${f:text(resource, 'menu013', '', locale)}</a> | 
						<a href="javascript:void(0)" onclick="navigate('./cont.do','hpage_contents-service','CT')">${f:text(resource, 'menu014', '', locale)}</a> | 
						<a href="javascript:void(0)" onclick="goHome('./sitemap.do','${param.lang}');">Site Map</a>
					</strong>
				</p>
				<p style="text-align:center;width:100%;left:0px;color:#c0c1c4;padding-top: 10px;">
					POSCO ICT VIETNAM Copyright &copy; 2013				
				</p>
			</div>
		</DIV>
		<!-- footer end -->
	</DIV>
	
	<SCRIPT src="js/common.js"></SCRIPT>

	<SCRIPT src="js/mobile_menu_en.js"></SCRIPT>
	
</form>	
</BODY>

</HTML>