package controller;

import java.io.IOException;

import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.api.policy.PolicyResolver.ServerContext;

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
					//Cookie cookieToken = new Cookie("login_token", token);
					//cookieToken.setMaxAge(60*60*24*30);
					
					response.addCookie(cookieUserID);
					//response.addCookie(cookieToken);
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
				
				
				//String token = md5.generateToken();
				
					//signin.setToken(user.getUserId(), token);
					session.setAttribute("userID", user.getUserId());
					session.setAttribute("name", user.getFullName());
					session.setAttribute("avatar", user.getAvatar());
					response.addCookie(cookieRemember);
				
				
			}
			
			response.sendRedirect("ControllerHome");
			return;
		}
		else
		{		
			
			//String a = request.getContextPath()+"/view/resource/image/user/default-avatar.png";
			String filePath=getServletConfig().getServletContext().getRealPath("/view/resource/image/user/");
			response.getWriter().println(filePath);
			response.sendRedirect("ControllerHome?login=false");		
			return;			
		}
		
	}

}
