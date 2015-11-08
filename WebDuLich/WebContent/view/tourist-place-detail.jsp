<%@page import="java.util.List"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ModelPost mdPost = new ModelPost();
	dtoPost post = mdPost.getPostById(request.getParameter("post"));
	List<String> listSrc = mdPost.getImagesFromPost(post.getPostId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tourist Place</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resource/css/css_home.css" rel="stylesheet">
<link href="resource/css/view-tour.css" rel="stylesheet">
<script src="resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="resource/lib/jquery-home.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/lib/tour-utility.js"></script>
<link
	href='https://fonts.googleapis.com/css?family=Lobster&subset=vietnamese'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab&subset=vietnamese'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- body header -->
	<jsp:include page="body-header.jsp"></jsp:include>
	<!-- body content -->
	<div class="container">
		<ol class="breadcrumb">
			<li>
				<a href="#">Home</a>
			</li>
			<li class="active">Điểm du lịch</li>
		</ol>
		<div class="text-right">
			<div class="separator">
				<h3 style="font-weight: 400">Điểm du lịch</h3>
				<form action="" style="margin-bottom: 10px">
					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle btn-select"
							data-toggle="dropdown" href="#">
							Tỉnh/ Thành phố <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">United States</a>
							</li>
							<li>
								<a href="#">Canada</a>
							</li>
							<li class="divider"></li>
						</ul>
					</div>
				</form>
			</div>

		</div>
		<!-- list tour -->
		<br> <br>
		<ul class="list-inline" style="margin: 0 auto; width: 89%;">
			<li class="post">
				<div id="carousel-1" class="carousel slide c-fade"
					data-ride="carousel">
					<!-- Top part of the slider -->
					<!-- Carousel items -->
					<div class="carousel-inner">
						<div class="active item" data-slide-number="0">
							<img class="img-responsive" alt="not found"
								src="resource/image/cm.jpg">
						</div>
						<div class=" item" data-slide-number="1">
							<img class="img-responsive" alt="not found"
								src="resource/image/cm1.jpg">
						</div>
					</div>
				</div>
				<!--/Slider-->
				<div class="caption">
					<div style="position: relative">
						<h4 class="text-left" style="position: absolute">
							<a href="#"> Vườn Hoa Đà Lạt</a>
						</h4>
						<h4 class="pull-right" data-toggle="tooltip"
							title="10 người đã xem" style="color: #3399FF">
							<span class="glyphicon glyphicon-eye-open"></span> 10
						</h4>
					</div>
					<br>
					<br>
					<p>Lấy dưới database lên vài dòng mô tả ngắn gọn ở đây ...</p>
				</div>
			</li>
		</ul>
	</div>
	<!-- pagination -->
	<nav>
	<ul class="pagination pull-right">
		<li>
			<a href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<li>
			<a href="#">1</a>
		</li>
		<li>
			<a href="#">2</a>
		</li>
		<li>
			<a href="#" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
	</nav>
	<!-- body footer -->
	<jsp:include page="body-footer.jsp"></jsp:include>
	<!-- go to top button -->
	<a href="#" class="top"></a>
</body>
</html>