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
<%@ page import = "com.posdata.glue.xplatform.common.Converter" %>
<%@ page import = "com.tobesoft.xplatform.data.DataSet" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form name="form" action="login.do" method="post">
	<html>
		<title>Login</title>
		<body class="small login">
			<div id="header">
				
					<h1><a>POSCO ICT VIETNAM</a></h1>
				
			</div>
			<input type="hidden" value="Login-service" id="ServiceName" name="ServiceName">
			<div id="container">
				<div id="content" style="height: 187px;color:#515348;" >
					<div class="wrapper">
						<table class="login" style="margin-left: auto; margin-right: auto;">
						<tbody><tr>
							<td><p class="mtop0 mbottom025"><strong><label id="label_log" >Username</label></strong></p><input id="username" class="inputtext" name="username" type="text" value="<%=username%>"></td>
						</tr>
						<tr>
							<td><p class="mtop05 mbottom025"><strong><label id="label_log" >Password</label></strong></p><input id="passwd" class="inputtext" name="passwd" type="password" value="<%=passwd%>"></td>
						<tr  style="height: 30px;">
							<td>
								<c:if test="${chk == '0'}">
									<p id="p_error">
										<c:out value="Wrong account"/>
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
							<td><input class="public-button" type="submit" value="Log in" onclick="editNews()" /></td>
						</tr>
						
						</tbody></table>
					</div> <!-- wrapper -->
				</div> <!-- content -->
			</div> <!-- container -->
			<div id="img_login">
				<IMG src="img/global.png">
			</div>
			<DIV id="copyright"">
				<P>
					<IMG alt="COPYRIGHT(C) 2013 POSCO ICT VIETNAM. ALL RIGHTS RESERVED"
						style="margin-top: 10px" src="img/copyright.gif">
				</P>
			</DIV>
		</body>
	</html>
</form>