<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Chi tiết tour</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resource/css/css_home.css" rel="stylesheet">
<link href="resource/css/view-tour.css" rel="stylesheet">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script src="resource/lib/jquery-sign-in.min.js"></script>
</head>
<!-- <div class="container-fluid " style="background-color:#F44336;color:#fff;height:100px;">
      <h1>Hot tour</h1>

      </div> -->
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
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="#">Tour mới</a></li>
			<li class="active">Vịnh hạ long - Huế</li>
		</ol>
		<div class="head container-fluid">
			<div class="row">
				<div class="col-md-8">
					<div id="carousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel" data-slide-to="0" class="active"></li>
							<li data-target="#carousel" data-slide-to="1"></li>
							<li data-target="#carousel" data-slide-to="2"></li>
							<li data-target="#carousel" data-slide-to="3"></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item" data-slide-number="0">
								<img class="img-responsive" alt="not found"
									src="resource/image/cm.jpg">
							</div>
							<div class="item" data-slide-number="1">
								<img class="img-responsive" alt="not found"
									src="resource/image/cm1.jpg">
							</div>
							<div class="item" data-slide-number="5">
								<img class="img-responsive" alt="not found"
									src="resource/image/cm.jpg">
							</div>
							<div class="item" data-slide-number="6">
								<img class="img-responsive" alt="not found"
									src="resource/image/cm6.png">
							</div>
						</div>
					</div>
				</div>
				<div class="row col-md-4">
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Vịnh hạ long - Huế</span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Giá tour: 15.000.000đ</span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Thời gian: 4 ngày 5 đêm</span>
						</h4>
					</div>
					<div>
						<h4 class="text-left glyphicon glyphicon-ok">
							<span style="color: black">Lữ hành: Sài Gòn Tourist</span>
						</h4>
					</div>
					<div style="margin-top: 10px">
						<input type="submit" class="btn btn-primary" value="Đặt tour"
							data-toggle="tooltip"
							title="Báo đơn vị lữ hành liên hệ với bạn ngay!">
					</div>
				</div>
			</div>
		</div>
		<div class="content">
			<h3>Nội dung bài đăng ở đây</h3>
			<h3>Nội dung bài đăng ở đây</h3>
			<h3>Nội dung bài đăng ở đây</h3>
			<h3>Nội dung bài đăng ở đây</h3>
		</div>

		<div class="comment">
			<div class="separator">
				<h3>BÌNH LUẬN</h3>
				<br> <br>
			</div>
			<form class="form form-group" role="form">
				<textarea class="form-control" rows="3"
					placeholder="Nhập bình luận ..." required></textarea>
				<input class="btn btn-primary pull-right"
					style="margin-top: 10px; margin-bottom: 10px" type="submit"
					value="Bình luận">
			</form>
			<div class="comment-detail panel panel-group"style = "margin-top:55px;">
				<span class="panel panel-default">
					<div class="panel-body">
						<img class="avatar" src="resource/image/cm.jpg" alt="user avatar">
						<p>bình luận của người dùng ở đây</p>
					</div>
				</span> <span class="panel panel-default">
					<div class="panel-body">
						<img class="avatar" src="" alt="user avatar">
						<p>bình luận của người dùng ở đây bình luận của người dùng ở
							đây bình luận của người dùng ở đây bình luận của người dùng ở đây
							bình luận của người dùng ở đây bình luận của người dùng ở đây
							bình luận của người dùng ở đây bình luận của người dùng ở đây</p>
					</div>
				</span>
			</div>
		</div>

	</div>
</body>
</html>