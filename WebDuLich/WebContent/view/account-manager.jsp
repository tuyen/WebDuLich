


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
<link href="view/resource/css/account_manager.css" rel="stylesheet">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="view/resource/lib/jquery-sign-in.min.js"></script>
<script src="view/resource/ckeditor/ckeditor.js"></script>
<script src="view/resource/datepicker/js/bootstrap-datepicker.js"></script>
</head>

<body>

	<script type="text/javascript">
		$(document).ready(function() {

			// user clicks change button
			$("#btn_change_password").click(function() {

				$("#view_information").hide();
				$("#update_password").slideDown();

			});

			// user clicks cancel button
			$("#btn_cancel_change").click(function() {

				$("#view_information").show();
				$("#update_password").slideUp();

			});
		});

		$(document).ready(function() {

			// user clicks change button
			$("#btn_update_information").click(function() {

				$("#view_information").hide();
				$("#update_information").slideDown();

			});

			// user clicks cancel button
			$("#btn_cancel_update").click(function() {

				$("#view_information").show();
				$("#update_information").slideUp();

			});
		});
	</script>

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
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									Thông tin tài khoản
									<button type="button" id="btn_update_information"
										class="btn btn-default navbar-right button_margin_right">Cập
										nhật</button>
								</h4>
							</div>
							<div class="panel-body">
								<div id="view_information">
									<h4>Họ và tên: Trần Cảnh</h4>
									<h4>Ngày Sinh: 26/05/1994</h4>
									<h4>Điện Thoại: 09876475784578</h4>
									<h4>Email: xxsasdasdasdasd@gmail.com</h4>
									<h4>
										Mật khẩu: <a id="btn_change_password" href="#">Thay đổi</a>
									</h4>
									<h4>Loại tài khoản: Thường dân</h4>
									<h4>Tên công ty: Việt Travel</h4>
									<h4>Mô tả công ty: Công ty du lịch đa quốc gia, tốt nhất
										mọi thời đại :)))</h4>
								</div>
								<div id="update_information" class="hidden_div">
									<h3>Cập nhật thông tin tài khoản</h3>
									<form role="form">
										<div class="form-group">
											<label for="email">Họ & Tên:</label> <input type="text"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="txt_birthday">Ngày Sinh:</label> <input readonly
												type="text" class="form-control" value="2015-10-22" id="txt_birthday">
										</div>


										<div class="form-group">
											<label for="email">Email:</label> <input type="text"
												class="form-control" id="email">
										</div>


										<div class="form-group">
											<label for="email">Địa chỉ:</label> <input type="text"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="email">Tên công ty:</label> <input type="text"
												class="form-control" id="email">
										</div>


										<div class="form-group">
											<label for="email">Mô tả công ty:</label> <input type="text"
												class="form-control" id="email">
										</div>


										<button type="submit" class="btn btn-default">Cập
											nhật</button>
										<button type="button" id="btn_cancel_update"
											class="btn btn-default">Hủy</button>
									</form>

									<script type="text/javascript">
										$( "#txt_birthday" ).datepicker({
											format: "yyyy-mm-dd"
										});
									</script>
								</div>
								<div id="update_password" class="hidden_div">
									<h4>Thay đổi mật khẩu:</h4>
									<form role="form">
										<div class="form-group">
											<label for="old_password">Mật khẩu cũ:</label> <input
												type="password" class="form-control" id="old_password">
										</div>
										<div class="form-group">
											<label for="new_password">Mật khẩu mới:</label> <input
												type="password" class="form-control" id="new_password">
										</div>
										<div class="form-group">
											<label for="confirm_password">Xác nhận mật khẩu mới:</label>
											<input type="password" class="form-control"
												id="confirm_password">
										</div>
										<button type="submit" class="btn btn-default">Thay
											đổi</button>
										<button type="submit" id="btn_cancel_change"
											class="btn btn-default">Hủy</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<div>
						<div class="panel panel-default">
							<div class="panel-heading">Quản lý bài đăng</div>
							<div class="panel-body">

								<div class="scroll_div">

									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
																											<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
																											<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									
																											<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									
																											<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>
									
									
									<div class="user_post_item">
										<div class="content_size">
											<a href="#">Tour đi Nha Trang - Khánh Hòa 10 ngày</a>
										</div>
										<div class="delete_size">
											<a href="#"><span
												class="glyphicon glyphicon glyphicon-remove"></span> xóa</a>
										</div>
									</div>
									<br><hr>									
									
								</div>


							</div>
						</div>
					</div>

				</div>

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





