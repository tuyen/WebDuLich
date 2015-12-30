<%@page import="java.util.List"%>
<%@page import="model.ModelPost"%>
<%@page import="dto.dtoPost"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="model.ModelUser"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Truy cập bị từ chối - Banana Tour</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />

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
	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<center>
			<h1>Bạn không có quyền truy cập trang này!</h1>
			<h1>Vui lòng liên hệ người quản trị để biết thêm thông tin.</h1>
		</center>
	</div>

	<jsp:include page="body-footer.jsp" />
	<jsp:include page="notify.jsp" />

</body>
</html>