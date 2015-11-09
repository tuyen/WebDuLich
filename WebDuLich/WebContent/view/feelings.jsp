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

	int cur_page = 1;
	if (request.getParameter("page") != null)
		cur_page = Integer.parseInt(request.getParameter("page"));

	List<dtoPost> listPost = null;
	ModelPost mdPost = new ModelPost();
	listPost = mdPost
			.getAllPostByCategory("3", 10, (cur_page - 1) * 10);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cảm nhận của du khách</title>
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
			<h3>Cảm nhận của du khách</h3>
		</div>
		<br>
		<hr>
		<br>
		<!-- list tour -->
		<ul class='list-inline' style='margin: 0 auto; width: 100%;'>
			<%
				if (listPost.size() == 0) {
					out.write("<div class = 'panel panel-body'> <h4> Chưa có bài cảm nhận nào!!! Bạn hãy là người đầu tiên <a href=''> viết cảm nhận </a> nhé :) </h4> </div>");
				}
				for (dtoPost post : listPost) {
					out.write("<li class='post'style = 'width:50%'> ");
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

		<!-- pagination -->

		<%
			int pages = mdPost.getCountPost("3") / 10 + 1;
			if (pages > 1) {
		%>
		<nav>
		<ul class="pagination pull-right">
			<%
				int _page = 1;
					while (pages >= _page) {
						if (cur_page == _page)
							out.write("<li class = 'active'><a href='"
									+ request.getContextPath() + "/feelings?page="
									+ _page + "'>" + _page + "</a></li>");
						else
							out.write("<li><a href='" + request.getContextPath()
									+ "/feelings?page=" + _page + "'>" + _page
									+ "</a></li>");
						_page++;
					}
			%>
		</ul>
		</nav>
		<%
			}
		%>
	</div>
	<!-- body footer -->
	<jsp:include page="body-footer.jsp"></jsp:include>
	<!-- go to top button -->
	<span class="top"></span>
</body>
</html>