<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>


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
<script src="view/view/resource/ckeditor/ckeditor.js"></script>
<link href="view/resource/css/account_manager.css" rel="stylesheet">
<script src="view/resource/datepicker/js/bootstrap-datepicker.js"></script>
</head>
<body>
	<jsp:include page="body-header.jsp" />

	<!-- Begin Body -->
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row">
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
											type="text" class="form-control" value="2015-10-22"
											id="txt_birthday">
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


									<button type="submit" class="btn btn-default">Cập nhật</button>
									<button type="button" id="btn_cancel_update"
										class="btn btn-default">Hủy</button>
								</form>

								<script type="text/javascript">
									$("#txt_birthday").datepicker({
										format : "yyyy-mm-dd"
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
										<label for="confirm_password">Xác nhận mật khẩu mới:</label> <input
											type="password" class="form-control" id="confirm_password">
									</div>
									<button type="submit" class="btn btn-default">Thay đổi</button>
									<button type="submit" id="btn_cancel_change"
										class="btn btn-default">Hủy</button>
								</form>
							</div>
						</div>
					</div>
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

		</div>
	</div>
	<jsp:include page="body-footer.jsp" />


</body>
</html>





