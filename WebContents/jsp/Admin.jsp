<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.ckeditor.CKEditorConfig"%>
<%@ page import="com.ckeditor.EventHandler"%>
<%@ page import="com.ckeditor.GlobalEventHandler"%>
<%@ page import="com.posdata.glue.util.log.PosLogFactory"%>
<%@ page import="com.posdata.glue.util.log.PosLog"%>
<%@ page import="com.posco.ict.hp.common.util.PictvnHpStringUtil"%>
<%@ page import="com.posdata.glue.context.PosContext" %>
<%@ page import = "com.posdata.glue.dao.vo.*" %>
<%@ page import = "com.posdata.glue.web.control.PosWebConstants" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRowSet" %>
<%@ page import = "com.posdata.glue.dao.vo.PosRow" %>
<%@ page import = "com.posdata.glue.xplatform.common.Converter" %>
<%@ page import = "com.tobesoft.xplatform.data.DataSet" %>
<%@ page import="java.io.*" %>
<%@ page import="com.posco.ict.hp.resource.HPageContent"%>

<%
	String reqTp="";
	String subtitle1 = "";
	String subtitle2 = "";
	String contentdetails = "";
	String represent_resource = "";
	String contentid = "";
	PosRowSet RS_RESULT = null;
	PosRowSet RS_RESULT_EN = null;
	PosRowSet RS_RESULT_VI = null;
	PosRowSet RS_RESULT_KR = null;
	
	// CKEditor settings1
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("width", "1055");
	settings.addConfigValue("height", "337");
	settings.addConfigValue("basicEntities",false);
	settings.addConfigValue("entities_latin",false);
	request.setAttribute("settings", settings);
	
	// CKEditor settings2
	CKEditorConfig settings2 = new CKEditorConfig();
	settings2.addConfigValue("width", "895");
	settings2.addConfigValue("basicEntities",false);
	settings2.addConfigValue("entities_latin",false);
	request.setAttribute("settings2", settings2);
	
	PosContext ctx = (PosContext) request.getAttribute(PosWebConstants.CONTEXT);
	PosLog logger = PosLogFactory.getLogger(String.class);
	HttpSession sessions = request.getSession(false);
	try{
		if(sessions!=null){
			HashMap chk = (HashMap)sessions.getAttribute("SessionUserData");
			if (chk!=null&& !chk.isEmpty()){
				String sChk = (String)chk.get("chk");
				if (!sChk.equals("1")){
					logger.logInfo("Checking session fail");
					String site = new String("./login.do");
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", site); 
				}else{
					logger.logInfo("Checking session success");
				}
			}else{
				logger.logInfo("Sessions is null");
				String site = new String("./login.do");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site); 
			}
		}else{
			String site = new String("./login.do");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
	}
	}catch(Exception e){
		String site = new String("./login.do");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site); 
	}
	
	// Save request type
	reqTp = (String)request.getParameter("reqTp");
	request.setAttribute("reqTp", reqTp);
	logger.logInfo("reqTp : "+reqTp);
	
	Map<String,String> contents=new HashMap<String,String>(); 
	Map<String, HPageContent> pageContentsEn = new TreeMap<String,HPageContent>();
	Map<String, HPageContent> pageContentsKr = new TreeMap<String,HPageContent>();
	Map<String, HPageContent> pageContentsVn = new TreeMap<String,HPageContent>();
	
	request.setAttribute("contents", contents);
	request.setAttribute("pageContentsEn", pageContentsEn);
	request.setAttribute("pageContentsKr", pageContentsKr);
	request.setAttribute("pageContentsVn", pageContentsVn);
	
	if (ctx != null) {
		if(!reqTp.equals("NN") && !reqTp.equals("RC") && !reqTp.equals("AT") && !reqTp.equals("CI") && !reqTp.equals("SD")&& !reqTp.equals("AU")){
			RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
			if(RS_RESULT != null) {
				while(RS_RESULT.hasNext()) {
					PosRow row=RS_RESULT.next();
					
					int idEn 	= Integer.valueOf((String)row.getAttribute("id_en"));
					int idVi 	= Integer.valueOf((String)row.getAttribute("id_vn"));
					int idKr 	= Integer.valueOf((String)row.getAttribute("id_kr"));
					
					String subTitleVn 	= (String)row.getAttribute("sub_title_vn");
					String subTitleKr 	= (String)row.getAttribute("sub_title_kr");
					String subTitleEn 	= (String)row.getAttribute("sub_title_en");
					
					String contentEn 	= PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details_en"));
					String contentVi 	= PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details_vn"));
					String contentKr 	= PictvnHpStringUtil.unescapeHtml3((String)row.getAttribute("content_details_kr"));
					
					HPageContent pageContentEn = new HPageContent(idEn, subTitleEn,contentEn);
					HPageContent pageContentVn = new HPageContent(idVi, subTitleVn,contentVi);
					HPageContent pageContentKr = new HPageContent(idKr, subTitleKr,contentKr);
					
					request.setAttribute("pageContentEn", pageContentEn);
					request.setAttribute("pageContentVn", pageContentVn);
					request.setAttribute("pageContentKr", pageContentKr);
					
					contents.put(String.valueOf(idEn), contentEn);
					contents.put(String.valueOf(idVi), contentVi);
					contents.put(String.valueOf(idKr), contentKr);
					logger.logInfo("idEn = " + idEn);
					logger.logInfo("idVn = " + idVi);
					
				}
			}
		}else if(reqTp.equals("AU")){
			RS_RESULT = (PosRowSet) ctx.getRowSet("RS_RESULT");
			if(RS_RESULT != null) {
				while(RS_RESULT.hasNext()) {
					PosRow row=RS_RESULT.next();
					logger.logInfo(row.getAttributes());
					int userId 	= Integer.valueOf(row.getAttribute("userno").toString());
					String userNm 	= (String)row.getAttribute("usernm");
					String passWd	= (String)row.getAttribute("passwd");
					
					request.setAttribute("userId", userId);
					request.setAttribute("userNm", userNm);
					request.setAttribute("passWd", passWd);
				}
			}
		}else{
			RS_RESULT_EN = (PosRowSet) ctx.getRowSet("RS_RESULT_EN");
			RS_RESULT_VI = (PosRowSet) ctx.getRowSet("RS_RESULT_VI");
			RS_RESULT_KR = (PosRowSet) ctx.getRowSet("RS_RESULT_KR");
			if(RS_RESULT_EN != null) {
				while(RS_RESULT_EN.hasNext()) {
					PosRow row=RS_RESULT_EN.next();
					subtitle1 = (String)row.getAttribute("sub_title_1");
					subtitle2 = (String)row.getAttribute("sub_title_2");
					contentdetails = (String)row.getAttribute("content_details");
					represent_resource = (String)row.getAttribute("represent_resource");
					contentid = String.valueOf(row.getAttribute("content_id"));
					
					pageContentsEn.put(String.valueOf(row.getAttribute("content_seq")), new HPageContent(contentid, subtitle1, subtitle2, represent_resource, contentdetails));
				}
			}
			if(RS_RESULT_VI != null) {
				while(RS_RESULT_VI.hasNext()) {
					PosRow row=RS_RESULT_VI.next();
					subtitle1 = (String)row.getAttribute("sub_title_1");
					subtitle2 = (String)row.getAttribute("sub_title_2");
					contentdetails = (String)row.getAttribute("content_details");
					represent_resource = (String)row.getAttribute("represent_resource");
					contentid = String.valueOf(row.getAttribute("content_id"));
					
					pageContentsVn.put(String.valueOf(row.getAttribute("content_seq")), new HPageContent(contentid, subtitle1, subtitle2, represent_resource, contentdetails));
				}
			}
			if(RS_RESULT_KR != null) {
				while(RS_RESULT_KR.hasNext()) {
					PosRow row=RS_RESULT_KR.next();
					subtitle1 = (String)row.getAttribute("sub_title_1");
					subtitle2 = (String)row.getAttribute("sub_title_2");
					contentdetails = (String)row.getAttribute("content_details");
					represent_resource = (String)row.getAttribute("represent_resource");
					contentid = String.valueOf(row.getAttribute("content_id"));
					
					pageContentsKr.put(String.valueOf(row.getAttribute("content_seq")), new HPageContent(contentid, subtitle1, subtitle2, represent_resource, contentdetails));
				}
			}
		}
	}
