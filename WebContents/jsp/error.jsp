<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

</head>
<body>
	<form name="form" action="index.do" method="post">
	<IMG src="img/oops.png">
	</form>
</body>
</html>
<script type="text/javascript">
	window.onload = function () {
		document.form.action = "./index.do";	
		document.forms["form"].submit();
	}
</script>