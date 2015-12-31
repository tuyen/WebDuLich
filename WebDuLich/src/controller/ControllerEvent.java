package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ControllerEvent
 */
@WebServlet("/ControllerEvent")
public class ControllerEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("controller", "event");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		request.getRequestDispatcher("/view/events.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
