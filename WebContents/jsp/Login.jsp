<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ckeditor.CKEditorConfig"%>
<%@ page import="com.ckeditor.EventHandler"%>
<%@ page import="com.ckeditor.GlobalEventHandler"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page import="com.posdata.glue.util.log.PosLogFactory"%>
<%@ page import="com.posdata.glue.util.log.PosLog"%>
<%@ page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@ page import="com.posdata.glue.context.PosContext" %>
<%@ page import = "com.posdata.glue.dao.vo.*" %>
<%@ page import = "com.posdata.glue.web.control.PosWebConstants" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRowSet" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRow" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*" %>
<%
	String value = "My first <strong>CKEditor</strong> Java tag";
	String no="";
	String username="";
	String passwd="";
	PosRowSet RS_RESULT = null;
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("width", "900");
	settings.addConfigValue("language", "${pageContext.request.contextPath}/ictvietnam.dolish");
	settings.addConfigValue("basicEntities",false);
	settings.addConfigValue("entities_latin",false);
	//settings.addConfigValue("toolbar","[{name: 'document', items: ['Source', '-', 'NewPage']},'/',{name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline' ]},{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },]");
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	PosLog logger = PosLogFactory.getLogger(String.class);
	if (ctx != null) {
		RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
		if(RS_RESULT != null) {
			while(RS_RESULT.hasNext()) {
				PosRow row=RS_RESULT.next();
				String chk = String.valueOf(row.getAttribute("CHK"));
				request.setAttribute("chk",chk);
				logger.logInfo("chk : "+chk);
				if (chk.equals("1")){
					logger.logInfo("Login success");
					HttpSession sessions = request.getSession();
					Map sessionUserData;
					sessionUserData = new HashMap<String, String>();
					sessionUserData.put("chk", chk);
					sessionUserData.put("username", username);
					sessions.setAttribute("SessionUserData", sessionUserData);
				}else{
					logger.logInfo("Login fail");
				}
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Login</title>
		<LINK rel=stylesheet href="css/login.css">
		<LINK rel="shortcut icon" type=image/x-icon href="img/favicon.ico">
		<script src="js/md5.js"></script>
		<SCRIPT src="js/jquery-1.9.1.min.js"></SCRIPT>
		<script type="text/javascript">
			function editNews() {
				//encrypt password
				var passhash = CryptoJS.MD5($("#passwd").val());
				$("#passwd").val(passhash);	
			}
		</script>
		<SCRIPT>
			window.onload = function () {
				if('${chk}'==""){
					$("#lg_table").css("padding-top","42px");
				}else{
					$("#lg_table").css("padding-top","25px");
				}
			}
		</script>
	</head>
	<body class="small login">
		<form name="form" action="login.do" method="post">			
			<input type="hidden" value="Login-service" id="ServiceName" name="ServiceName">
				<div class="div_1">
				</div>
				<div class="div_2">
					<h1 class="h1_wel"><a>WELCOME</a></h1>
				</div>
				<div class="div_3">
					<div style="div_3_ct">
						<table id="lg_table" class="login" style="margin-left: auto; margin-right: auto;>
							<tbody>
								<tr  style="height: 16px;">
									<td>
										<c:if test="${chk == '0'}">
											<p id="p_error">
												<c:out value="Authentication denied"/>
											</p>
										</c:if>
										<c:if test="${chk == '1'}">
										<%
										// New location to be redirected
									   String site = new String("./admin.do");
									   response.setStatus(response.SC_MOVED_TEMPORARILY);
									   response.setHeader("Location", site); 
										%>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<label class="lbl_item">Username</label>
										<input id="username" class="inputtext" name="username" type="text" value="<%=username%>">
									</td>
								</tr>
								<tr>
									<td>
										<label class="lbl_item">Password&nbsp;</label>
										<input id="passwd" class="inputtext" name="passwd" type="password" value="<%=passwd%>">
									</td>
								<tr>
									<td><input class="public-button" type="submit" value="Log in" onclick="editNews()" /></td>
								</tr>
							</tbody>
						</table>
					</div>					
				</div>
				<div class="div_4">
					<label class="lbl_slogan">Be yourself - We will create tomorrow together - POSCO ICT Viet Nam</label>
				</div>
			<!--
			<div id="img_login">
				<IMG src="img/global.png">
			</div>
			-->
		</form>
	</body>
</html>