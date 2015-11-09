<%@page import="model.ModelPost"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelUser"%>
<%@page import="model.ModelLocation"%>
<%@page import="dto.dtoLocation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	List<dtoLocation> listLocation = null;
	ModelLocation mdLocation = new ModelLocation();
	listLocation = mdLocation.getAllLocation();

	List<String> listCompany = null;
	ModelUser mdUser = new ModelUser();
	listCompany = mdUser.getAllCompanyName();

	List<dtoPost> listPost = null;
	ModelPost mdPost = new ModelPost();
	listPost = mdPost.getAllPostByCategory("1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tour mới</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/view-tour.css" rel="stylesheet">
<script type="text/javascript" src="view/resource/lib/tour-utility.js"></script>
<script src="view/resource/lib/jquery-sign-in.min.js"></script>
</head>
<body>
	<!-- body header -->
	<jsp:include page="body-header.jsp"></jsp:include>
	<!-- body content -->
	<div class="container" style="width: 80%">

		<div class="separator">
			<h3>TOUR MỚI</h3>
		</div>
		<br> <br>
		<div class="panel panel-body">
			<lable class="text-left"> <i>Tùy chọn tìm kiếm</i></lable>
			<center>
				<form action="" style="margin: 10px" class="form" role="form">
					<div class="form-group">
						<table width="80%">
							<thead>
								<tr>
									<td style="padding-left: 25px;"><label for="price">Giá
											tour</label></td>
									<td style="padding-left: 25px;"><label for="place">Tỉnh
											thành</label></td>
									<td style="padding-left: 25px;"><label for="tourist">Công
											ty lữ hành</label></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 25px;"><select
											class="form-control " id="price">
											<option>Giá tour</option>
											<option>10$</option>
											<option>100$</option>
											<option>1000$</option>
										</select></td>

									<td style="padding-left: 25px;"><select
											class="form-control " id="place">
											<option>Tỉnh thành</option>
											<%
												for (dtoLocation location : listLocation) {
													out.write("<option value = '" + location.getLocationId() + "'>"
															+ location.getName() + "</option>");
												}
											%>
										</select></td>

									<td style="padding-left: 25px;"><select
											class="form-control " id="tourist">
											<option>Công ty lữ hành</option>
											<%
												for (String company : listCompany) {
													out.write("<option value = '" + company + "'>" + company
															+ "</option>");
												}
											%>
										</select></td>
									<td><div class="btn-group" style="float: right">
											<button type="button" id="btnSearch" class="btn btn-primary">Tìm
												kiếm</button>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</center>
		</div>

		<br> <br>
		<!-- list tour -->
		<%
			for (dtoPost post : listPost) {
				out.write("<li class='post'>");
			}
		%>
		<ul class='list-inline' style='margin: 0 auto; width: 100%;'>

			<div id='carousel-1' class='carousel slide c-fade'
				data-ride='carousel'>
				<!-- Top part of the slider -->
				<!-- Carousel items -->
				<div class='carousel-inner'>
					<div class='active item' data-slide-number='0'>
						<img class='img-responsive' alt='not found'
							src='resource/image/cm.jpg'>
					</div>
					<div class=' item' data-slide-number='1'>
						<img class='img-responsive' alt='not found'
							src='resource/image/cm1.jpg'>
					</div>
				</div>
			</div>
			<!--/Slider-->
			<div class='caption' style='font-size: 17px;'>
				<div class='col-md-10'>
					<p>
						<a href='#'> Đà Lạt - Huế - Hà Nội </a>
					</p>
					<p>
						<span class='glyphicon glyphicon-usd'></span> 15.000.000đ
					</p>
				</div>
				<div class='col-md-2'>
					<p data-toggle='tooltip' title='10 người đã xem'>
						<span class='glyphicon glyphicon-eye-open' style='color: #3399FF'></span>
						10
					</p>
					<p data-toggle='tooltip' title='Đã có 10 người mua tuor này'>
						<span class='glyphicon glyphicon-shopping-cart'
							style='color: #3399FF'></span> 10
					</p>
				</div>
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
	<span class="top"></span>
</body>
</html>