package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.dtoUser;
import model.ModelUser;
import utility.Md5Utility;

/**
 * Servlet implementation class ControllerSignIn
 */
@WebServlet("/ControllerSignIn")
public class ControllerSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Md5Utility md5 = new Md5Utility();
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		password = md5.md5(password);
		ModelUser signin = new ModelUser();
		
		boolean check = signin.checkSignIn(email, password);
		if (check==true)
		{
			dtoUser user = new dtoUser();
			user = signin.getAccountByEmail(email);
			if (remember != null)
			{
				Cookie cookieRemember = new Cookie("login_remember", "true");
				cookieRemember.setMaxAge(60*60*24*30);
				
				Cookie cookieUserID = new Cookie("login_cookie", user.getUserId());
				cookieUserID.setMaxAge(60*60*24*30);
				
				String token = md5.generateToken();
				try {
					signin.setToken(user.getUserId(), token);
					Cookie cookieToken = new Cookie("login_token", token);
					cookieToken.setMaxAge(60*60*24*30);
					
					response.addCookie(cookieUserID);
					response.addCookie(cookieToken);
					response.addCookie(cookieRemember);
				}
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
			else
			{
				Cookie cookieRemember = new Cookie("login_remember", "false");
				cookieRemember.setMaxAge(60*60*24*30);
				HttpSession session = request.getSession();
				
				
				String token = md5.generateToken();
				try {
					signin.setToken(user.getUserId(), token);
					session.setAttribute("name", user.getFullName());
					response.addCookie(cookieRemember);
				}
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//request.getRequestDispatcher("view/Home.jsp").forward(request, response);
			//request.setAttribute("abc", "123");
			response.sendRedirect("ControllerHome");
		}
		else
		{
			//response.getWriter().write("Email đăng nhập hoặc mật khẩu không đúng!");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email đăng nhập hoặc mật khẩu không đúng!');");
			//out.println("location='index.jsp';");
			out.println("</script>"); 
			response.sendRedirect("ControllerHome");
			//request.getRequestDispatcher("view/Home.jsp").forward(request, response);
			 
			
		}
		
		//response.sendRedirect(request.getContextPath() + "/ControllerHome");
	}

}
