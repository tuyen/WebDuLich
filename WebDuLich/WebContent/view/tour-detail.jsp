<%@page import="model.ModelUser"%>
<%@page import="dto.dtoUser"%>
<%@page import="java.util.List"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ModelPost mdPost = new ModelPost();
	dtoPost post = mdPost.getPostById(request.getParameter("id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=post.getTitle()%></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/view-tour.css" rel="stylesheet">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="view/resource/lib/jquery-sign-in.min.js"></script>
</head>
<body>

	<!-- body header -->
	<jsp:include page="body-header.jsp" />
	<!-- Content -->
	<div class="container">
		<ol class="breadcrumb">
			<li>
				<a href="#">Home</a>
			</li>
			<li>
				<a href="#">Tour mới</a>
			</li>
			<li class="active">Vịnh hạ long - Huế</li>
		</ol>
		<div class="head container-fluid">
			<div class="row">
				<div class="col-md-8">
					<div id="carousel" class="carousel slide" data-ride="carousel">
						<!-- Carousel items -->
						<div class="carousel-inner">
							<%
								List<String> listSrc = mdPost.getImagesFromPost(post.getPostId());
								int i = 0;
								for (String src : listSrc) {
									if (i == 0) {
										out.write("<div class='active item' data-slide-number='0'>");
										i++;
									} else
										out.write("<div class='item' data-slide-number='0'>");
									out.write("<img width = '478' height = '318' alt='not found' style='z-index: 0'src='"
											+ src + "'>");
									out.write("</div>");
								}
							%>
						</div>
					</div>
				</div>
				<div class="row col-md-4">
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black"><%=post.getTitle()%></span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Giá tour: <%=post.getPrice()%></span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Thời gian: 4 ngày 5 đêm</span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Lữ hành: <%
								ModelUser mdUser = new ModelUser();
								out.write(mdUser.getCompanyNameById(post.getUserId()));
							%>
							</span>
						</h4>
					</div>
					<div style="margin-top: 10px">
						<input type="submit" class="btn btn-primary" value="Đặt tour"
							data-toggle="tooltip"
							title="Báo đơn vị lữ hành liên hệ với bạn ngay!">
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="content">
			<%
				out.write(post.getContent());
			%>
		</div>

		<div class="comment">
			<div class="separator">
				<h3>BÌNH LUẬN</h3>
				<br> <br>
			</div>
			<form class="form form-group" role="form">
				<textarea class="form-control" rows="3"
					placeholder="Nhập bình luận ..." required></textarea>
				<input class="btn btn-primary pull-right"
					style="margin-top: 10px; margin-bottom: 10px" type="submit"
					value="Bình luận">
			</form>
			<div class="comment-detail panel panel-group"
				style="margin-top: 55px;">
				<div class="panel panel-default">
					<div class="panel-body">
						<img class="avatar" src="resource/image/cm.jpg" alt="user avatar">
						<p>bình luận của người dùng ở đây</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>