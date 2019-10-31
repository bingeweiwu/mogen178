<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="cn.edu.hezeu.jsp.utils.RandomUtil"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
body {
	background-image: url(../img/02.jpg);
	background-repeat: no-repeat;
}
</style>
<!-- Style Sheet-->
<link rel="stylesheet" href="style.css" />
<link rel='stylesheet' id='bootstrap-css-css'
	href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css'
	href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css'
	href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
	media='all' />
<link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0'
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css'
	href='css/custom5152.html?ver=1.0' type='text/css' media='all' />

  
    <base href="<%=basePath%>">
    
    <title>My JSP 'retrieve.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
    <form action="userManager?operation=retrieve" method="post" >
    	<table border="1" align="center" width="400">
    	         <h2 align="center">
					找回密码
				</h2>
    		<tr height="30"><td align="center">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账号:<input type="text" name="id" /></td></tr>
    		<tr height="30"><td align="center">真实姓名:<input type="text" name="realname" /></td></tr>
    		<tr height="30"><td align="center">电话号码:<input type="text" name="telephone" /></td></tr>
    		<!--<tr height="30"><td align="center">
    		<input type="submit" value="提交" />
    		<input type="reset" value="重置" />
    		</td></tr>
    		--><tr height="30">
					<td align="center"><input type="image" src="images/tijiao.gif"
						width="81" height="31" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image" src="images/reset.gif" onClick="reset"
						width="81" height="31" /></td>
				</tr>
    	</table>
    </form>
    </center>
  </body>
</html>
