<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    
    <title>My JSP 'modifypwd.jsp' starting page</title>
    
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
    <form action="userManager?operation=modifypwd" method="post"> 
    	<table border="1" width="400" align="center">
    	<h2 align="center">
					修改密码
				</h2>
    		<tr><td align="center">新密码:<input type="password" name="newpwd1" /></td></tr>
    		<tr><td align="center">确认密码:<input type="password" name="newpwd2" /></td></tr>
    		<tr><td align="center"><input type="hidden" name="id"  value="${user.id }"/></td></tr>
    		<tr><td align="center"><input type="hidden" name="telephone" value="${user.telephone }" /></td></tr>
    		<tr><td align="center"><input type="hidden" name="realname" value="${user.realname }" /></td></tr>
    		<!-- <tr><td>
    		<input type="submit" value="提交" />
    		<input type="reset" value="重置" />
    		</td></tr> -->
    		<tr height="30">
					<td align="center"><input type="image" src="images/tijiao.gif"
						width="81" height="31" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image" src="images/reset.gif" onClick="reset"
						width="81" height="31" /></td>
				</tr>
    	</table>
    </form>
  </body>
</html>
