package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;
import dto.dtoPost;

/**
 * Servlet implementation class AddTour
 */
@WebServlet("/AddTour")
public class AddTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTour() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");		
		request.getRequestDispatcher("view/add-tour.jsp").include(request, response);
	}

	
	
	private String getCurrentDate()
	{
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
	
	//xu lý them tour
	private void addTour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
					
		int x = 2;
		x++;
		//tourName
		//tourDetail
		//tourPrice		
		//placeId[]
		String tourName = request.getParameter("tourName");
		String tourDetail = request.getParameter("tourDetail");
		String tourPrice = request.getParameter("tourPrice");
		String[] placeId = request.getParameterValues("placeId[]");
		
		if (tourName != null && tourDetail != null && tourPrice != null) {
			if (tourDetail != "" && tourName != "") {
				dtoPost post = new dtoPost();
				post.setTitle(tourName);
				post.setCategoryId("1");
				post.setContent(tourDetail);
				post.setPostDate(this.getCurrentDate());
				post.setPrice("0");
				post.setUserId("1");
				post.setViews("0");
				ModelPost modelPost = new ModelPost();
				modelPost.addTouristPlace(post);
				String postId;
				try {
					postId = modelPost.getLastTourId("1");
					if(!post.equals("-1"))
					{
						modelPost.insertPlace(postId, placeId);
						request.setCharacterEncoding("UTF-8");
						response.setCharacterEncoding("UTF-8");
						response.setContentType("text/html; charset=UTF-8");		
						request.getRequestDispatcher("view/add-tour.jsp").include(request, response);
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
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		addTour(request, response);
		
	}

}
