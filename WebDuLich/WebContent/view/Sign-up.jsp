<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Travel</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />
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
	<div style="margin-top:"></div>
	<div class="container" >
		<center><h3>Welcome to Banana Tour</h3></center>
		
		
		<center>
		<form id="signupForm" onsubmit="return checkSubmit()" method="POST" action="sign-up">
			<br />
			
			<i id ="hintEmailExist" style="color:#E82626"></i>
			<div class="input-group">
				<span class="input-group-addon "> <i
					class="icon-envelope icon-2x glyphicon glyphicon-envelope"></i>
				</span>				
				<input id="email" class="form-control input-lg"
					placeholder="Email" required="required" maxlength="100"
					type="email" name="email" value="">
			</div>
			<div class="input-group">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-asterisk"></i>
				</span>
				<input id="password" class="form-control input-lg"
					placeholder="Mật khẩu" required="required" maxlength="60"
					type="password" name="password">
			</div>
      		<i id ="hintPassword" style="color:#E82626"></i>
			<div class="input-group">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-asterisk"></i>
				</span>
				<input id="password_confirmation" class="form-control input-lg"
					placeholder="Xác nhận mật khẩu" required="required" maxlength="60"
					type="password" name="password_confirmation"  >
			</div>
			<div class="input-group">
				<span class="input-group-addon "> <i
					class="icon-envelope icon-2x glyphicon glyphicon-user"></i>
				</span>
				<input id="user_name" class="form-control input-lg"
					placeholder="Họ Tên" required="required" maxlength="100"
					type="text" name="user_name" value="">
			</div>
			<div class="input-group">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-home"></i>
				</span>
				<input id="address" class="form-control input-lg"
					placeholder="Địa chỉ" required="required" maxlength="60"
					type="text" name="address"  >
			</div>
			<div class="input-group">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-earphone"></i>
				</span>
				<input id="phone" class="form-control input-lg"
					placeholder="Số điện thoại" required="required" maxlength="60"
					type="tel" pattern="[0-9]{4,11}"   name="phone"  >
			</div>
			<div class="input-group" class="radio">
				<span style=""> <strong>Loại tài khoản:</strong>
					&nbsp;&nbsp; <label style="cursor:pointer"> <input id ="account_personal" type="radio"
							name="account_type" value="personal" checked > Cá nhân
				</label>&nbsp;&nbsp;&nbsp; <label style="cursor:pointer"> <input id ="account_company" type="radio"
							name="account_type" value="company" > Công ty 
				</label>
				</span>
			</div>
			<div class="input-group" id="company1">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-briefcase"></i>
				</span>
				<input id="company_name" class="form-control input-lg"
					placeholder="Tên công ty" required="required" maxlength="60"
					type="text" name="company_name"  >
			</div>
			<div class="input-group" id="company2">
				<span class="input-group-addon"> <i
					class="icon-asterisk icon-2x glyphicon glyphicon-pencil"></i>
				</span>
				<textarea id="company_description" data-autoresize rows="2"  class="form-control input-lg"
					placeholder="Mô tả công ty" required="required" maxlength="150"
					name="company_description" style=""></textarea> 
			</div>
			
			<div class="form-group">
				<button type="submit" id="btn-signup"   
					class="btn btn-block btn-primary btn-lg">Sign Up</button>
			</div>
		</form>
		</center>
	</div>
	<div style="margin-bottom:60px"></div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>