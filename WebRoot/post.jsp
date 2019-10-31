<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>列表</title>


<body>
	<jsp:include page="top.jsp" />

	<!-- Start of Search Wrapper -->
	<div class="search-area-wrapper">
		<div class="search-area container">
			<h3 class="search-header">发帖？搞起来！</h3>
			<p class="search-tag-line">If you have any question you can ask
				below or enter what you are looking for!</p>
		</div>
	</div>
	<!-- End of Search Wrapper -->

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">
					<input type="hidden" value="${post.id}" id="pid" /> <input
						type="hidden" value="${loginSign.id}" id="uid" />
					<!-- Basic Home Page Template -->
					<div class="row separator">
						<section class="span10 articles-list">
							<h3>${post.titleString }</h3>
							<ul class="articles">
								<div class="panel panel-default">
									<div class="panel-heading">
										<c:forEach var="tag" items="${tag}">
											<c:if test="${post.tagString eq tag.id }">
												<a
													href="${ pageContext.request.contextPath }/tag?id=${tag.id}"
													title="${post.titleString }"> ${tag.name} </a>
											</c:if>
										</c:forEach>
									</div>
									<div class="panel-body">
										<p>${post.context }</p>
									</div>
							</ul>
						</section>
						</aside>
						<!-- end of sidebar -->
					</div>
					<div class="span10 page-content">
						<ul class="articles">
							<c:if test="${comments== null || fn:length(comments) == 0}">
							  暂无评论
							</c:if>
							<c:forEach var="list" items="${comments}">
								<li class="article-entry standard">
									<h4>
										<a href="#">${list.user.realname }</a>
										<c:if test="${loginSign.role == 'manager'}">
											<a href="javascript:del(${list.id });">删除</a>
										</c:if>
									</h4> <span class="article-meta">${list.context } </span> <span
									class="like-count">66</span>
								</li>
							</c:forEach>
						</ul>
						<br> <br> <br> <br>
						<div class="control-group">
							<label class="control-label">评论这个项目</label>
							<div class="controls">
								<div class="textarea">
									<textarea type="" class="" id="context" name="context"
										rows="10" style="width: 99%"></textarea>
								</div>
							</div>
						</div>

						<div>
							<button onclick="postComment()" type="button" id="myButton"
								class="btn btn-primary">发表评论</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End of Page Container -->
	<jsp:include page="foot.jsp" />



	<script type="text/javascript">
		function del(id) {
			var url = "ajax?action=comment-delete";
			if (confirm("确定删除此条评论吗？")) {
				$.ajax({
					url : url,
					method : "post",
					data : {
						cid : id
					},
					success : function(data) {
						if (data = "ok") {
							alert("删除成功");
							window.location.reload();
						} else {
							alert("删除失败");
							window.location.reload();
						}

					}
				});
			}
		}

		function postComment() {
			var A = $("#context").val();
			if (A == null || A == undefined || A == "") {
				alert("内容不要为空");
				return false;
			}
			console.log(A)
			var pid = $("#pid").val();
			var url = "ajax?action=comment";
			var uid = $("#uid").val();
			$.ajax({
						url : url,
						method : "get",
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						data : {
							pid : pid,
							context : encodeURI(A),
							uid : uid
						},
						success : function(data) {
							if (data = "ok") {
								alert("评论成功");
								window.location.reload();
							} else {
								alert("评论失败");
								window.location.reload();
							}

						}
					});
		}
	</script>
</body>
</html>