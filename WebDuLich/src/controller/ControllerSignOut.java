package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.LoginUtility;
/**
 * Servlet implementation class ControllerSignOut
 */
@WebServlet("/ControllerSignOut")
public class ControllerSignOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerSignOut() {
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
		HttpSession session1 = request.getSession();
		String controller  = "";
		controller = (String)session1.getAttribute("controller")!=null?(String)session1.getAttribute("controller"):"";
		
		LoginUtility signout = new  LoginUtility();
		signout.signOut(request, response);
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
