package controller;

import java.io.File;
import java.io.IOException;

import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.ModelUser;
import utility.EmailUtility;
import utility.Md5Utility;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/ControllerSignUp")
public class ControllerSignUp extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerSignUp()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	ModelUser signup = new ModelUser();
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init()
	{
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String email_ajax = request.getParameter("email_ajax");
		try {
			if (request.getParameter("email_ajax") == null) {
				request.getRequestDispatcher("view/Sign-up.jsp").include(request, response);
			}
			else {

				boolean check = signup.checkMailExist(email_ajax);
				if (check == true) {
					response.getWriter().write("Email đã được đăng ký, vui lòng nhập lại email khác!");
					return;
					// RequestDispatcher
					// rd=request.getRequestDispatcher("view/SignUp.jsp");
					// rd.include(request,response);
				}

			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		Md5Utility md5Password = new Md5Utility();
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		

		String email = request.getParameter("email");
		String username = request.getParameter("user_name");
		String password = request.getParameter("password");
		String accounttype = request.getParameter("accout_type");

		try {
			// sent mail
			String subject = "Xác nhận đăng ký tài khoản ,,,";
			Random random = new Random();
			int confirmCode = random.nextInt(999999) + 1;
			String content = "Bạn hãy hoàn thành bước cuối cùng để sử dụng tài khoản bằng cách click vào đường link bên đưới:<br/>"
					+ "<a href='http://localhost:8080/WebDuLich/ControllerActiveAccount?code=" + confirmCode + "&email="
					+ email + "'>Xác nhận tài khoản</a>";
			EmailUtility.sendEmail(host, port, user, pass, email, subject, content);
			
			
			// database
			signup.createAccount(username, email, md5Password.md5(password), accounttype, confirmCode);
			//create folder
			String userID = signup.getAccountByEmail(email).getUserId();
			String filePath=getServletConfig().getServletContext().getRealPath("/view/resource/image/user");
			//String filePath = request.getContextPath()+"/view/resource/image/user";
			File folder = new File(filePath,userID);
			folder.mkdirs();
			request.getRequestDispatcher("view/Successful-sign-up.jsp").include(request, response);
		}
		catch (SQLException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
