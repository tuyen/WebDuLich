package controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ModelUser;
import utility.Md5Utility;
import utility.EmailUtility;

/**
 * Servlet implementation class ControllerForgotPassword
 */
@WebServlet("/ControllerForgotPassword")
public class ControllerForgotPassword extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerForgotPassword()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	ModelUser model_user = new ModelUser();
	private String host;
	private String port;
	private String userName;
	private String password;

	public void init()
	{
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		userName = context.getInitParameter("user");
		password = context.getInitParameter("pass");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		ModelUser user = new ModelUser();
		String email_ajax = request.getParameter("email_ajax");
		if (email_ajax == null) {
			request.getRequestDispatcher("view/Forgot-password.jsp").include(request, response);
			return;
		}
		else {
			try {
				boolean check = user.checkMailExist(email_ajax);
				if (check == false) {
					response.getWriter().write("Email chưa được đăng ký, vui lòng nhập lại!");
					return;
				}

			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		Md5Utility md5 = new Md5Utility();
		String email = request.getParameter("email");
		if (email != null) {
			String password_reset = randomString(10);
			String subject = "Reset mật khẩu Banana Tour";
			String message = "Hệ thống <a href='http://localhost:8080/WebDuLich/ControllerHome'>Banana Tour</a> đã cấp lại mật khẩu cho tài khoản của bạn!<br/>"
					+ "Email: " + email + "<br/>" + "Mật khẩu: " + password_reset + "<br/>";
			// md5.md5(password);
			try {
				model_user.resetPassword(email, md5.md5(password_reset));
			}
			catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {

				EmailUtility.sendEmail(host, port, userName, password, email, subject, message);
			}
			catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.getRequestDispatcher("view/Successful-reset-password.jsp").include(request, response);
		}

	}

	static final String AB = "0123456789abcdefghijklmnopqrstuvwxyz";
	static Random rnd = new Random();

	String randomString(int len)
	{
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		return sb.toString();
	}
}
