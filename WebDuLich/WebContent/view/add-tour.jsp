<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="view/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="view/resource/css/css_home.css" rel="stylesheet">
<link href="view/resource/css/add_tour.css" rel="stylesheet">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="view/resource/lib/jquery-sign-in.min.js"></script>
<script src="view/resource/ckeditor/ckeditor.js"></script>
</head>

<body>


	<!--.start-->
	<div class="container" id="content-padding-top">

		<!-- .Navigation bar 1 -->
		<nav class=" navbar-fixed-top sticky menu-format-text">
		<ul class="nav navbar-nav navbar-custom">
			<a href=""><img style="float: left; margin: 3px 100px 0px 3px"
				src="http://wil-travel.com/view/skin1/image/hot_tour.jpg" alt=""
				width="50px" height="50px"></a>
			<!-- <li ><a href=""><img src="http://wil-travel.com/view/skin1/image/hot_tour.jpg" alt="" width="50px" height="50px" ></a></li> -->
			<li class="active" id="menu-padding-1"><a href=""><span
					class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
			<li id="menu-padding-1"><a href=""><span
					class="glyphicon glyphicon-hand-right"></span> Tour mới</a></li>
			<li id="menu-padding-1"><a href=""><span
					class="glyphicon glyphicon-hand-right"></span> Tour hot</a></li>
			<li id="menu-padding-1"><a href=""><span
					class="glyphicon glyphicon-hand-right"></span> Điểm du lịch</a></li>
			<li id="menu-padding-1"><a href=""><span
					class="glyphicon glyphicon-hand-right"></span> Điểm du lịch hot</a></li>
			<li id="menu-padding-2"><a href="/users/sign_up">Sign Up</a></li>
			<!-- <li class ="divider-vertical" ></li> -->
			<li class="dropdown" id="menu-padding-1"><a
				class="dropdown-toggle" href="#" data-toggle="dropdown">Sign In
					<strong class="caret"></strong>
			</a>
				<div class="dropdown-menu"
					style="padding: 15px; padding-bottom: 15px;">
					<!-- Login form here

            </-->
					<form action="[YOUR ACTION]" method="post" accept-charset="UTF-8"
						style="color: #2B2424">
						<input id="user_username" placeholder="Email Address"
							style="margin-bottom: 15px;" type="text" name="user[username]"
							size="25" /> <input id="user_password" placeholder="Password"
							style="margin-bottom: 15px;" type="password"
							name="user[password]" size="25" /> <input id="user_remember_me"
							style="float: left; margin-right: 10px;" type="checkbox"
							name="user[remember_me]" value="1" /> <label
							class="string optional" for="user_remember_me"> Remember
							me</label> <input class="btn btn-primary"
							style="clear: left; width: 100%; height: 32px; font-size: 13px;"
							type="submit" name="commit" value="Sign In" /> <a href=""
							style="float: right; margin-top: 10px">Forgot password</a>
					</form>
				</div></li>
		</ul>
		</nav>
		<!-- /.Navigation bar 1 -->



		<!-- Content -->
		<div>
			<!-- row -->
			<div class="row">
				<!-- .column 1-->
				<div class="col-md-2"></div>
				<!-- /.column 1-->
				<!-- .column 2-->
				<div class="col-md-8">					
					<div>
						<form role="form">
							<div class="form-group">
								<label for="tour_title">Tên của tour:</label> <input type="text"
									class="form-control" id="tour_title">
							</div>
							<div class="form-group">
								<label for="tour_detail">Chi tiết tour:</label>
								<textarea class="form-control" rows="15" id="tour_detail"></textarea>
							</div>
							<div class="form-group">
								<label for="tour_price">Giá tour:</label> <input type="text"
									class="form-control" id="tour_price" placeholder="Ex. Từ 10 đến 20 triệu">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">Thêm tour</button>
							</div>
						</form>
					</div>

				</div>
				<script>
					// Replace the <textarea id="editor1"> with a CKEditor
					// instance, using default configuration.
					CKEDITOR.replace('tour_detail');
				</script>
				<!-- /.column 2-->
				<!-- .column 3-->
				<div class="col-md-2"></div>
				<!-- /.column 3-->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.Content -->
	</div>
	<!--/.start-->

</body>
</html>
