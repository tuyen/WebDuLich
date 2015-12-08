<%@page import="java.util.List"%>
<%@page import="model.ModelPost"%>
<%@page import="dto.dtoPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="model.ModelUser"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Travel</title>


<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<script type="text/javascript"
	src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>
<link href="view/resource/css/view-tour.css" rel="stylesheet">
<link href="view/resource/css/view-detail.css" rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">




</head>
<body>

	<jsp:include page="body-header.jsp" />
<%
	List<dtoPost> listFeeling = null;
	List<dtoPost> listPostLocation = null;
	List<dtoPost> listPostTour = null;
	ModelPost mdPost = new ModelPost();
	listPostTour = mdPost.getPosts("1", 6, 0);
	listPostLocation = mdPost.getPosts("2", 6, 0);
	listFeeling = mdPost.getPosts("3", 6, 0);	
%>

	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row">
			<div class="separator" style="margin: 10px 0 0 0;width: 100%;">
				<a href="tours"><h3 style="font: italic bold 18px/30px Georgia, serif;">Tours
					mới</h3></a>
			</div>
			<br /> <br />
			<ul class='list-inline' style='margin: 0 auto; width: 100%; ' >
			<%
				for (dtoPost post : listPostTour) {
					out.write("<li class='post'style = 'width:33.33333333333333333333333333333333%'> ");
					out.write("<div class = 'panel'style = 'width:100%'> ");
					out.write("<div class = 'panel-body'");
					out.write("<div id='carousel-" + post.getPostId()
							+ "' class='carousel slide'data-ride='carousel'>");
					out.write("<div class='carousel-inner'role='listbox'>");
					List<String> listSrc = mdPost.getImagesFromPost(
							post.getPostId(), 3);
					int i = 0;
					for (String src : listSrc) {
						if (++i == 1)
							out.write("<div class='active item' height='30%'><img   width = '100%'alt='not found'src='"
									+ src + "'></div>");
						else
							out.write("<div class='item' height='30%'><img  width = '100%' alt='not found'src='"
									+ src + "'></div>");
					}
					out.write("</div></div>");
					out.write("<div class = 'panel-footer'>");
					out.write("<div style='font-size: 17px;'>");
					out.write("<a href='" + request.getContextPath()
							+ "/postdetail?cate=1&post=" + post.getPostId() + "'> "
							+ post.getTitle() + " </a>");
					out.write("<table width='100%' style = 'margin-top:10px;'><tr>");
					out.write("<td width='50%'<p data-toggle='tooltip' title='Giá tour "
							+ post.getPrice()
							+ "'><span class='glyphicon glyphicon-usd' style='color: #3399FF'></span> "
							+ post.getPrice() + "</p><td>");
					out.write("<td><p data-toggle='tooltip' title='"
							+ post.getViews()
							+ " người đã xem'><span class='glyphicon glyphicon-eye-open' style='color: #3399FF'></span> "
							+ post.getViews() + "</p></td>");
					out.write("<td><p data-toggle='tooltip' title='Đã có "
							+ post.getBuys()
							+ " người mua tuor này'><span class='glyphicon glyphicon-shopping-cart'	style='color: #3399FF'></span> "
							+ post.getBuys() + "</p></td></tr></table>");
					out.write("</div></div></div></li>");
				}
			%>
			</ul>



			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
				style="width: 102.5%; margin: 20px 0px 10px -13px">
				<div class="separator" style="margin: 10px 0 0 0">
					<a href="touristplace"><h3 style="font: italic bold 18px/30px Georgia, serif;">Các
						điểm du lịch</h3></a>
				</div>
			</div>
			<br /> <br />
			<ul class='list-inline' style='margin: 0 auto; width: 100%;'>
			<%
				for (dtoPost post : listPostLocation) {
					out.write("<li class='post'style = 'width:33.333333333333333333333333333333333%'> ");
					out.write("<div class = 'panel'style = 'width:100%'> ");
					out.write("<div class = 'panel-body'");
					out.write("<div id='carousel-" + post.getPostId()
							+ "' class='carousel slide'data-ride='carousel'>");
					out.write("<div class='carousel-inner'role='listbox'>");
					List<String> listSrc = mdPost.getImagesFromPost(
							post.getPostId(), 3);
					int i = 0;
					for (String src : listSrc) {
						if (++i == 1)
							out.write("<div class='active item'><img class='img-responsive' width = '100%'alt='not found'src='"
									+ src + "'></div>");
						else
							out.write("<div class='item'><img class='img-responsive' width = '100%' alt='not found'src='"
									+ src + "'></div>");
					}
					out.write("</div></div>");
					out.write("<div class = 'panel-footer'>");
					out.write("<div style='font-size: 17px;'>");
					out.write("<a href='" + request.getContextPath()
							+ "/postdetail?cate=2&post=" + post.getPostId() + "'> "
							+ post.getTitle() + " </a>");
					out.write("<table width='100%' style = 'margin-top:10px;'><tr>");
					out.write("<td><p data-toggle='tooltip' title='"
							+ post.getViews()
							+ " người đã xem'><span class='glyphicon glyphicon-eye-open' style='color: #3399FF'></span> "
							+ post.getViews() + "</p></td></tr></table>");
					out.write("</div></div></div></li>");
				}
			%>
			</ul>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
				style="width: 102.5%; margin: 20px 0px 10px -13px">
				<div class="separator" style="margin: 10px 0 0 0">
					<a href="feelings"><h3 style="font: italic bold 18px/30px Georgia, serif;">Cảm nhận của du khách</h3></a>
				</div>
			</div>
			<br /> <br />
			<ul class='list-inline' style='margin: 0 auto; width: 100%;'>
			<%
				if (listFeeling.size() == 0) {
					out.write("<div class = 'panel panel-body'> <h4> Chưa có bài cảm nhận nào!!! Bạn hãy là người đầu tiên <a href=''> viết cảm nhận </a> nhé :) </h4> </div>");
				}
				for (dtoPost post : listFeeling) {
					out.write("<li class='post'style = 'width:33.33333333333333333333333333333%'> ");
					out.write("<div class = 'panel'style = 'width:100%'> ");
					out.write("<div class = 'panel-body'");
					out.write("<div id='carousel-" + post.getPostId()
							+ "' class='carousel slide'data-ride='carousel'>");
					out.write("<div class='carousel-inner'role='listbox'>");
					List<String> listSrc = mdPost.getImagesFromPost(
							post.getPostId(), 3);
					int i = 0;
					for (String src : listSrc) {
						if (++i == 1)
							out.write("<div class='active item'><img class='img-responsive' width = '100%'alt='not found'src='"
									+ src + "'></div>");
						else
							out.write("<div class='item'><img class='img-responsive' width = '100%' alt='not found'src='"
									+ src + "'></div>");
					}
					out.write("</div></div>");
					out.write("<div class = 'panel-footer'>");
					out.write("<div style='font-size: 17px;'>");
					out.write("<a href='" + request.getContextPath()
							+ "/postdetail?cate=3&post=" + post.getPostId() + "'> "
							+ post.getTitle() + " </a>");
					out.write("<table width='100%' style = 'margin-top:10px;'><tr>");
					out.write("<td><p data-toggle='tooltip' title='"
							+ post.getViews()
							+ " người đã xem'><span class='glyphicon glyphicon-eye-open' style='color: #3399FF'></span> "
							+ post.getViews() + "</p></td></tr></table>");
					out.write("</div></div></div></li>");
				}
			%>
		</ul>
		</div>
	</div>

	<jsp:include page="body-footer.jsp" />
	<%
		String login_check = (String) request.getAttribute("login_status");
		String active = (String) request.getAttribute("active");
		if (("not_ok").equals(login_check)) {
			String p1 = "<script type=\"text/javascript\">";
			String p2 = "$(document).ready(function(){";
			String p3 = "alert('Email đăng nhập hoặc mật khẩu không đúng!');";
			String p4 = "});";
			String p5 = "</script>";

			out.println(p1);
			out.println(p2);
			out.println(p3);
			out.println(p4);
			out.println(p5);

		}
		if ("not_yet".equals(active)) {
			String p1 = "<script type=\"text/javascript\">";
			String p2 = "$(document).ready(function(){";
			String p3 = "alert('Bạn phải xác thực tài khoản trước khi đăng nhập!');";
			String p4 = "});";
			String p5 = "</script>";

			out.println(p1);
			out.println(p2);
			out.println(p3);
			out.println(p4);
			out.println(p5);
		}
	%>

</body>
</html>