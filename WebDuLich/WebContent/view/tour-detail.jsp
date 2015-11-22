<%@page import="utility.LoginUtility"%>
<%@page import="model.ModelBookedTour"%>
<%@page import="model.ModelComment"%>
<%@page import="dto.dtoComment"%>
<%@page import="model.ModelUser"%>
<%@page import="dto.dtoUser"%>
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
	dtoPost post = mdPost.getPost(postId, cate);
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
<!-- <link href="view/resource/css/view-tour.css" rel="stylesheet"> -->
<link href="view/resource/css/view-detail.css" rel="stylesheet">
<script type="text/javascript" src="view/resource/lib/tour-utility.js"></script>
</head>
<body>

	<!-- body header -->
	<jsp:include page="body-header.jsp" />
	<!-- Content -->
	<div class="container" style="width: 80%">
		<div class="row">
			<div class="col-md-8">
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
																	out.write("<div class='active item' data-slide-number='"
																			+ ++i + "'>");
																	i++;
																} else
																	out.write("<div class='item' data-slide-number='" + ++i
																			+ "'>");
																out.write("<img width = '100%'  alt='not found' src='" + src
																		+ "'>");
																out.write("</div>");
															}
						%>
					</div>
				</div>
			</div>
			<div class="row col-md-4">
				<div>
					<h3 class="text-left" style="color: #90D1EF"><%=post.getTitle()%>
					</h3>
				</div>
				<div>
					<p class="text-left">
						Giá tour:
						<%=post.getPrice()%>
					</p>
				</div>
				<div>
					<p class="text-left">
						Số người:
						<%=post.getNumberPeople()%>
					</p>
				</div>
				<div>
					<p class="text-left">
						Thời gian:
						<%=post.getTotalTime()%>
					</p>
				</div>
				<div>
					<p class="text-left">
						Công ty lữ hành:
						<%
						out.write(mdUser.getCompanyNameByUserId(post.getUserId()));
					%>
					</p>
				</div>
				<div style="margin-top: 10px">
					<%
						ModelBookedTour mdBTour = new ModelBookedTour();
												LoginUtility login = new LoginUtility();
												if (login.isLogged(request, response)) {
													if (mdBTour.checkBookedTourStatus(login.getLoggedUserID(),
															postId)) {
														out.write("<button id = 'book_tour' type='submit' class='btn btn-primary' value='0' onclick='bookTour("
																+ cate
																+ " , "
																+ postId
																+ ")' data-toggle='tooltip' data-placement='right'	title='Báo đơn vị lữ hành liên hệ với bạn ngay!'/> Hủy đặt tour </button>");
													} else
														out.write("<button id = 'book_tour' type='submit' class='btn btn-primary' value='1' onclick='bookTour("
																+ cate
																+ " , "
																+ postId
																+ ")' data-toggle='tooltip' data-placement='right'	title='Báo đơn vị lữ hành liên hệ với bạn ngay!'/> Đặt tour </button>");
												} else
													out.write("<button id = 'book_tour' type='submit' class='btn btn-primary' value='1' onclick='bookTour("
															+ cate
															+ " , "
															+ postId
															+ ")' data-toggle='tooltip' data-placement='right'	title='Báo đơn vị lữ hành liên hệ với bạn ngay!'/> Đặt tour </button>");
					%>

				</div>
				<div>
					<i style="color: red" id="book_status"></i>
				</div>
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
										if (++j >= 10)
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
			<div class="form form-group">
				<form class="form form-group" role="form" method="post"
					action="postdetail">
					<input type="hidden" name="txt_postId" value="<%=postId%>">
					<input type="hidden" name="txt_cate" value="<%=cate%>">
					<textarea class="form-control" rows="3"
						placeholder="Nhập bình luận ..." required name="txt_comment"></textarea>
					<input class="btn btn-primary pull-right" name="btn_comment"
						style="margin-top: 10px; margin-bottom: 10px" type="submit"
						value="Bình luận">
				</form>
			</div>
			<div class="comment-detail panel panel-group" id="comment_list"
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
													+ mdUser.getAvatarByCommentId(comment
															.getCommentId()) + "' alt='user avatar'>");
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