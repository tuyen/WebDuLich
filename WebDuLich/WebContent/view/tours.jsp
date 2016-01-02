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
	String placeId = request.getParameter("place");
	if(placeId.equals("Tỉnh thành"))
		placeId = null;	
	String companyId = request.getParameter("tourist");
	if(companyId.equals("Công ty lữ hành"))
		companyId = null;
	if (placeId != null && companyId != null) //search both place and company
	{
		listPost = mdPost.SearchTours(placeId, companyId, 10,
				(cur_page - 1) * 10);
	} else if (placeId != null) //search place
	{
		listPost = mdPost.SearchToursByLocation(placeId, 10,
				(cur_page - 1) * 10);
	} else if (companyId != null) //search company
	{
		listPost = mdPost.SearchToursByCompany(companyId, 10,
				(cur_page - 1) * 10);
	} else //no searching
		listPost = mdPost.getPosts("1", 10, (cur_page - 1) * 10);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tour mới - Banana Tour</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />
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
</head>

<body>
	<!-- body header -->
	<jsp:include page="body-header.jsp"></jsp:include>
	<!-- body content -->
	<div class="container" style="width: 80%;">

		<div class="panel panel-body my-panel">
			<lable class="text-left"> <i>Tìm kiếm tour du lịch</i></lable>
			<center>
				<form action="tours" method="GET" style="margin: 10px" class="form"
					role="form">
					<div class="form-group">
						<table width="80%">
							<thead>
								<tr>
									<td style="padding-left: 25px;"><label for="place">Tỉnh
											thành</label></td>
									<td style="padding-left: 25px;"><label for="tourist">Công
											ty lữ hành</label></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 25px;"><select
											class="form-control " id="place" name="place">
											<option>Tỉnh thành</option>
											<%
												for (dtoLocation location : listLocation) {
													if (location.getLocationId().equals(placeId))
														out.write("<option selected value = '"
																+ location.getLocationId() + "'>"
																+ location.getName() + "</option>");
													else
														out.write("<option value = '" + location.getLocationId()
																+ "'>" + location.getName() + "</option>");
												}
											%>
										</select></td>

									<td style="padding-left: 25px;"><select
											class="form-control " id="tourist" name="tourist">
											<option>Công ty lữ hành</option>
											<%
												for (String company : listCompany) {
													if (company.equals(companyId))
														out.write("<option selected value = '" + company + "'>"
																+ company + "</option>");
													else
														out.write("<option value = '" + company + "'>" + company
																+ "</option>");
												}
											%>
										</select></td>
									<td><div class="btn-group" style="float: right">
											<button type="submit" id="btnSearch" class="btn btn-default">Tìm
												kiếm</button>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</center>
		</div>
		<hr>
		<!-- list tour -->
		<ul class='list-inline' style='margin: 0 auto; width: 100%;'>
			<%
				if (listPost.size() == 0)
					out.write("<center> <h2> Rất tiếc chưa có tour nào thỏa mãn yêu cầu của bạn!");
				else
					for (dtoPost post : listPost) {
						out.write("<li class='post'style = 'width:50%'> ");
						out.write("<div class = 'panel'style = 'width:100%'> ");
						out.write("<div class = 'panel-body'>");
						out.write("<div id='carousel-" + post.getPostId()
								+ "' class='carousel slide' data-ride='carousel'>");
						out.write("<div class='carousel-inner'role='listbox'>");
						List<String> listSrc = mdPost.getImagesFromPost(
								post.getPostId(), 3);
						int i = 0;
						for (String src : listSrc) {
							if (++i == 1)
								out.write("<div data-slide-number='"
										+ i
										+ "' class='active item'> <a href = '"
										+ request.getContextPath()
										+ "/detail?cate=1&post="
										+ post.getPostId()
										+ "'><img class='img-responsive' width = '100%'alt='not found'src='"
										+ src + "'></a></div>");
							else
								out.write("<div data-slide-number='"
										+ i
										+ "' class='item'><a href = '"
										+ request.getContextPath()
										+ "/detail?cate=1&post="
										+ post.getPostId()
										+ "'><img class='img-responsive' width = '100%'alt='not found'src='"
										+ src + "'></a></div>");
						}
						out.write("</div></div>");
						out.write("<div class = 'panel-footer'>");
						out.write("<div style='font-size: 17px;'>");
						out.write("<a href='" + request.getContextPath()
								+ "/detail?cate=1&post=" + post.getPostId()
								+ "'> <p class = 'title-overflow' >"
								+ post.getTitle() + " </p></a>");
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

		<!-- pagination -->

		<%
			int pages = mdPost.getCountPost() / 10;
			//if(mdPost.getCountPost() % 10 != 0)
				pages += 1;
			if (pages > 1) {
		%>
		<nav>
		<ul class="pagination pull-right">
			<%
				int _page = 1;
				String link = "/tours?";
				if(placeId != null && companyId != null)
					link +="place=" + placeId + "&tourist=" + companyId;
				else if(companyId == null)
					link +="place=" + placeId;
				else if(placeId == null)
					link +="tourist=" + companyId;
					while (pages >= _page) {
						if (cur_page == _page)
							out.write("<li class = 'active'><a href='"
									+ request.getContextPath() + link + "&page="
									+ _page + "'>" + _page + "</a></li>");
						else
							out.write("<li><a href='" + request.getContextPath()
									+ link + "&page=" + _page + "'>" + _page
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