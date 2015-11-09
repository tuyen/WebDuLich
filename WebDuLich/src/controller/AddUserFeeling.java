package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;
import dto.dtoPost;
import dto.dtoTouristPlace;

/**
 * Servlet implementation class AddUserFeeling
 */
@WebServlet("/AddUserFeeling")
public class AddUserFeeling extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserFeeling() {
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

		String edit = request.getParameter("edit");
		dtoPost dto = new dtoPost();		
		request.setAttribute("edit", dto);
		request.getRequestDispatcher("view/add-user-feeling.jsp").include(request,
				response);
	}

	private String getCurrentDate() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}

	
	private void addTourFeeling(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tourId = request.getParameter("tourId");
		String feelingName = request.getParameter("feelingName");		
		String yourFeeling = request.getParameter("yourFeeling");
		String userId = "1";
		if(tourId != null && feelingName != null & yourFeeling != null)
		{
			if(tourId != "" && feelingName != "" & yourFeeling != "")
			{
				dtoPost dto = new dtoPost();
				dto.setTitle(feelingName);
				dto.setContent(yourFeeling);
				dto.setCategoryId("3");
				dto.setUserId(userId);
				dto.setPostDate(getCurrentDate());
				ModelPost post = new ModelPost();
				post.addTouristPlace(dto);
				String id = null;
				try {
					id = post.getLastFeelingId(userId);
					String[] str = {tourId};
					post.insertPlace(id, str);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
				
				request.setAttribute("edit", dto);
				request.getRequestDispatcher("view/add-user-feeling.jsp").include(request,
						response);
			}
		}

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		this.addTourFeeling(request, response);
	}

}
