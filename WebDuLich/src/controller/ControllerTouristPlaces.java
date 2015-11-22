package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ControllerTouristPlaces
 */
@WebServlet("/touristplace")
public class ControllerTouristPlaces extends HttpServlet {
	private static final long serialVersionUID = 1L;
       /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerTouristPlaces() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("controller", "tours-place");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/view/tourist-places.jsp").include(request, response);			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
