package controller;

import java.io.IOException;

import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.Response;

import dto.dtoUser;
import model.ModelUser;
import utility.LoginUtility;
import utility.Md5Utility;

/**
 * Servlet implementation class ControllerSignIn
 */
@WebServlet("/ControllerSignIn")
public class ControllerSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginUtility login = new LoginUtility();
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		if(login.isLogged(request, response))
		{
			response.sendRedirect("home");
			return;
		}
		
		request.getRequestDispatcher("view/SignIn.jsp").include(request,
				response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		Md5Utility md5 = new Md5Utility();
		//dang o trang nao
		HttpSession session1 = request.getSession();
		String controller  = "";
		controller = (String)session1.getAttribute("controller")!=null?(String)session1.getAttribute("controller"):"";
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//lay gia tri tu form dang nhap
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		password = md5.md5(password);
		ModelUser signin = new ModelUser();
		//kiem tra password
		boolean checkPass = signin.checkSignIn(email, password);
		//kiem tra active
		boolean checkactive = signin.checkActive(email);
		if (checkPass==true && checkactive==true)
		{
			
			dtoUser user = new dtoUser();
			user = signin.getAccountByEmail(email);
			if (remember != null)
			{
				Cookie cookieRemember = new Cookie("login_remember", "true");
				cookieRemember.setMaxAge(60*60*24*30);
				
				Cookie cookieUserID = new Cookie("login_cookie", user.getUserId());
				cookieUserID.setMaxAge(60*60*24*30);
				
				Cookie cookieAccoutType = new Cookie ("login_accounttype",user.getAccountType());
				cookieAccoutType.setMaxAge(60*60*24*30);
				String token = md5.generateToken();
				try {
					signin.setToken(user.getUserId(), token);
					//Cookie cookieToken = new Cookie("login_token", token);
					//cookieToken.setMaxAge(60*60*24*30);
					
					response.addCookie(cookieUserID);
					//response.addCookie(cookieToken);
					response.addCookie(cookieRemember);
					response.addCookie(cookieAccoutType);
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
					session.setAttribute("login_accounttype", user.getAccountType());
					response.addCookie(cookieRemember);
				
				
			}
			
			switch (controller)
			{
			case "home":
				response.sendRedirect("home");
				break;
			case "tours":
				response.sendRedirect("tours");
				break;
			case "tours-place":
				response.sendRedirect("tourist-place");
				break;
			case "feeling":
				response.sendRedirect("user-review");
				break;
			case "food":
				response.sendRedirect("foods");
				break;
			case "event":
				response.sendRedirect("events");
				break;
			default:
				response.sendRedirect("home");
				break;
			}
			
			return;
		}
		else
			if (checkactive==false && checkPass==true)
			{		
				switch (controller)
				{
				case "home":
					response.sendRedirect("home?active=false");
					break;
				case "tours":
					response.sendRedirect("tours?active=false");
					break;
				case "tours-place":
					response.sendRedirect("tourist-place?active=false");
					break;
				case "feeling":
					response.sendRedirect("user-review?active=false");
					break;
				case "food":
					response.sendRedirect("foods?active=false");
					break;
				case "event":
					response.sendRedirect("events?active=false");
					break;
				default:
					response.sendRedirect("home?active=false");
					break;
				}
				//String a = request.getContextPath()+"/view/resource/image/user/default-avatar.png";
				//response.sendRedirect("ControllerHome?active=false");		
				return;		
			}
			else
			{
				switch (controller)
				{
				case "home":
					response.sendRedirect("home?login=false");
					break;
				case "tours":
					response.sendRedirect("tours?login=false");
					break;
				case "tours-place":
					response.sendRedirect("tourist-place?login=false");
					break;
				case "feeling":
					response.sendRedirect("user-review?login=false");
					break;
				case "food":
					response.sendRedirect("foods?login=false");
					break;
				case "event":
					response.sendRedirect("events?login=false");
					break;
				default:
					response.sendRedirect("home?login=false");
					break;
				}
				//response.sendRedirect("ControllerHome?login=false");		
				return;			
			}
		
	}

}
