package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;
import utility.LoginUtility;

/**
 * Servlet implementation class ControllerAdmin
 */
@WebServlet("/ControllerAdmin")
public class ControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginUtility login = new LoginUtility();
	ModelPost md = new ModelPost();
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(
					request, response);
			return;
		}
		LoginUtility login = new LoginUtility();
		if (login.isLogged(request, response))
			if (login.getLoggedUserID().equals("1"))
				request.getRequestDispatcher("view/admin-manager-post.jsp")
						.include(request, response);
			else
				request.getRequestDispatcher("view/404.jsp")
				.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(
					request, response);
			return;
		}
		String deletePost = request.getParameter("delete_post");
		md.updateDelete(deletePost);
	}

}
