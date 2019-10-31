<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Knowledge Base Theme</title>
<link rel="shortcut icon" href="images/favicon.png" />
<!-- Style Sheet-->
<link rel="stylesheet" href="style.css" />
<link rel='stylesheet' id='bootstrap-css-css' href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css' href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<!-- <link rel='stylesheet' id='pretty-photo-css-css' href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' /> -->
<link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css' href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
</head>
<script type="text/javascript">
 function tiaozhuan(){
		
		if(confirm("确定退出吗?")){
		
			return true;
		}else{return false;}
	}
</script>
<body>
	<!-- Start of Header -->
	<div class="header-wrapper">
		<header>
			<div class="container">


				<div class="logo-container">
					<!-- Website Logo -->
					<a href="index" title="Knowledge Base Theme"> <img
						src="images/logo.png" alt="Knowledge Base Theme">
					</a> <span class="tag-line">*************************</span>
				</div>


				<!-- Start of Main Navigation -->
				<nav class="main-nav">
					<div class="menu-top-menu-container">
						<ul id="menu-top-menu" class="clearfix">
							<li ><a href="index">Home</a>
							</li>
							<li><a href="fatie.jsp">发帖</a></li>
							<li><a href="tiwen.jsp">提问</a></li>
							<li><a href="posts?type=fatie">帖子列表 </a></li>
							<li><a href="posts?type=tiwen">提问列表 </a></li>
<!-- 							<li><a href="sell.jsp">Sell</a></li> -->
<!-- 							<li><a href="#">Skins</a> -->
<!-- 								<ul class="sub-menu"> -->
<!-- 									<li><a href="blue-skin.jsp">Blue Skin</a></li> -->
<!-- 									<li><a href="green-skin.jsp">Green Skin</a></li> -->
<!-- 									<li><a href="red-skin.jsp">Red Skin</a></li> -->
<!-- 									<li><a href="index-2.jsp">Default Skin</a></li> -->
<!-- 								</ul></li> -->
							
							<li><a href="login.jsp" onclick="return tiaozhuan()">退出</a></li>
						</ul>
					</div>
				</nav>
				<!-- End of Main Navigation -->

			</div>
		</header>
	</div>
	<!-- End of Header -->

	<!-- Start of Search Wrapper -->
<!-- 	<div class="search-area-wrapper"> -->
<!-- 		<div class="search-area container"> -->
<!-- 			<h3 class="search-header">Have a Question?</h3> -->
<!-- 			<p class="search-tag-line">If you have any question you can ask -->
<!-- 				below or enter what you are looking for!</p> -->

<!-- 			<form id="search-form" class="search-form clearfix" method="get" -->
<!-- 				action="#" autocomplete="off"> -->
<!-- 				<input class="search-term required" type="text" id="s" name="s" -->
<!-- 					placeholder="Type your search terms here" -->
<!-- 					title="* Please enter a search term!" /> <input class="search-btn" -->
<!-- 					type="submit" value="Search" /> -->
<!-- 				<div id="search-error-container"></div> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- End of Search Wrapper -->



</body>
</html>
