<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="dto.dtoUser"%>
<%@page import="model.ModelUser"%>
<%
	String userId = (String) request.getAttribute("loggedUserId");
	boolean isCompany = (boolean) request.getAttribute("isCompany");
	//out.print(userId);
	ModelUser userModel = new ModelUser();
	dtoUser user = userModel.getUserById(userId);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
<link rel="shortcut icon" href="view/resource/image/logo.ico" />

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
						$("#btn_update_information").hide();
						$("#view_information").hide();
						$("#update_password").show();

					});

					// user clicks cancel button
					$("#btn_cancel_change").click(function() {

						$("#btn_update_information").show();
						$("#view_information").show();
						$("#update_password").hide();

					});
				});

				$(document).ready(function() {

					// user clicks change button
					$("#btn_update_information").click(function() {

						$("#btn_update_information").hide();
						$("#view_information").hide();
						$("#update_information").show();

					});

					// user clicks cancel button
					$("#btn_cancel_update").click(function() {

						$("#btn_update_information").show();
						$("#view_information").show();
						$("#update_information").hide();

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
								<h4>
									Họ và tên:
									<%=user.getFullName()%></h4>
								<h4>
									Ngày Sinh:
									<%=user.getBirthday()%></h4>

								<h4>
									Địa Chỉ:
									<%=user.getAddress()%></h4>
								<h4>
									Điện Thoại:
									<%=user.getPhone()%></h4>
								<h4>
									Email:
									<%=user.getEmail()%></h4>
								<h4>
									Mật khẩu: <a id="btn_change_password" href="#">Thay đổi</a>
								</h4>
								<h4>
									Loại tài khoản:
									<%=user.getAccountType()%></h4>
								<h4>
									<%
										if (isCompany)
											out.print("Tên công ty: " + user.getCompany());
									%>
								</h4>
								<h4>

									<%
										if (isCompany)
											out.print("Mô tả công ty: " + user.getCompanyDescription());
									%>

								</h4>
							</div>
							<div id="update_information" class="hidden_div">
								<h3>Cập nhật thông tin tài khoản</h3>
								<form role="form" action="ProfileManager" method="post">
									<div class="form-group">
										<label for="email">Họ & Tên:</label> <input type="text"
											class="form-control" required value="<%=user.getFullName()%>"
											id="email" name="fullName">
									</div>

									<div class="form-group">
										<label for="txt_birthday">Ngày Sinh:</label> <input required
											readonly type="text" class="form-control"
											value="<%=user.getBirthday()%>" id="txt_birthday"
											name="birthday">
									</div>


									<div class="form-group">
										<label for="email">Email:</label> <input type="text"
											class="form-control" required value="<%=user.getEmail()%>"
											id="email" name="email">
									</div>


									<div class="form-group">
										<label for="email">Điện thoại:</label> <input type="text"
											class="form-control" required value="<%=user.getPhone()%>"
											id="email" name="phone">
									</div>

									<div class="form-group">
										<label for="email">Địa chỉ:</label> <input type="text"
											class="form-control" required value="<%=user.getAddress()%>"
											id="email" name="address">
									</div>


									<%
										
									%>
									<div class='form-group'>
										<%
											if (isCompany) {
												out.print("<label for='email'>Tên công ty:</label> <input type='text' class='form-control' id='email' required value='"
														+ user.getCompany() + "' name='companyName'>");
											}
										%>
									</div>


									<div class="form-group">
										<%
											if (isCompany) {
												out.print("<label for='email'>Mô tả công ty:</label> <input type='text' class='form-control' id='email' required value='"
														+ user.getCompanyDescription()
														+ "' name='companyDescription'>");
											}
										%>
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
								<form role="form" onsubmit="return change_pass_ajax()"
									action="ProfileManager" method="post">
									<div class="form-group">
										<label for="old_password">Mật khẩu cũ:</label> <input
											type="password" required class="form-control"
											id="old_password" name="oldPassword">
									</div>
									<div class="form-group">
										<label for="new_password">Mật khẩu mới:</label> <input
											type="password" required class="form-control"
											id="new_password" name="newPassword">
									</div>
									<div class="form-group">
										<label for="confirm_password">Xác nhận mật khẩu mới:</label> <input
											type="password" required class="form-control"
											id="confirm_password" name="confirmPassword">
									</div>
									<button type="submit" class="btn btn-default" name="btn_change">Thay
										đổi</button>
									<button type="button" id="btn_cancel_change"
										class="btn btn-default">Hủy</button>
									<label id="change_message"></label>
								</form>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>Cập nhật ảnh đại diện</h4>
						</div>
						<div class="panel-body">
							<div id="update_information">
								<form role="form" method="post" action="ProfileManager"
									enctype="multipart/form-data">
									<div class="form-group">
										<label for="file">File name:</label> <input type="file"
											accept="image/*" class="file" name="image-avatar" id="file">
									</div>
									<div class="form-group">
										<button type="submit" name="btnChangeAvatar"
											value="fca-btn-change"
											class="btn btn-default navbar-right custom_margin">Thay
											đổi</button>
									</div>

								</form>
							</div>
							<div id="update_password" class="hidden_div">
								<h4>Thay đổi mật khẩu:</h4>
								<form role="form" onsubmit="return change_pass_ajax()"
									action="ProfileManager" method="post">
									<div class="form-group">
										<label for="old_password">Mật khẩu cũ:</label> <input
											type="password" required class="form-control"
											id="old_password" name="oldPassword">
									</div>
									<button type="submit" class="btn btn-default" name="btn_change">Thay
										đổi</button>
									<button type="button" id="btn_cancel_change"
										class="btn btn-default">Hủy</button>
									<label id="change_message"></label>
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

				function change_pass_ajax() {
					var confirm_pass = document
							.getElementById("confirm_password").value;
					var old_pass = document.getElementById("old_password").value;
					var new_pass = document.getElementById("new_password").value;
					if (confirm_pass != new_pass) {
						document.getElementById("change_message").innerHTML = " * Password mới không khớp!"
						return false;
					}
					$
							.post(
									"ProfileManager",
									{
										btn_change : "btn_change",
										confirmPassword : confirm_pass,
										newPassword : new_pass,
										oldPassword : old_pass
									},
									function(data, status) {
										if (status == "success") {
											switch (data) {
											case "change_success":
												document
														.getElementById("change_message").innerHTML = " * Đã thay đổi password!"
												alert(" * Đã thay đổi password!");
												$("#update_password").hide();
												$("#btn_update_information")
														.show();
												$("#view_information").show();
												break;
											case "old_password_is_incorrect":
												document
														.getElementById("change_message").innerHTML = " * Password cũ không đúng!"
												break;
											case "password_not_match":
												document
														.getElementById("change_message").innerHTML = " * Password mới không khớp!"
												break;
											}
										}

									});
					return false;
				}
			</script>
			<!-- /.column 2-->

			<!-- .column 3-->
			<div class="col-md-2"></div>

		</div>
	</div>


</body>
</html>





