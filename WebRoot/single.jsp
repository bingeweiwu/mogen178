<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
	
	<head>
		
	</head>

	<body>
<jsp:include page="top.jsp"/>
		

		<!-- Start of Page Container -->
		<table width="50%" border="0" align="left" cellpadding="0"
			cellspacing="0">
			<tr>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" background="images/huilan.gif">
							<img src="images/12.png" width="42" height="42" />
							<font color="white" size="5">个人信息</font>
						</td>
					</tr>
				</table>
			</tr>
			<tr>
				<td>
					<table width="100%" border="1" cellspacing="0" cellpadding="0">
						<tr>

							<td>

								<table width="20%" border="1" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#c0de98">

									<tr>
										<td width="46%" height="18" bgcolor="#FFFFFF">
											<div align="center">
												姓名
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											${user.realname }
										</td>
									</tr>
									<tr>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center">
												性别
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											${user.sex }
										</td>
									</tr>
									<tr>

										<tr>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center">
													身份
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												${user.role }
											</td>
										</tr>

										<tr>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center">
													真实姓名
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												${user.realname }
											</td>
										</tr>
										<tr>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center">
													电话
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												${user.telephone }
											</td>
										</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>

			</tr>


		</table>

		<table border="2" height="30" width="70%">
			<tr height="10%" border="1">
				发表日期：
			</tr>
			<tr>
				22
			</tr>
		</table>
<jsp:include page="foot.jsp"/>
	</body>
</html>
