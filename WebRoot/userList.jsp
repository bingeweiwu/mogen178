<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
 function tiaozhuan(){
		
		if(confirm("您要删除该学生吗？")){
		
			return true;
		}else{return false;}
	}
</script>


<html>
<head>
</head>
<body>
<jsp:include page="manager2.jsp"/>
<!-- Start of Page Container -->
		<br>
		<br>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" height="25">
						<tr>
<!--							<td width="15" height="60">-->
<!--								<img src="images/tab_03.gif" width="15" height="30" />-->
<!--							</td>-->
							<td width="100%" background="images/huilan.gif">
								<img src="images/12.png" width="42" height="42"/>
								<span class="STYLE4" ><font size="5 " >用户列表</font></span>
							</td>
<!--							<td width="381" background="images/tab_05.gif">-->
<!--							</td>-->
<!--							<td width="14">-->
<!--								<img src="images/tab_07.gif" width="14" height="30" />-->
<!--							</td>-->
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" .,>
						<tr>
<!--							<td width="9" background="images/.gif">-->
<!--								&nbsp;-->
<!--							</td>-->
							<td bgcolor="#f3ffe3">
								<table width="99%" border="0" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#c0de98">
									<tr>
										<td width="11%" height="26" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												用户名
											</div>
										</td>
										<td width="16%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												id
											</div>
										</td>
										<td width="16%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												性别
											</div>
										</td>
										<td width="16%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												电话
											</div>
										</td>
										<td width="10%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												详细信息
											</div>
										</td>
										<td width="10%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												操作1
											</div>
										</td>
										<td width="10%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2">
												操作2
											</div>
										</td>
										<td width="10%" height="18" background="images/255.gif"
											class="STYLE1">
											<div align="center" class="STYLE2">
												操作3
											</div>
										</td>
									</tr>
					<c:forEach var="list" items="${userList }">
									<tr>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE1">${list.username }</div>
										</td>
										<td height="18" bgcolor="#FFFFFF" class="STYLE2">
											<div align="center" class="STYLE2 STYLE1">${list.id }</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">${list.sex }</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">${list.telephone }</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">
												<a href="userManager?id=${list.id }&operation=see">查看</a>
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">
												<a href="userManager?id=${list.id }&operation=modify">修改</a>
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">
												<a href="addUser.jsp">添加</a>
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div align="center" class="STYLE2 STYLE1">
												<a href="userManager?id=${list.id }&operation=delete" onclick="return tiaozhuan()">删除</a>
											</div>
										</td>
									</tr>
									</c:forEach>
                        
									<%--
    		
    		}--%>

								</table>
							</td>
<!--							<td width="9" background="images/tab_16.gif">-->
<!--							</td>-->
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="29">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
<!--							<td width="15" height="29">-->
<!--								<img src="images/tab_20.gif" width="15" height="29" />-->
<!--							</td>-->
<!--							<td background="images/tab_21.gif">-->
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="25%" height="29" nowrap="nowrap">
											<span class="STYLE1"> <%--共3条记录，当前第1/2页 --%> </span>
										</td>
										<td width="75%" valign="top" class="STYLE1">
											<div align="right">
												<table width="352" height="20" border="0" cellpadding="0"
													cellspacing="0">
													<%-- 
                <tr>
                  <td width="62" height="22" valign="middle"><div align="right"><a href="user/user!findAll"><img src="images/first.gif" width="37" height="15" /></a> </div></td>
                  <td width="50" height="22" valign="middle"><div align="right"><a href="user/user?currentPage=0"><img src="images/back.gif" width="43" height="15" /></a></div></td>
                  <td width="54" height="22" valign="middle"><div align="right"><a href="user/user?currentPage=2"><img src="images/next.gif" width="43" height="15" /></a></div></td>
                  <td width="49" height="22" valign="middle"><div align="right"><a href="user/user?currentPage=2"><img src="images/last.gif" width="37" height="15" /></a></div></td>
                  
                </tr>
                 --%>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
<!--							<td width="14">-->
<!--								<img src="images/tab_22.gif" width="14" height="29" />-->
<!--							</td>-->
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<!-- end of page content -->

		<!-- End of Page Container -->
		<jsp:include page="foot.jsp"/>
	</body>
</html>

