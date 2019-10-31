<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="cn.edu.hezeu.jsp.utils.RandomUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login</title>
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


</head>
<body>

	<!-- Start of Page Container -->
	<center>
		<form action="userManager?operation=login" method="post">
			<table border="1" width="400">
				<h2>
					用户登录&nbsp;&nbsp;<a href="register.jsp">注册</a>
				</h2>

				<tr height="30">
					<td align="center">账 号：<input type="text" name="id" value="">
					</td>
				</tr>
				<tr height="30">
					<td align="center">密 码：<input type="password" name="password" value="">
					</td>
				</tr>
				<tr height="30">
					<td align="center"><select name="role"
						style="font-size:12px; color:#81b432;">
							<option value="user" checked>用户</option>
							<option value="manager" >管理员</option>
					</select></td>
				</tr>
				<tr height="30">
					<td align="center">验证码：<input type="text" name="Code">
						<%
							String str = RandomUtil.getConfirmCode(2);
							session.setAttribute("Code", str);
						%> <%=str%></td>
				</tr>
				<tr height="30">
					<td align="center"><input type="image" src="images/login.gif"
						width="81" height="31" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image" src="images/reset.gif" onClick="reset"
						width="81" height="31" /></td>
				</tr>
				<tr height="60">
					<td align="center">是否记住<input type="checkbox"
						name="passcookies" value="jizhu"><a href="retrieve.jsp">找回密码</a>
					</td>
					<td></td>
				</tr>

			</table>
		</form>

	</center>



	<!-- End of Page Container -->
</body>
</html>
