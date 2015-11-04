<%@page import="java.util.ArrayList"%>
<%@page import="dto.dtoCategory"%>
<%@page import="java.util.List"%>
<%@page import="model.ModelPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ModelPost mdPost = new ModelPost();
	List<dtoCategory> listCate = new ArrayList<dtoCategory>();
	listCate = mdPost.getAllCategory();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quản lý bài đăng</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/view-tour.css" rel="stylesheet">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="view/resource/lib/tour-utility.js"></script>
</head>
<body>
	<!-- body header -->
	<jsp:include page="body-header.jsp" />

	<!-- body content -->

	<div class="container">
		<br> <br> <br> <br> <br>
		<ol class="breadcrumb">
			<li>
				<a href="#">Home</a>
			</li>
			<li class="active">Tuor mới</li>
		</ol>
		<div class="text-right">
			<div class="separator">
				<h3>DANH MỤC BÀI ĐÃ ĐĂNG</h3>
				<form action="" style="margin-bottom: 10px">
					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle btn-select"
							data-toggle="dropdown" href="#">
							Thể loại <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<%
								for (dtoCategory cate : listCate)
									out.print("<li>	<a href='#/'>" + cate.getName() + "</a></li>");
							%>
						</ul>
					</div>
				</form>
			</div>

		</div>

		<br> <br>
		<ul class="list-inline" style="margin: 0 auto; width: 89%;">
			<li class="post">
				<div id="carousel-1" class="carousel slide c-fade"
					data-ride="carousel">
					<!-- Top part of the slider -->
					<!-- Carousel items -->
					<div class="carousel-inner">
						<a href="#"
							style="font-size: 25px; z-index: 1; display: none; background: red; padding: 10px; border-radius: 100%; color: white;"
							class="glyphicon glyphicon-remove pull-right"
							data-toggle="tooltip" title="Xóa"></a>
						<a href="#"
							style="font-size: 25px; z-index: 1; display: none; background: green; padding: 10px; border-radius: 100%; color: white;"
							class="glyphicon glyphicon-pencil pull-right"
							data-toggle="tooltip" title="Chỉnh sửa"></a>
						<div class="active item" data-slide-number="0">
							<img class="img-responsive" alt="not found" style="z-index: 0"
								src="view/resource/image/cm.jpg">
						</div>
						<div class=" item" data-slide-number="1">							
							<img class="img-responsive" alt="not found" style="z-index: 0"
								src="view/resource/image/cm1.jpg">
						</div>
					</div>
				</div>
				<!--/Slider-->
				<div class="caption">
					<a href="#">
						<h4 class="text-left">Đà Lạt - Huế - Hà Nội</h4>
					</a>
					<h4 class="text-left glyphicon glyphicon-usd"
						style="color: #3399FF">
						<span>15.000.000đ</span>
					</h4>
					<h4 class="pull-right glyphicon glyphicon-shopping-cart"
						data-toggle="tooltip" title="Đã có 10 người mua tuor này"
						style="color: #3399FF">10</h4>
				</div>
			</li>
		</ul>

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
				<a href="#">3</a>
			</li>
			<li>
				<a href="#">4</a>
			</li>
			<li>
				<a href="#">5</a>
			</li>
			<li>
				<a href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
		</nav>
	</div>
	<!-- body footer -->
	<jsp:include page="body-footer.jsp" />
	<!-- go to top button -->
	<a href="#" class="top"></a>
</body>
</html>