%>

<template:tmpt title="Admin">
	<jsp:attribute name="sub_menu">
		<div id="admin_menu" style="margin-left: -150px;">
			<H2 style="width: 220px;text-align:center;">Pages</H2>
			<div class="btn_logout">
				<input  id="btnLogout" class="btnLogout" value="Logout" />
			</div>
			<UL id="menu_ul"class=s_dep02 style="width: 220px;">
				<LI id="OV"><A href="./admin.do?ServiceName=Admin-service&reqTp=OV">Overview</A></LI>
				<LI id="GD"><A href="./admin.do?ServiceName=Admin-service&reqTp=GD">G.D's Message</A></LI>
				<LI id="GP"><A href="./admin.do?ServiceName=Admin-service&reqTp=GP">Global POSCO</A></LI>
				<LI id="HQ"><A href="./admin.do?ServiceName=Admin-service&reqTp=HQ">POSCO ICT Headquarters</A></LI>	
				<LI id="IV"><A href="./admin.do?ServiceName=Admin-service&reqTp=IV">POSCO ICT Vietnam</A></LI>
				<LI id="IB"><A href="./admin.do?ServiceName=Admin-service&reqTp=IB">ITS &amp; BRT</A></LI>
				<LI id="AM"><A href="./admin.do?ServiceName=Admin-service&reqTp=AM">Airport Management</A></LI>
				<LI id="EE"><A href="./admin.do?ServiceName=Admin-service&reqTp=EE">Electrical Engineering</A></LI>	
				<LI id="CI"><A href="./admin.do?ServiceName=Admin-service&get_NN=1&reqTp=CI">Communication Infrastructure</A></LI>						
				<LI id="SD"><A href="./admin.do?ServiceName=Admin-service&get_NN=1&reqTp=SD">S/W Development</A></LI>	
				<LI id="NN"><A href="./admin.do?ServiceName=Admin-service&get_NN=1&reqTp=NN">News Notices</A></LI>
				<LI id="AT"><A href="./admin.do?ServiceName=Admin-service&get_NN=1&reqTp=AT">Activities</A></LI>	
				<LI id="RC"><A href="./admin.do?ServiceName=Admin-service&get_NN=1&reqTp=RC">Recruitment</A></LI>	
				<LI id="CT"><A href="./admin.do?ServiceName=Admin-service&reqTp=CT">Contact</A></LI>		
				<LI id="AU"><A href="./admin.do?ServiceName=Admin-service&get_AU=1&reqTp=AU">Authority</A></LI>				
			</UL>
			
		</div>
	</jsp:attribute>
	<jsp:attribute name="content">
		<div class="con_head biz_ref" style="margin-left: -150px;">
			<div class="ad_control">
				<div class="rad">
					<input type="radio" id="english" name="language" value="english" checked><label for="english"><span></span>English</label>
				</div>
				<div class="rad">
					<input type="radio" id="korean" name="language" value="korean"><label for="korean"><span></span>Korean</label>
				</div>
				<div class="rad">
					<input type="radio" id="vietnamese" name="language" value="vietnamese"><label for="vietnamese"><span></span>Vietnamese</label>
				</div>
			</div>
			<div id="normalEdit">
				<div class="edit" id="en">

					<label class="ad_title">Subtitle : </label>
					<p></br></p>
					<input id="sub_title_en" name="title" style="color: #444;font-family:Arial;font-size:14px;width:1033px;padding-left:10px;padding-right:10px;" type="text" >
					<p></br></p>
					<label class="ad_title">Content : </label>
					<p></br></p>
					<ckfinder:setupCKEditor basePath="../ckfinder/ckfinder/" editor="contentEn" />
					<ckeditor:editor basePath="./ckeditor/" config="${settings}" editor="contentEn"/>
					<p></br></p>
					<div class="divSave">
						<input  id="btnSave_en" class="btnSave" value="Submit" />
					</div>
				</div>
				<div class="edit"  id="vi">

					<label class="ad_title">Subtitle : </label>
					<p></br></p>
					<input id="sub_title_vi" name="title" style="color: #444;font-family:Arial;font-size:14px;width:1033px;padding-left:10px;padding-right:10px;" type="text" >
					<p></br></p>
					<label class="ad_title">Content : </label>
					<p></br></p>
					<ckfinder:setupCKEditor basePath="../ckfinder/ckfinder/" editor="contentVi" />
					<ckeditor:editor basePath="./ckeditor/" config="${settings}" editor="contentVi"/>
					<p></br></p>
					<div class="divSave">
						<input id="btnSave_vi" class="btnSave" value="Submit" />
					</div>
				</div>
				<div class="edit"  id="kr">

					<label class="ad_title">Subtitle : </label>
					<p></br></p>
					<input id="sub_title_kr" name="title" style="color: #444;font-family:Arial;font-size:14px;width:1033px;padding-left:10px;padding-right:10px;" type="text" >
					<p></br></p>
					<label class="ad_title">Content : </label>
					<p></br></p>
					<ckfinder:setupCKEditor basePath="../ckfinder/ckfinder/" editor="contentKr" />
					<ckeditor:editor basePath="./ckeditor/" config="${settings}" editor="contentKr"/>
					<p></br></p>
					<div class="divSave">
						<input  id="btnSave_kr" class="btnSave" value="Submit" />
					</div>
				</div>
			</div>
			<div id="gridEdit_NN" style="margin-top: 10px;">
				<div id="NN_EN" class="wp_tbl_inst"style="width: 1055px;">
					<table class="tbl_inst tbl_st01">
						<colgroup>
							<col style="width:80%;" class="w01">
							<col style="width:5%;" class="w02">
							<col style="width:5%;" class="w03">
						</colgroup>
						<thead>
						<tr>
							<th class="ac" style="font-size:16px;">Content</th>
							<th class="ac"><i class="fa fa-pencil-square-o"style="font-size:20px;"></i></th>
							<th class="ac"><i class="fa fa-trash-o"style="font-size:20px;"></i></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pageContentsEn}" varStatus="counter" var="itemContentEn">
						<tr>
							<td class="gridContent">${itemContentEn.value.subtitle1}</td>
							<td class="ac"><a class="edit_news" onclick="editNews('${itemContentEn.value.subtitle1}','${itemContentEn.value.contentId}')"><i class="fa fa-pencil-square-o" style="font-size:20px;"></i></a></td>
							<td class="ac"><a class="delete_news" onclick="deleteNews('${counter.index}','${itemContentEn.value.contentId}')"><i class="fa fa-trash-o"style="font-size:20px;"></i></a></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="divSave">
						<input class="btnAddNew" value="Add New"/>
					</div>
				</div>
				<div id="NN_VI" class="wp_tbl_inst"style="width: 1055px;">
					<table class="tbl_inst tbl_st01">
						<colgroup>
							<col style="width:80%;" class="w01">
							<col style="width:5%;" class="w02">
							<col style="width:5%;" class="w03">
						</colgroup>
						<thead>
						<tr>
							<th class="ac" style="font-size:16px;">N?i dung</th>
							<th class="ac"><i class="fa fa-pencil-square-o"style="font-size:20px;"></i></th>
							<th class="ac"><i class="fa fa-trash-o"style="font-size:20px;"></i></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pageContentsVn}" varStatus="counter" var="itemContentVn">
						<tr>
							<td class="gridContent">${itemContentVn.value.subtitle1}</td>
							<td class="ac"><a class="edit_news" onclick="editNews('${itemContentVn.value.subtitle1}','${itemContentVn.value.contentId}')"><i class="fa fa-pencil-square-o"style="font-size:20px;"></i></a></td>
							<td class="ac"><a class="delete_news" onclick="deleteNews('${counter.index}','${itemContentVn.value.contentId}')"><i class="fa fa-trash-o"style="font-size:20px;"></i></a></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="divSave">
							<input  class="btnAddNew" value="Add New"/>
					</div>
				</div>
				<div id="NN_KR" class="wp_tbl_inst"style="width: 1055px;">
					<table class="tbl_inst tbl_st01">
						<colgroup>
							<col style="width:80%;" class="w01">
							<col style="width:5%;" class="w02">
							<col style="width:5%;" class="w03">
						</colgroup>
						<thead>
						<tr>
							<th class="ac" style="font-size:16px;">???</th>
							<th class="ac"><i class="fa fa-pencil-square-o"style="font-size:20px;"></i></th>
							<th class="ac"><i class="fa fa-trash-o"style="font-size:20px;"></i></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pageContentsKr}" varStatus="counter" var="itemContentKr">
						<tr>
							<td class="gridContent">${itemContentKr.value.subtitle1}</td>
							<td class="ac"><a class="edit_news" onclick="editNews('${itemContentKr.value.subtitle1}','${itemContentKr.value.contentId}')"><i class="fa fa-pencil-square-o"style="font-size:20px;"></i></a></td>
							<td class="ac"><a class="delete_news" onclick="deleteNews('${counter.index}','${itemContentKr.value.contentId}')"><i class="fa fa-trash-o"style="font-size:20px;"></i></a></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="divSave">
							<input  class="btnAddNew" value="Add New"/>
					</div>
				</div>
			</div>
			<div id="authorityEdit">
				<div class="edit" id="en">

					<label class="ad_title">Username : </label>
					<p></br></p>
					<input id="usernm" style="color: #444;font-family:Arial;font-size:14px;width:180px;height:16px;padding-left:10px;padding-right:10px;" type="text" >
					<p id="userNm_err" class="auth_err">Username is required</p>
					<p></br></p>
					<label class="ad_title">Password : </label>
					<p></br></p>
					<input id="passwd" style="color: #444;font-family:Arial;font-size:14px;width:180px;height:16px;padding-left:10px;padding-right:10px;" type="password" >
					<p id="passWd_err" class="auth_err">Password is required</p>
					<p></br></p>
					<label class="ad_title">Confirm Password : </label>
					<p></br></p>
					<input id="cfmpasswd" style="color: #444;font-family:Arial;font-size:14px;width:180px;height:16px;padding-left:10px;padding-right:10px;" type="password" >
					<p id="cfmPassWd_err" class="auth_err">Confirm password and Password must be same</p>
					<p></br></p>
					<div class="divSave">
						<input  id="btnSave_au" class="btnSave" value="Submit" />
					</div>
				</div>
			</div>
			<%-- Hidden contents --%>
			<div>
				<c:forEach items="${contents}" var="content" varStatus="">
					<div  id="${content.key}" class="content_group" >${content.value}</div>
				</c:forEach>
			</div>
			
			<div>
				<c:forEach items="${pageContentsEn}" var="content" varStatus="">
					<div  id="IM_${content.value.contentId}" class="content_group" >${content.value.representResource}</div>
					<div  id="ST_${content.value.contentId}" class="content_group" >${content.value.subtitle2}</div>
					<div  id="CT_${content.value.contentId}" class="content_group" >${content.value.contentDetails}</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach items="${pageContentsVn}" var="content" varStatus="">
					<div  id="IM_${content.value.contentId}" class="content_group" >${content.value.representResource}</div>
					<div  id="ST_${content.value.contentId}" class="content_group" >${content.value.subtitle2}</div>
					<div  id="CT_${content.value.contentId}" class="content_group" >${content.value.contentDetails}</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach items="${pageContentsKr}" var="content" varStatus="">
					<div  id="IM_${content.value.contentId}" class="content_group" >${content.value.representResource}</div>
					<div  id="ST_${content.value.contentId}" class="content_group" >${content.value.subtitle2}</div>
					<div  id="CT_${content.value.contentId}" class="content_group" >${content.value.contentDetails}</div>
				</c:forEach>
			</div>
		</div>
		
		<div id="dialog-form" title="Edit information">
			<p></br></p>
			<form id="edtFrm">
				<label class="validateTips">Title : </label><input id="title_recruit" name="title" type="text" >
				<p></br></p>
				<label class="validateTips">Content : </label>
				<ckfinder:setupCKEditor basePath="../ckfinder/ckfinder/" editor="recruit" />
				<ckeditor:editor basePath="./ckeditor/" config="${settings2}" editor="recruit"/>
			</form>
			<p></br></p>
			<p class="popup_notes">(All form fields are required)</p>
			
		</div>
		<div id="dialog-form-news" title="Edit information" class="popup_label">
			<p></br></p>
			<form id="edtFrm-news">
				<label class="validateTips">Title : </label><input id="title_news" name="title_news" type="text" class="popup_content" >
				<p></br></p>
				<label class="validateTips">Sub title : </label><input id="sub_title_news" name="sub_title_news" type="text" class="popup_content">	
				<p></br></p>	
				<label class="validateTips">Image : </label><input id="image_news" name="image_news" type="text" class="popup_content">
				<p></br></p>
				<label class="validateTips">Content : </label>
				<ckfinder:setupCKEditor basePath="../ckfinder/ckfinder/" editor="news" />
				<ckeditor:editor basePath="./ckeditor/" config="${settings2}" editor="news"/>
			</form>
			<p></br></p>
			<p class="popup_notes">(All form fields are required)</p>
			
		</div>
	</jsp:attribute>
	
