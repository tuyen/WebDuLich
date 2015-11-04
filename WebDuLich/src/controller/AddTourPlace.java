package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;
import dto.dtoPost;

/**
 * Servlet implementation class AddTourPlace
 */
@WebServlet("/AddTourPlace")
public class AddTourPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTourPlace() {
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
		response.setContentType("text/html; charset=UTF-8");				
		RequestDispatcher rd = request.getRequestDispatcher("view/add-tour-place.jsp");		
		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// TODO Auto-generated method stub
		this.addAPlace(request, response);						
		RequestDispatcher rd = request.getRequestDispatcher("view/add-tour-place.jsp");		
		rd.include(request, response);
	}

	
	private String getCurrentDate()
	{
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
	
	private void addAPlace(HttpServletRequest request,
			HttpServletResponse response) {
		String txt_place = request.getParameter("txt_place");
		String txt_detail = request.getParameter("txt_detail");
		String txt_location = request.getParameter("txt_location");
		String btn_post = request.getParameter("btn_post");
		if (btn_post != null && txt_detail != null && txt_location != null) {
			if (txt_detail != "" && txt_location != "") {
				dtoPost post = new dtoPost();
				post.setTitle(txt_place);
				post.setCategoryId("2");
				post.setContent(txt_detail);
				post.setPostDate(this.getCurrentDate());
				post.setPrice("0");
				post.setUserId("1");
				post.setViews("0");
				ModelPost modelPost = new ModelPost();
				modelPost.addTouristPlace(post);				
			}
		}

	}

}
