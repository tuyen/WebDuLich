<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.ModelUser"%>


<!-- Begin Navbar -->

<div class="navbar navbar-default  navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<button class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<nav class="navbar-collapse collapse" id="navbar-collapse-1"
			role="navigation">
			<div class="container-fluid">
				<ul class="nav navbar-nav">

					<li id='not-focus'><a href="ControllerHome"><img alt=""
						src="http://logopond.com/logos/face4d80544d288d73016224fc961951.png"
						height="80px" width="100px" style="margin:-30px 0px 0px 0px"></a></li>
					<%
						String controller = "";

						controller = (String)session.getAttribute("controller");

						switch (controller)
						{
						case "home":
							out.write("	<li class='active'><a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li><a href='tours'>Tours</a></li>" +

							"<li><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						case "tours":
							out.write("	<li ><a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li class='active'><a href='tours'>Tours</a></li>" +

							"<li><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						case "tours-place":
							out.write("	<li><a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li><a href='tours'>Tours</a></li>" +

							"<li class='active'><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						case "feeling":
							out.write("	<li ><a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li><a href='tours'>Tours</a></li>" +

							"<li><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li class='active'><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						case "sign-up":
							out.write("	<li> <a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li><a href='tours'>Tours</a></li>" +

							"<li><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						default:
							out.write("	<li> <a href='ControllerHome'><span"
									+ "class='glyphicon glyphicon-home'></span> Trang chủ</a></li>" +

							"<li><a href='tours'>Tours</a></li>" +

							"<li><a href='touristplace'>Điểm du lịch</a></li>"
									+ "<li><a href='feelings'>Cảm nhận của du khách</a></li>");
							break;
						}
					%>


				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						ModelUser user = new ModelUser();

						Cookie cookie = null;
						Cookie[] cookies = null;
						cookies = request.getCookies();
						String name = null;
						String page_1 = null;
						String remember = null;
						String userID = null;
						String image_name = null;
						String image_src = null;
						String accountType = null;
						if (cookies != null) {
							for (int i = 0; i < cookies.length; i++) {
								if (cookies[i].getName().equals("login_remember")) {
									remember = cookies[i].getValue();
								}
								if (cookies[i].getName().equals("login_cookie")) {
									userID = cookies[i].getValue();
									image_name = user.getAccountByUserId(userID).getAvatar();
									accountType = user.getAccountByUserId(userID).getAccountType();
								}

							}
						}
						
						if ("true".equals(remember)) {
							name = user.getAccountByUserId(userID).getFullName();
						}
						else {
							//session = request.getSession(false);
							userID = (String) session.getAttribute("userID");
							image_name = (String) session.getAttribute("avatar");
							name = (String) session.getAttribute("name");
						}
						if (name != null) {
							if ("default-avatar.png".equals(image_name)) {
								image_src = request.getContextPath() + "/view/resource/image/user/default-avatar.png";
							}
							else {
								image_src = request.getContextPath() + ("/view/resource/image/user/") + userID + "/" + image_name;
							}
							if ("company".equals(accountType))
							{
								page_1 = "<li><img id = 'avatar' src='" + image_src
										+ "' class='img-thumbnail' width ='50px' height = '50px' style='margin-top:15px;'>&nbsp;</li>"
										+ "<li class='dropdown'><a href='#' class='dropdown-toggle'data-toggle='dropdown'>" + name
										+ "&nbsp;<b class='caret'></b></a>" + "<ul class='dropdown-menu'>"
										+ "<li><a href='AddTour'>Thêm tour mới</a></li>" + "<li><a href='postmanager'>Quản lý bài đăng</a></li>"
										+ "<li><a href='ProfileManager'>Thay đổi thông tin cá nhân</a></li>" +

								"<li class='divider'></li>" +
										//"<li class='nav-header'>Nav header</li>"+
										"<li><a href='" + request.getContextPath() + "/ControllerSignOut'>Đăng xuất</a></li>" +
										//"<li><a href='#'>One more separated link</a></li>"+
										"</ul></li>";
							}
							else
							{
								page_1 = "<li><img id = 'avatar' src='" + image_src
										+ "' class='img-thumbnail' width ='50px' height = '50px' style='margin-top:15px;'>&nbsp;</li>"
										+ "<li class='dropdown'><a href='#' class='dropdown-toggle'data-toggle='dropdown'>" + name
										+ "&nbsp;<b class='caret'></b></a>" + "<ul class='dropdown-menu'>"
										
										+ "<li><a href='ProfileManager'>Thay đổi thông tin cá nhân</a></li>" +

								"<li class='divider'></li>" +
										//"<li class='nav-header'>Nav header</li>"+
										"<li><a href='" + request.getContextPath() + "/ControllerSignOut'>Đăng xuất</a></li>" +
										//"<li><a href='#'>One more separated link</a></li>"+
										"</ul></li>";
							}

						}

						else {
							if ("sign-up".equals(controller)) {
								page_1 = "<li class='active' id='signup'><a href='ControllerSignUp'>Đăng ký</a></li>"
										+ "<li id ='signin' class='dropdown'><a class='dropdown-toggle' href='#'"
										+ "data-toggle='dropdown'>Đăng nhập <strong class='caret'></strong></a>"
										+ "<div class='dropdown-menu'  style='padding: 15px;z-index:20;'>"
										+ "<!-- Login form here -->"
										+ "<form id='signinForm' action='ControllerSignIn' method='post' "
										+ "accept-charset='UTF-8' role='form' >" + "<input id='user_username'"
										+ "placeholder=' Email'" + "style='margin-bottom: 15px;' type='email' name='email'"
										+ "size='25' required='required'/> <br/>" + "<input id='user_password'"
										+ "placeholder=' Password'" + "style='margin-bottom: 15px;'"
										+ "type='password' name='password' size='25' required='required'/> <br />" +

								"<input id='user_remember_me' style='float: left; margin-right: 10px;'"
										+ "type='checkbox' name='remember' value='1' /> <label "
										+ "class='string optional' for='user_remember_me'>" + "Remember me</label> " +

								"<button  id='btn-signin' type='submit'"
										+ "class='btn btn-block btn-primary' style='clear: left; width: 100%; height: 32px; font-size: 13px; margin-bottom: 10px;'>Sign In</button>"
										+ "<a	href='ControllerForgotPassword' style='float: right;'"
										+ "id='forgot_password'>Forgot password ?</a>" + "</form>" + "</div>" + "</li>";
							}
							else {
								page_1 = "<li id='signup'><a href='ControllerSignUp'>Đăng ký</a></li>"
										+ "<li id ='signin' class='dropdown'><a class='dropdown-toggle' href='#'"
										+ "data-toggle='dropdown'>Đăng nhập <strong class='caret'></strong></a>"
										+ "<div class='dropdown-menu'  style='padding: 15px;z-index:20;'>"
										+ "<!-- Login form here -->"
										+ "<form id='signinForm' action='ControllerSignIn' method='post' "
										+ "accept-charset='UTF-8' role='form' >" + "<input id='user_username'"
										+ "placeholder=' Email'" + "style='margin-bottom: 15px;' type='email' name='email'"
										+ "size='25' required='required'/> <br/>" + "<input id='user_password'"
										+ "placeholder=' Password'" + "style='margin-bottom: 15px;'"
										+ "type='password' name='password' size='25' required='required'/> <br />" +

								"<input id='user_remember_me' style='float: left; margin-right: 10px;'"
										+ "type='checkbox' name='remember' value='1' /> <label "
										+ "class='string optional' for='user_remember_me'>" + "Remember me</label> " +

								"<button  id='btn-signin' type='submit'"
										+ "class='btn btn-block btn-primary' style='clear: left; width: 100%; height: 32px; font-size: 13px; margin-bottom: 10px;'>Sign In</button>"
										+ "<a	href='ControllerForgotPassword' style='float: right;'"
										+ "id='forgot_password'>Forgot password ?</a>" + "</form>" + "</div>" + "</li>";
							}

						}
						out.print(page_1);
						//response.getWriter().print(page_1);
					%>
				</ul>
			</div>
		</nav>
	</div>
</div>
