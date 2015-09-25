<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tour mới</title>
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
		<div class="container-fluid">

			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Tuor mới</li>
			</ol>
			<div class="text-right">
				<div class="separator">
					<h3>TOUR MỚI</h3>
					<form action="" style="margin-bottom: 10px">
						<div class="btn-group">
							<a class="btn btn-default dropdown-toggle btn-select"
								data-toggle="dropdown" href="#">Chọn giá <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">United States</a></li>
								<li><a href="#">Canada</a></li>
								<li class="divider"></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span>
										Other</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<a class="btn btn-default dropdown-toggle btn-select"
								data-toggle="dropdown" href="#">Chọn điểm đến <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">United States</a></li>
								<li><a href="#">Canada</a></li>
								<li class="divider"></li>
								<li><a href="#"><span class="glyphicon glyphicon-star"></span>
										Other</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<a class="btn btn-default dropdown-toggle btn-select2"
								data-toggle="dropdown" href="#">Chọn công ty lữ hành<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">California</a></li>
								<li><a href="#">New York</a></li>
								<li><a href="#">Massachusetts</a></li>
								<li class="divider"></li>
								<li><a href="#">Quebec</a></li>
								<li><a href="#">Ontario</a></li>
								<li><a href="#">British Columbia</a></li>
							</ul>
						</div>
						<div class="btn-group" style="margin-left: 30px">
							<button type="button" id="btnSearch" class="btn btn-primary">Tìm
								kiếm</button>
						</div>
					</form>
				</div>

			</div>
			<!-- device into 2 column -->
			<div class="row">
				<div class="col-md-6">
					<div class="thumbnail" id="gallery">
						<!-- Slider -->
						<div class="row-fluid">
							<div id="carousel-1" class="carousel slide c-fade"
								data-ride="carousel">
								<!-- Top part of the slider -->
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
						<!--/Slider-->
						<div class="caption">
							<a href="#"><h4 class="text-left">Đà Lạt - Huế - Hà Nội</h4></a>
							<h4 class="text-left glyphicon glyphicon-usd"
								style="color: #3399FF">
								<span>15.000.000đ</span>
							</h4>
							<h4 class="pull-right glyphicon glyphicon-shopping-cart"
								data-toggle="tooltip" title="Đã có 10 người mua tuor này"
								style="color: #3399FF">10</h4>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="thumbnail" id="gallery">
						<!-- Slider -->
						<div class="row-fluid">
							<div id="carousel-1" class="carousel slide" data-ride="carousel">
								<!-- Top part of the slider -->
								<!-- Carousel items -->
								<div class="carousel-inner">
									<div class="active item" data-slide-number="0">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm.jpg">
									</div>
									<div class="item" data-slide-number="1">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm1.jpg">
									</div>
									<div class="item" data-slide-number="2">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm2.jpg">
									</div>
									<div class="item" data-slide-number="3">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm4.jpg">
									</div>
									<div class="item" data-slide-number="4">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm3.jpg">
									</div>
									<div class="item" data-slide-number="5">
										<img class="img-responsive" alt="not found" height="231px"
											src="resource/image/cm.jpg">
									</div>
									<div class="item" data-slide-number="6">
										<img width="674" height="318" alt="not found"
											src="resource/image/cm6.png">
									</div>
								</div>
							</div>
						</div>
						<!--/Slider-->
						<div class="caption">
							<a href="#"><h4 class="text-left">Đà Lạt - Huế - Hà Nội</h4></a>
							<h4 class="text-left glyphicon glyphicon-usd"
								style="color: #3399FF">
								<span>15.000.000đ</span>
							</h4>
							<h4 class="pull-right glyphicon glyphicon-shopping-cart"
								data-toggle="tooltip" title="Đã có 10 người mua tuor này"
								style="color: #3399FF">10</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- pagination -->
		<nav>
		<ul class="pagination pull-right">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>
	</div>
</body>
</html>