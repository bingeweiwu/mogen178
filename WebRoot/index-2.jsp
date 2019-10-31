<%@ page language="java" contentType="text/html; charset=utf-8" 	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>

<head>
<!-- META TAGS -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>主页</title>

<link rel="shortcut icon" href="images/favicon.png" />




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
	<jsp:include page="top.jsp" />

	<!-- Start of Search Wrapper -->
	<div class="search-area-wrapper">
		<div class="search-area container">
			<h3 class="search-header">发帖？搞起来！</h3>
			<p class="search-tag-line">If you have any question you can ask
				below or enter what you are looking for!</p>

			<form id="search-form" class="search-form clearfix" method="post"
				action="userManager?operation=search&id=1" autocomplete="off">
				<input class="search-term required" type="text" id="s" name="s"
					placeholder="检索关键字" title="* Please enter a search term!" /> <input
					class="search-btn" type="submit" value="Search" />
				<div id="search-error-container"></div>
			</form>
		</div>
	</div>
	<!-- End of Search Wrapper -->

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">

					<!-- Basic Home Page Template -->
					<div class="row separator">
						<section class="span4 articles-list">
							<h3>帖子列表</h3>
							<ul class="articles">
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
							</ul>
						</section>


						<section class="span4 articles-list">
							<h3>最新的提问</h3>
							<ul class="articles">
							<c:if test="${tiwen== null || fn:length(tiwen) == 0}">
								空空如也
							</c:if>
							<c:forEach var="list" items="${tiwen}">
									<li class="article-entry standard">
									<h4>
										<a href="${pageContext.request.contextPath }/posts?pid=${list.id}">${list.titleString }</a>
									</h4> 
									<span class="article-meta">${list.date } 
									<a href="#" title="${list.titleString }">
										<c:forEach var="tag" items="${tag}">
											<c:if test="${list.tagString eq tag.id }">
												<a href="${ pageContext.request.contextPath }/tag?id=${tag.id}" title="${list.titleString }">
													${tag.name}
												</a>
											</c:if>
										 </c:forEach> 
									</a>
									</span> <span class="like-count">66</span>
								</li>
							  </c:forEach> 
							</ul>
						</section>
					</div>
				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<aside class="span4 page-sidebar">

					<section class="widget">
						<div class="support-widget">
							<h3 class="title">支持</h3>
							<p class="intro">需要更多的支持？ 如果您没有找到答案，请联系我们获取进一步的帮助。</p>
						</div>
					</section>

					<section class="widget">
						<div class="quick-links-widget">
							<h3 class="title">快速链接</h3>
							<ul id="menu-quick-links" class="menu clearfix">
								<li><a href="index-2.jsp">主页</a></li>
								<li><a href="tiezilist.jsp">帖子列表</a></li>
								<li><a href="tiwenlist.jsp">问答列表</a></li>
								<li><a href="fatie.jsp">发帖</a></li>
								<li><a href="tiwen.jsp">提问</a></li>
							</ul>
						</div>
					</section>

					<section class="widget">
						<h3 class="title">标签</h3>
						<div class="tagcloud">
							<c:if test="${tag== null || fn:length(tag) == 0}">
								空空如也
							</c:if>
							<c:forEach var="tag" items="${tag}">
								<a href="${ pageContext.request.contextPath }/tag?id=${tag.id}" class="btn btn-mini">${tag.name }</a>
							 </c:forEach> 
						</div>
					</section>

				</aside>
				<!-- end of sidebar -->
			</div>
		</div>
	</div>
	<!-- End of Page Container -->
	<jsp:include page="foot.jsp" />

</body>
</html>