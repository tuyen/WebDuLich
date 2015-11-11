<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.ModelUser"%>


	<!-- Begin Navbar -->
	
		<div class="navbar navbar-default  navbar-fixed-top" >
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
						<li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
						<!--  <li class="divider"></li> -->
						<li><a href="#">Tour mới</a></li>
						<li><a href="#">Tour hot</a></li>
						<li><a href="#">Điểm du lịch</a></li>
						<li><a href="#">Điểm du lịch hot</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<% 
							ModelUser user = new ModelUser();
							Cookie cookie = null;
							Cookie[] cookies = null;
							cookies = request.getCookies();
							String name = null;
							String page_1= null;
							String remember = null;
							String userID = null;
							if (cookies!=null)
							{
								for (int i=0;i<cookies.length;i++)
								{
									if (cookies[i].getName().equals("login_remember"))
									{
										remember = cookies[i].getValue();
									}
									if (cookies[i].getName().equals("login_cookie"))
									{
										userID = cookies[i].getValue();
									}
								
								}
							}
							
							if ("true".equals(remember))
							{
								name = user.getAccountByUserId(userID).getFullName();
							}
							else 
							{
								//session = request.getSession(false);
								name = (String)session.getAttribute("name");
							}
							if (name!=null)
							{
								page_1 = "<li class='dropdown'><a href='#' class='dropdown-toggle'data-toggle='dropdown'>"+name+"<b class='caret'></b></a>"+ 
										"<ul class='dropdown-menu'>"+
											"<li><a href='#'>Quản lý bài đăng</a></li>"+
											"<li><a href='#'>Thay đổi thông tin cá nhân</a></li>"+
											"<li><a href='#'>Something else here</a></li>"+
											"<li class='divider'></li>"+
											"<li class='nav-header'>Nav header</li>"+
											"<li><a href='"+request.getContextPath()+"/ControllerSignOut'>Sign out</a></li>"+
											"<li><a href='#'>One more separated link</a></li>"+
										"</ul></li>";
							}
							
							else
							{
								page_1 = "<li id='signup'><a href='ControllerSignUp'>Sign Up</a></li>"+
										"<li id ='signin' class='dropdown'><a class='dropdown-toggle' href='#'"+
										"data-toggle='dropdown'>Sign In <strong class='caret'></strong></a>"+
										"<div class='dropdown-menu' style='padding: 15px;'>"+
											"<!-- Login form here -->"+
											"<form id='signinForm' action='ControllerSignIn' method='post' "+
												"accept-charset='UTF-8' role='form' >"+
												"<input id='user_username'"+ 
													"placeholder=' Email'"+
													"style='margin-bottom: 15px;' type='email' name='email'"+
													"size='25' required='required'/> <br/>"+ 
												"<input id='user_password'"+
													"placeholder=' Password'"+ 
													"style='margin-bottom: 15px;'"+
													"type='password' name='password' size='25' required='required'/> <br />"+
												
												"<input id='user_remember_me' style='float: left; margin-right: 10px;'"+
													"type='checkbox' name='remember' value='1' /> <label "+
													"class='string optional' for='user_remember_me'>"+
													"Remember me</label> "+ 
												
													"<button  id='btn-signin' type='submit'"+   
													"class='btn btn-block btn-primary' style='clear: left; width: 100%; height: 32px; font-size: 13px; margin-bottom: 10px;'>Sign In</button>"+
													"<a	href='Forgot-password' style='float: right;'"+
													"id='forgot_password'>Forgot password ?</a>"+
											"</form>"+
										"</div>"+
									"</li>";
							}
							out.print(page_1);
							//response.getWriter().print(page_1);
						%>
					</ul>
				</div>
				</nav>
			</div>
		</div>
	