<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!--header-->
	<header class="masthead">
	<div class="">

		<div>
			<span style="font-weight: bold; font-size: 40px; padding-left: 3%;">, , ,</span>
			<!-- <p class="lead">Big Top Header and Fixed Sidebar</p> -->
		</div>
	</div>
	</header>


	<!-- Begin Navbar -->
	<div id="nav">
		<div class="navbar navbar-default navbar-static">
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
				<div class="container">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#"><span
								class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
						<!--  <li class="divider"></li> -->
						<li><a href="#">Tour mới</a></li>
						<li><a href="#">Tour hot</a></li>
						<li><a href="#">Điểm du lịch</a></li>
						<li><a href="#">Điểm du lịch hot</a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="view/ControllerSignUp">Sign Up</a></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Sign In <strong class="caret"></strong></a>
							<div class="dropdown-menu" style="padding: 15px;">
								<!-- Login form here -->
								<form action="[YOUR ACTION]" method="post"
									accept-charset="UTF-8" role="form">
									<input id="user_username" 
										placeholder=" Email"
										style="margin-bottom: 15px;" type="text" name="user[username]"
										size="25" /> 
									<input id="user_password"
										placeholder=" Password" 
										style="margin-bottom: 15px;"
										type="password" name="user[password]" size="25" /> <br />
									<input id="user_remember_me" style="float: left; margin-right: 10px;"
										type="checkbox" name="user[remember_me]" value="1" /> <label
										class="string optional" for="user_remember_me">
										Remember me</label> 
									<input class="btn btn-primary"
										style="clear: left; width: 100%; height: 32px; font-size: 13px; margin-bottom: 10px;"
										type="submit" name="commit" value="Sign In" /> <a
										href="Forgot-password" style="float: right;"
										id="forgot_password">Forgot password ?</a>
								</form>
							</div>
						</li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
		<!-- /.navbar -->
	</div>
