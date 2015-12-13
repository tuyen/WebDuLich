<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String login_check = (String) request.getAttribute("login_status");
		String active = (String) request.getAttribute("active");
		if (("not_ok").equals(login_check)) {
			String p1 = "<script type=\"text/javascript\">";
			String p2 = "$(document).ready(function(){";
			String p3 = "alert('Email đăng nhập hoặc mật khẩu không đúng!');";
			String p4 = "});";
			String p5 = "</script>";

			out.println(p1);
			out.println(p2);
			out.println(p3);
			out.println(p4);
			out.println(p5);

		}
		if ("not_yet".equals(active)) {
			String p1 = "<script type=\"text/javascript\">";
			String p2 = "$(document).ready(function(){";
			String p3 = "alert('Bạn phải xác thực tài khoản trước khi đăng nhập!');";
			String p4 = "});";
			String p5 = "</script>";

			out.println(p1);
			out.println(p2);
			out.println(p3);
			out.println(p4);
			out.println(p5);
		}
%>