</template:tmpt>
<script src="js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
  <script src="js/jquery-1.9.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <script>
//dialog setting
  $(function() {
    var dialog, dialog_news, form;
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
	
	function editNews() {
		// Set general element value
		$("#sub_title_2").val($("#sub_title_news").val());
		$("#represent_resource").val($("#image_news").val());	
		
		//check request type
		var reqTp = '${reqTp}';
		if (reqTp=='NN'||reqTp=='AT'){
			// Set details element value
			$("#sub_title_1").val($("#title_news").val());
			$("#content_details").val(CKEDITOR.instances.news.getData());
			
		}else{
			// Set details element value
			$("#sub_title_1").val($("#title_recruit").val());
			$("#content_details").val(CKEDITOR.instances.recruit.getData());		
		}
		
		//check transaction type
		var edtTp = $('#edtTp').val();
		if(edtTp=='insert'){
			document.form.action = "./admin.do?ServiceName=Admin-service&reqTp=${reqTp}&insert_NN=1";	
			document.forms["form"].submit();
		}else if(edtTp=='update'){
			document.form.action = "./admin.do?ServiceName=Admin-service&reqTp=${reqTp}&update_NN=1";
			document.forms["form"].submit();
		}else{
			alert('unknown transaction');
		}
	}
	
	//dialog manage recruitment information
    dialog_recruit = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 458,
      width: 939,
      modal: true,
      buttons: {
        "Submit": editNews,
        Cancel: function() {
          dialog_recruit.dialog( "close" );
        }
      },
      close: function() {
      //  allFields.removeClass( "ui-state-error" );
      }
    });
	
	//dialog manage news or activities information
    dialog_news = $( "#dialog-form-news" ).dialog({
      autoOpen: false,
      height: 458,
      width: 939,
      modal: true,
      buttons: {
        "Submit": editNews,
        Cancel: function() {
          dialog_news.dialog( "close" );
        }
      },
      close: function() {
      //  allFields.removeClass( "ui-state-error" );
      }
    });
	
	//edit information in grid
	$( ".edit_news" ).button().on( "click", function() {
		//check request type		
		var reqTp = '${reqTp}';
		
		//edit recruitment information
		if(reqTp=='RC'){
			dialog_recruit.dialog( "open" );
			var myDialogX = $(this).position().left - $(this).outerWidth();
			var myDialogY =  ( $(document).scrollTop() + $('.ui-dialog').outerHeight() )-350;
			var s= document.getElementById('edtTp');
			s.value = 'update';
			dialog_recruit.dialog( 'option', 'position',['middle',myDialogY] );
		
		//edit news or activities
		}else if(reqTp=='NN'||reqTp=='AT'){
			dialog_news.dialog( "open" );
			var myDialogX = $(this).position().left - $(this).outerWidth();
			var myDialogY =  ( $(document).scrollTop() + $('.ui-dialog').outerHeight() )-350;
			var s= document.getElementById('edtTp');
			s.value = 'update';
			dialog_news.dialog( 'option', 'position',['middle',myDialogY] );
		}
		
	});
	
	$( ".delete_recruit" ).button().on( "click", function() {
		//alert('delete');
    });
	$( ".delete_news" ).button().on( "click", function() {
		//alert('delete');
    });
	
	//add more information to grid
	$( ".btnAddNew" ).button().on( "click", function() {
		
		//add news or activities information
		if('${reqTp}'=='NN'||'${reqTp}'=='AT' ) {
			
			// Clear data
			CKEDITOR.instances.news.setData("");
			$("#title_news").val("");
			$("#sub_title_news").val("");
			$("#image_news").val("");
			$("#edtTp").val("insert");
			
			//Open dialog
			dialog_news.dialog( "open" );
			var myDialogX = $(this).position().left - $(this).outerWidth();
			var myDialogY =  ( $(document).scrollTop() + $('.ui-dialog').outerHeight() )-350;
			dialog_news.dialog( 'option', 'position',['middle',myDialogY] );
		
		//add recruitment information
		}else if('${reqTp}'=='RC'){
			
			// Clear data
			$("#title_recruit").val("");
			$("#edtTp").val("insert");
			CKEDITOR.instances.recruit.setData("");
			
			//Open dialog
			dialog_recruit.dialog( "open" );
			var myDialogX = $(this).position().left - $(this).outerWidth();
			var myDialogY =  ( $(document).scrollTop() + $('.ui-dialog').outerHeight() )-350;
			dialog_recruit.dialog( 'option', 'position',['middle',myDialogY] );
		}
    });
  });
