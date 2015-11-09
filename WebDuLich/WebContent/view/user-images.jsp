
<%@page import="org.apache.catalina.tribes.util.UUIDGenerator"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>User image</title>


<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<script type="text/javascript"
	src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>
</head>
<body>
	<jsp:include page="body-header.jsp" />

	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row">

			<!-- .column 1-->
			<div class="col-md-2"></div>
			<!-- /.column 1-->
			<!-- .column 2-->
			<div class="col-md-8">
				
				<div class="panel panel-default">
					<div class="panel-body">
						<center>
						<h4>Hình ảnh của bạn</h4>
						<br>
						<%
							try {
								List<String> urls = (List<String>) request
										.getAttribute("url_image");
								if(urls.size() == 0)
								{
									out.print("<p>Bạn chưa có hình ảnh nào</p>");	
								}									
								for(String i : urls)
								{									
									out.print("<a href='"+request.getContextPath() + i);
									out.print("'> <img src='"+ request.getContextPath() + i+"' width='200' height='200'></a>");
								}
							} catch (Exception i) {
								out.print("hihi");
							}
						%>
						</center>
					</div>
				</div>
			</div>

		</div>
		<!-- /.column 2-->
		<!-- .column 3-->
		<div class="col-md-2"></div>

	</div>
	</div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>




