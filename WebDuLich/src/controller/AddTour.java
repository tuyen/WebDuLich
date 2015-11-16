package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.RepaintArea;
import utility.LoginUtility;
import model.ModelPost;
import dto.dtoPost;
import dto.dtoTouristPlace;

/**
 * Servlet implementation class AddTour
 */
@WebServlet("/AddTour")
public class AddTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	LoginUtility login = new LoginUtility();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTour() {
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

//		if(!login.isLogged(request, response))
//		{
//			response.sendRedirect(view_url);
//		}
		
		String edit = request.getParameter("edit");
		dtoPost dto = new dtoPost();
		List<dtoTouristPlace> places = new ArrayList<dtoTouristPlace>();
		if (edit != null && edit != "") {
			ModelPost post = new ModelPost();
			dto = post.getPostById(edit);
			places = post.getTouristPlace(edit);

		}
		request.setAttribute("edit", dto);
		request.setAttribute("places", places);
		request.getRequestDispatcher("view/add-tour.jsp").include(request,
				response);
	}

	private String getCurrentDate() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}

	// xu lý them tour
	private void addTour(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tourName = request.getParameter("tourName");
		String tourDetail = request.getParameter("tourDetail");
		String tourPrice = request.getParameter("tourPrice");
		String[] placeId = request.getParameterValues("placeId[]");
		String numberPeople = request.getParameter("numberPeople");
		String tourTime = request.getParameter("tourTime");

		if (tourName != null && tourDetail != null && tourPrice != null) {
			if (tourDetail != "" && tourName != "") {
				dtoPost post = new dtoPost();
				post.setTitle(tourName);
				post.setCategoryId("1");
				post.setContent(tourDetail);
				post.setPostDate(this.getCurrentDate());
				post.setPrice(tourPrice);
				post.setUserId("1");
				post.setViews("0");
				post.setNumberPeople(numberPeople);
				post.setTotalTime(tourTime);

				ModelPost modelPost = new ModelPost();
				modelPost.addTouristPlace(post);
				String postId;
				try {
					postId = modelPost.getLastTourId("1");
					if (!post.equals("-1")) {
						modelPost.insertPlace(postId, placeId);

						String view_url = "postdetail?cate=1&post=" + postId;
						response.sendRedirect(view_url);
						return;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				System.out.print("Error!");
			}
		}
		System.out.print("Error!");

	}

	private void updateTour(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tourName = request.getParameter("tourName");
		String tourDetail = request.getParameter("tourDetail");
		String tourPrice = request.getParameter("tourPrice");
		String[] placeId = request.getParameterValues("placeId[]");
		String numberPeople = request.getParameter("numberPeople");
		String tourTime = request.getParameter("tourTime");

		if (tourName != null && tourDetail != null && tourPrice != null) {
			if (tourDetail != "" && tourName != "") {
				dtoPost post = new dtoPost();
				post.setPostId(edit_post);
				post.setTitle(tourName);				
				post.setContent(tourDetail);				
				post.setPrice(tourPrice);				
				post.setNumberPeople(numberPeople);
				post.setTotalTime(tourTime);
				ModelPost modelPost = new ModelPost();				
				modelPost.updatePost(post);
				modelPost.removeAllPlace(edit_post);
				modelPost.insertPlace(edit_post, placeId);
				String view_url = "postdetail?cate=1&post=" + edit_post;
				response.sendRedirect(view_url);
				return;			
			}
		}
		System.out.print("Error!");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private String edit_post = "";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		edit_post = request.getParameter("edit_post");
		if (edit_post != null && edit_post != "") {
			updateTour(request, response);
			return;
		} else {
			addTour(request, response);
		}

	}
}
