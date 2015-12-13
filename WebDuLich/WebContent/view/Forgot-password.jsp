<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot password</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">


<script type="text/javascript"
	src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-home.min.js"></script>
<script type="text/javascript"
	src="view/resource/lib/jquery-forgot-password.js"></script>

</head>
<body>
	<jsp:include page="body-header.jsp" />


	<!-- Begin Body -->
	<div style="margin-bottom: 5%"></div>
	<div class="container">


		<div class="row">
			<div class="col-xs-3"></div>
			<div class="col-xs-6" style="margin-bottom: 20%">
				<div class="col-xs-12">
					<h2>Vui lòng nhập email đã đăng kí để hệ thống cấp lại mật khẩu cho bạn!</h2>
				</div>
				<form id="emailForm"  method="POST" action="ControllerForgotPassword" accept-charset="UTF-8">
					<i id="hintError" style="color:#E82626"></i>
					<div class="input-group" style="margin-bottom:10px">
						<span class="input-group-addon "> <i
								class="icon-envelope icon-2x glyphicon glyphicon-envelope"></i>
						</span>
						
						<input id="email" class="form-control input-lg"
							placeholder="Email" required="required" width=100%
							maxlength="100" type="text" name="email"  >
					</div>
					<div>
					<button type="submit" id="btn-submit-email"
						class="btn btn-block btn-primary btn-lg">Cấp lại mật khẩu</button>
					</div>
				</form>
			<div class="col-xs-3"></div>
		</div>
	</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="footer">

	</div>

</body>
</html>