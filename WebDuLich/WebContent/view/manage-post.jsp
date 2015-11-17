<%@page import="utility.LoginUtility"%>
<%@page import="dto.dtoPost"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.dtoCategory"%>
<%@page import="java.util.List"%>
<%@page import="model.ModelPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	LoginUtility login = new LoginUtility();
	ModelPost mdPost = new ModelPost();

	//get category list
	List<dtoCategory> listCate = new ArrayList<dtoCategory>();
	listCate = mdPost.getAllCategory();

	String strCate = request.getParameter("cate");
	List<dtoPost> listPost = null;
	if (strCate != null)
		listPost = mdPost.getAllPostByCategory(strCate);
	else
		listPost = mdPost.getAllPostByCategory("1");
	List<String> listSrc = new ArrayList<String>();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quản lý bài đăng</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jquery -->
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>

<!-- boostrap -->
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>

<!-- datatable -->
<link
	href="view/resource/DataTables-1.10.9/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="view/resource/DataTables-1.10.9/js/jquery.dataTables.min.js"></script>

<!-- custom css & javasript -->
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/view-tour.css" rel="stylesheet">
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>

<script src="view/resource/lib/tour-utility.js"></script>

</head>
<body>
	<!-- body header -->
	<jsp:include page="body-header.jsp" />

	<!-- body content -->

	<div class="container" style="width: 80%">
		<%
			if (!login.isLogged(request, response)) {
		%>
		<div>
			<p style="color: red">Bạn chưa đăng nhập, vui lòng đăng nhập để
				sử dụng chức năng này!</p>
		</div>
		<%
			} else {
		%>
		<div class="text-right">
			<div class="separator">
				<h3>DANH MỤC BÀI ĐÃ ĐĂNG</h3>
				<form action="" style="margin-bottom: 10px">
					<div class="btn-group">
						<%
							if (request.getParameter("cate") != null)
									out.write("<button class='btn btn-default dropdown-toggle' type='button' data-toggle='dropdown' style='width: 100%'>"
											+ listCate.get(Integer.parseInt(strCate) - 1)
													.getName()
											+ " <span class='caret'></span></button>");
								else
									out.write("<button class='btn btn-default dropdown-toggle' type='button' data-toggle='dropdown' style='width: 100%'> Thể loại <span class='caret'></span></button>");
						%>
						<ul class="dropdown-menu">
							<%
								for (dtoCategory cate : listCate)
										out.print("<li>	<a href='" + request.getContextPath()
												+ "/postmanager?cate=" + cate.getCategoryId()
												+ "'>" + cate.getName() + "</a></li>");
							%>
						</ul>
					</div>
				</form>
			</div>

		</div>

		<br> <br>
		<center>
			<table id="tpost"
				class="table table-striped table-bordered table-hover " width="100%">
				<thead>
					<tr>
						<th width="20%">Ngày đăng</th>
						<th width="65%">Tên bài đăng</th>
						<th width="15%">Tùy chọn</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (dtoPost p : listPost) {
								out.write("<tr>");
								out.write("<td>" + p.getPostDate() + "</td>");
								out.write("<td><b font-size = '20px'><a href= '"
										+ request.getContextPath() + "/postdetail?cate="
										+ p.getCategoryId() + "&post=" + p.getPostId()
										+ "'>" + p.getTitle() + "</a></b>");
								out.write("<p>" + p.getShortContent() + " ...</p></td>");
								out.write("<td style = 'font-size:15px'>");
								out.write("<a style = 'margin-left:20px;' 	href = '#' class = 'btn btn-warning' data-tooltip = 'tooltip' title = 'Chỉnh sửa'><span class = 'glyphicon glyphicon-edit'></span></a>");
								out.write("<a style = 'margin-left:20px;' href = '#' class = 'btn btn-danger' data-tooltip = 'tooltip' title = 'Xóa'><span class = 'glyphicon glyphicon-remove'></span></a>");
								out.write("</td>");
								out.write("</tr>");
							}
					%>
				</tbody>
			</table>
		</center>
		<%
			}
		%>
	</div>
	<!-- body footer -->
	<jsp:include page="body-footer.jsp" />
	<!-- go to top button -->
	<span class="top"></span>
</body>
</html>