</script>
<script>
function editNews(title,contentId) {
	var reqTp = '${reqTp}';
	if(reqTp=='NN'||reqTp=='AT'){
		//set title
		$("#title_news").val(title);
		
		//set subtitle
		var subtitle='#ST_'+contentId;
		$("#sub_title_news").val($(subtitle).html());
		
		//set image link
		var image='#IM_'+contentId;
		$("#image_news").val($(image).html());
		
		//set content id
		$("#content_id").val(contentId);
		
		//set content source
		var content='#CT_'+contentId;
		CKEDITOR.instances.news.setData($(content).html());
	}else{
		//set title
		$("#title_recruit").val(title);
	
		//set content id
		$("#content_id").val(contentId);
	
		//set content source
		var content='#CT_'+contentId;
		CKEDITOR.instances.recruit.setData($(content).html());
	}
}

//delete row in grid
function deleteNews(index,contentId) {
	if (confirm('Are you sure you want to delete this thing on the database?')) {
		$("#content_id").val(contentId);
		
		$("#frm").attr('action',"./admin.do?reqTp=${reqTp}&delete_NN=1"); 	
		$("#frm").submit();
	}
}
</script>
<script>
  $(function() {
	 
    // run the currently selected effect
    function runEffect_en() {
		// get effect type from
		var selectedEffect = "blind";
 
		// most effect types need no options passed by default
		var options = {};
		var reqTp = '${reqTp}';
		if(reqTp=='NN' || reqTp=='RC' || reqTp=='AT' || reqTp=='CI' || reqTp=='SD'){
			$( "#en" ).hide( selectedEffect, options, 500 );
			$( "#vi" ).hide( selectedEffect, options, 500 );
			$( "#kr" ).hide( selectedEffect, options, 500 );
			$( "#NN_EN" ).show( selectedEffect, options, 500 );
			$( "#NN_VI" ).hide( selectedEffect, options, 500 );
			$( "#NN_KR" ).hide( selectedEffect, options, 500 );
		}else{
			$( "#en" ).show( selectedEffect, options, 500, callback );
			$( "#vi" ).hide( selectedEffect, options, 500 );
			$( "#kr" ).hide( selectedEffect, options, 500 );
		}       
		
    };
	// run the currently selected effect
    function runEffect_vi() {
      // get effect type from
		var selectedEffect = "blind";
 
		// most effect types need no options passed by default
		var options = {};
		// run the effect
		var reqTp = '${reqTp}';
		if(reqTp=='NN' || reqTp=='RC' || reqTp=='AT' || reqTp=='CI' || reqTp=='SD'){
			$( "#en" ).hide( selectedEffect, options, 500 );
			$( "#vi" ).hide( selectedEffect, options, 500 );
			$( "#kr" ).hide( selectedEffect, options, 500 );
			$( "#NN_EN" ).hide( selectedEffect, options, 500 );
			$( "#NN_VI" ).show( selectedEffect, options, 500 );
			$( "#NN_KR" ).hide( selectedEffect, options, 500 );
		} else{
			$( "#en" ).hide( selectedEffect, options, 500 );
			$( "#vi" ).show( selectedEffect, options, 500, callback );
			$( "#kr" ).hide( selectedEffect, options, 500 );
		}  
    };
	// run the currently selected effect
    function runEffect_kr() {
		
      // get effect type from
      var selectedEffect = "blind";
 
      // most effect types need no options passed by default
      var options = {};
             
		// run the effect
		var reqTp = '${reqTp}';
		if(reqTp=='NN' || reqTp=='RC' || reqTp=='AT' || reqTp=='CI' || reqTp=='SD'){
			$( "#en" ).hide( selectedEffect, options, 500 );
			$( "#vi" ).hide( selectedEffect, options, 500 );
			$( "#kr" ).hide( selectedEffect, options, 500 );
			$( "#NN_EN" ).hide( selectedEffect, options, 500 );
			$( "#NN_VI" ).hide( selectedEffect, options, 500 );
			$( "#NN_KR" ).show( selectedEffect, options, 500 );
		}else{
			$( "#en" ).hide( selectedEffect, options, 500 );
			$( "#vi" ).hide( selectedEffect, options, 500 );
			$( "#kr" ).show( selectedEffect, options, 500, callback );
		}  
    };
	
	//callback function to bring a hidden box back
    function callback() {
		var idEn = "#" + '${pageContentEn.contentId}';
		var idVn = "#" + '${pageContentVn.contentId}';
		var idKr = "#" + '${pageContentKr.contentId}';
		CKEDITOR.instances.contentEn.setData($(idEn).html());
		CKEDITOR.instances.contentVi.setData($(idVn).html());
		CKEDITOR.instances.contentKr.setData($(idKr).html());
    };
	
    // set effect from select menu value
    $( "#english" ).click(function() {
		runEffect_en();
    });
	$( "#vietnamese" ).click(function() {
		runEffect_vi();
    });
	$( "#korean" ).click(function() {
		runEffect_kr();
    });
	
	//Save English version
	$( "#btnSave_en" ).click(function() {
		
		$("#new_sub_title").val($("#sub_title_en").val());
		$("#content_id").val($("#id_en").val());
		$("#content_details").val(CKEDITOR.instances.contentEn.getData());
		$("#ServiceName").val("Admin-service");
		
		$("#frm").attr("action","./admin.do?reqTp=${reqTp}&update=1");
		$("#frm").submit();
    });
	
	//Save Korean version
	$( "#btnSave_kr" ).click(function() {
		
		$("#new_sub_title").val($("#sub_title_kr").val());
		$("#content_id").val($("#id_kr").val());
		$("#content_details").val(CKEDITOR.instances.contentKr.getData());
		$("#ServiceName").val("Admin-service");
		$("#frm").attr("action","./admin.do?reqTp=${reqTp}&update=1");		
		$("#frm").submit();
    });
	
	//Save Vietnamese version
	$( "#btnSave_vi" ).click(function() {
		
		$("#new_sub_title").val($("#sub_title_vi").val());
		$("#content_id").val($("#id_vi").val());
		$("#content_details").val(CKEDITOR.instances.contentVi.getData());
		
		$("#ServiceName").val("Admin-service");
		$("#frm").attr("action","./admin.do?reqTp=${reqTp}&update=1");
		$("#frm").submit();
    });
	
	//Save authority
	$( "#btnSave_au" ).click(function() {
		
		$("#userNm_err").hide();
		$("#passWd_err").hide();
		$("#cfmPassWd_err").hide();
		if($("#usernm").val()==""){
			$("#userNm_err").css( "display", "inline-block");
			return;
		}
		if($("#passwd").val()==""){
			$("#passWd_err").css( "display", "inline-block");
			return;
		}		
		if($("#passwd").val()!=$("#cfmpasswd").val()){
			$("#cfmPassWd_err").css( "display", "inline-block");
			return;
		}
		var passhash = CryptoJS.MD5($("#passwd").val());
		$("#userNm").val($("#usernm").val());
		$("#userPass").val(passhash);
		$("#ServiceName").val("Admin-service");
		$("#frm").attr("action","./admin.do?reqTp=${reqTp}&update_AU=1");
		$("#frm").submit();
    });
	
	//Logout function
	$( "#btnLogout" ).click(function() {		
		window.location.href="./login.do"
    });
  });
  </script>
