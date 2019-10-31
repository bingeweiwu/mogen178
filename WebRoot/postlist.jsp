<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>列表</title>


<body>
	<jsp:include page="top.jsp" />

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">

					<!-- Basic Home Page Template -->
					<div class="row separator">
						<section class="span10 articles-list">
							<h3>帖子列表</h3>
							<ul class="articles">
							<c:if test="${fatie== null || fn:length(fatie) == 0}">
								空空如也
							</c:if>
							
							<c:forEach var="list" items="${fatie}">
									<li class="article-entry standard">
										<h4>
										<a href="${pageContext.request.contextPath }/posts?pid=${list.id}">${list.titleString }</a>
										</h4> <span class="article-meta">${list.date } <c:forEach
												var="tag" items="${tag}">
												<c:if test="${list.tagString eq tag.id }">
													<a href="/tag?id=${tag.id}" title="${list.titleString }">
														${tag.name} </a>
												</c:if>
											</c:forEach>
									</span> <span class="like-count">5</span>
									</li>
								</c:forEach>
							</ul>
						</section>
						</aside>
						<!-- end of sidebar -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Page Container -->
	<jsp:include page="foot.jsp" />

</body>
</html>