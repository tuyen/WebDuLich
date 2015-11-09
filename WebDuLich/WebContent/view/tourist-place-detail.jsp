<%@page import="model.ModelComment"%>
<%@page import="dto.dtoComment"%>
<%@page import="model.ModelUser"%>
<%@page import="java.util.List"%>
<%@page import="dto.dtoPost"%>
<%@page import="model.ModelPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ModelPost mdPost = new ModelPost();
	String postId = request.getParameter("post");
	String cate = request.getParameter("cate");
	//get requested post
	dtoPost post = mdPost.getPostById(postId);
	//get all image of requested post
	List<String> listSrc = mdPost.getImagesFromPost(postId);
	//get concerning post
	List<dtoPost> listPost = null;
	listPost = mdPost.getAllPostByCategory(cate);
	//get all comment concerning
	List<dtoComment> listComment = null;
	ModelComment mdComment = new ModelComment();
	listComment = mdComment.getAllComment(postId);

	ModelUser mdUser = new ModelUser();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=post.getTitle()%></title>
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
	<jsp:include page="body-header.jsp" />
	<!-- Content -->
	<div class="container" style="width: 80%;">
		<div id="carousel" class="carousel slide" data-ride="carousel"
			data-pause="false" data-interval="3000">
			<ol class="carousel-indicators">
				<%
					for (int i = 0; i < listSrc.size(); i++) {
						if (i == 0)
							out.write("<li data-target='#carousel' data-slide-to='" + i
									+ "' class='active'></li>");
						else
							out.write("<li data-target='#carousel' data-slide-to='" + i
									+ "'></li>");
					}
				%>
			</ol>
			<div class="carousel-inner" role="listbox">
				<%
					int i = 0;
					for (String src : listSrc) {
						if (i == 0) {
							out.write("<div class='active item' data-slide-number='0'>");
							i++;
						} else
							out.write("<div class='item' data-slide-number='0'>");
						out.write("<img width = '100%' style = 'max-height: 418px;'height = '418' alt='not found' style='z-index: 0'src='"
								+ src + "'>");
						out.write("<div class='carousel-caption'>");
						out.write("<h2 class='text-center'>" + post.getTitle()
								+ "</h2>");
						out.write("<p class='text-center'>" + post.getShortContent()
								+ "</p>");
						out.write("</div>");
						out.write("</div>");
					}
				%>
			</div>
		</div>
		<hr>
		<br>
		<div class="row">
			<div class="col-md-8">
				<div class="content">
					<%
						out.write(post.getContent());
					%>
				</div>
			</div>
			<div class="col-md-4">
				<label>Có thể bạn quan tâm</label>
				<%
					int j = 0;
					for (dtoPost p : listPost) {
						if (!p.getPostId().equals(postId)) {
							out.write("<div class='panel' style='width: 100%; margin-bottom:10px;'>");
							out.write("<div class='panel-body'>");
							out.write("<a href='" + request.getContextPath()
									+ "/postdetail?cate=" + cate + "&post="
									+ p.getPostId()
									+ "'><img class='img-responsive' src='"
									+ mdPost.getImagesFromPost(p.getPostId()).get(0)
									+ "'></a>");
							out.write("</div>");
							out.write("<div class='panel-footer'>");
							out.write("<a href='" + request.getContextPath()
									+ "/postdetail?cate=" + cate + "&post="
									+ p.getPostId() + "'>" + p.getTitle() + "</a>");
							out.write("</div></div>");
						}
						if (++j >= 5)
							break;
					}
				%>
			</div>
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
				<%
					if (listComment.size() == 0) {
						out.write("<div class='panel panel-default'>");
						out.write("<div class='panel-body'>");
						out.write("<p>Chưa có bình luận nào</p>");
						out.write("</div></div>");
					} else
						for (dtoComment comment : listComment) {
							out.write("<div class='panel panel-default'>");
							out.write("<div class='panel-body'>");
							out.write("<img class='avatar' src='"
									+ mdUser.getAvatarByCommentId(comment.getCommentId())
									+ "' alt='user avatar'>");
							out.write("<p>" + comment.getContent() + "</p>");
							out.write("</div></div>");
						}
				%>
			</div>
		</div>
	</div>
	<!-- body footer -->
	<jsp:include page="body-footer.jsp"></jsp:include>
	<!-- go to top button -->
	<span class="top"></span>
</body>
</html>