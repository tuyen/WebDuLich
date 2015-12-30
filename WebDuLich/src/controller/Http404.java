package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Http404
 */
@WebServlet("/Http404")
public class Http404 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Http404() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request, response);
			return;
		}
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("controller", "home");

		String login = request.getParameter("login");
		String active = request.getParameter("active");

		if (("false").equals(login)) {
			request.setAttribute("login_status", "not_ok");
		}
		if ("false".equals(active)) {
			request.setAttribute("active", "not_yet");
		}

		request.getRequestDispatcher("view/404.jsp").include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub		
	}

}
