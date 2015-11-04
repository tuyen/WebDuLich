<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Travel</title>

<link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resource/css/css_home.css" rel="stylesheet">
<link href="resource/css/css_sign_up.css" rel="stylesheet">
<script type="text/javascript" src="resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/lib/jquery-home.min.js"></script>
<script type="text/javascript" src="resource/lib/jquery-sign-up.js"></script>




</head>
<body>
	<jsp:include page="body-header.jsp" />

	<!-- Begin Body -->
	<div style="margin-bottom: %"></div>
	<div class="container">


		<div class="row">
			<div class="col-xs-3"></div>
			<div class="col-xs-6" style="margin-bottom: 2%">
				<div class="col-xs-12">
					<h3>Welcome to ,,,</h3>
				</div>
				<form id="signupForm" method="POST" action="#hahaha" onsubmit="return CheckPassword()">
					<br />
					<div class="input-group">
						<span class="input-group-addon "> <i
							class="icon-envelope icon-2x glyphicon glyphicon-user"></i>
						</span>
						<input id="user_name" class="form-control input-lg"
							placeholder="Full name" required="required" maxlength="100"
							type="text" name="user_name" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon "> <i
							class="icon-envelope icon-2x glyphicon glyphicon-envelope"></i>
						</span>
						<input id="email" class="form-control input-lg"
							placeholder="Email" required="required" maxlength="100"
							type="text" name="email" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="icon-asterisk icon-2x glyphicon glyphicon-asterisk"></i>
						</span>
						<input id="password" class="form-control input-lg"
							placeholder="Password" required="required" maxlength="60"
							type="password" name="password">
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="icon-asterisk icon-2x glyphicon glyphicon-asterisk"></i>
						</span>
						<input id="password_confirmation" class="form-control input-lg"
							placeholder="Confirm Password" required="required" maxlength="60"
							type="password" name="password_confirmation">
					</div>
					<div class="input-group" class="radio">
						<span style=""> <strong>Loại tài khoản:</strong>
							&nbsp;&nbsp; <label style="cursor:pointer"> <input type="radio"
									name="accout_type" value="personal" checked> Cá nhân
						</label>&nbsp;&nbsp;&nbsp; <label style="cursor:pointer"> <input type="radio"
									name="accout_type" value="company"> Công ty / Tổ chức
						</label>
						</span>
					</div>
					<div class="form-group">
						<button type="submit" id="btn-signup"
							class="btn btn-block btn-primary btn-lg">Sign Up</button>
					</div>
				</form>
				<div class="col-xs-3"></div>
			</div>
		</div>
	</div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>