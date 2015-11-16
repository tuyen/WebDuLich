<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="model.ModelUser"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Travel</title>


<link href="view/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/css_sign_up.css" rel="stylesheet">
<script type="text/javascript" src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="view/resource/lib/jquery-home.min.js"></script>
<script type="text/javascript" src="view/resource/lib/jquery-sign-up.js"></script>





</head>
<body>

	<jsp:include page="body-header.jsp" />


	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

				<img
					src="http://1.bp.blogspot.com/-sMqkkSiIfsw/TzajOCuIXaI/AAAAAAAAELo/2ShDwod_yCw/s1600/Lago_Dalat.jpg"
					alt="" class="img-responsive">



			</div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<img
					src="http://1.bp.blogspot.com/-sMqkkSiIfsw/TzajOCuIXaI/AAAAAAAAELo/2ShDwod_yCw/s1600/Lago_Dalat.jpg"
					alt="" class="img-responsive"> abcd <br /> abcd <br /> abcd
				<br /> abcd <br /> abcd <br /> abcd <br /> abcd <br /> abcd <br />
				abcd <br />


			</div>
		</div>
	</div>
	<jsp:include page="body-footer.jsp" />
<%
	String login_check = (String)request.getAttribute("login_status");
	if (("not_ok").equals(login_check))
	{
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
%>

</body>
</html>