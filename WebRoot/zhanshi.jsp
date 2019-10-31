<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhanshi.jsp' starting page</title>
    
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
  <jsp:include page="top.jsp"></jsp:include>
  <table align="center">
<%--     <tr><td><a href="/tag?id=${tag.id}" title="${posts.titleString }"></td></tr> --%>
		<c:if test="${fatie== null || fn:length(fatie) == 0}">
								空空如也
							</c:if>
								<c:forEach var="list" items="${fatie}">
									<li class="article-entry standard">
										<h4>
											<a href="${pageContext.request.contextPath }/posts?pid=${list.id}">${list.titleString }</a>
										</h4> 
									<span class="article-meta">${list.date } 
										<c:forEach var="tag" items="${tag}">
											<c:if test="${list.tagString eq tag.id }">
												<a href="${ pageContext.request.contextPath }/tag?id=${tag.id}" title="${list.titleString }">
													${tag.name}
												</a>
											</c:if>
										 </c:forEach>
									</span>
									 <span class="like-count">5</span>
									</li>
								</c:forEach> 
    </table>
  </body>
</html>
