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

import dto.dtoPost;
import model.ModelPost;
import utility.LoginUtility;

/**
 * Servlet implementation class AddFood
 */
@WebServlet("/AddFood")
public class AddFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	LoginUtility login = new LoginUtility();
	String userId = "";
	String edit_post = "";
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFood() {
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
		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request, response);
			return;
		}
		String edit = request.getParameter("edit");
		dtoPost dto = new dtoPost();

		if ((!login.isLogged(request, response))) {
			response.sendRedirect("sign-in");
			return;
		}
		if ((!login.getAccountType().equals("company"))) {
			request.getRequestDispatcher("view/Access-denied.jsp").include(request, response);
			return;
		} else {
			userId = login.getLoggedUserID();
		}

		if (edit != null && edit != "") {
			ModelPost post = new ModelPost();
			dto = post.getPost(edit);

		}
		request.setAttribute("edit", dto);
		RequestDispatcher rd = request.getRequestDispatcher("view/add-food.jsp");
		rd.include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request, response);
			return;
		}
		if (!login.isLogged(request, response)) {
			response.sendRedirect("home");
			return;
		} else {
			userId = login.getLoggedUserID();
		}

		edit_post = request.getParameter("edit_post");
		if (edit_post == null) {
			this.addAFood(request, response);
			return;
		} else {
			this.updateAFood(request, response);
			return;
		}
		// TODO Auto-generated method stub

	}

	
	
	private String getCurrentDate() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}

	private void addAFood(HttpServletRequest request, HttpServletResponse response) {
		String txt_place = request.getParameter("txt_place");
		String txt_detail = request.getParameter("txt_detail");
		String txt_location = request.getParameter("txt_location");
		String btn_post = request.getParameter("btn_post");
		if (btn_post != null && txt_detail != null && txt_location != null) {
			if (txt_detail != "" && txt_location != "") {
				dtoPost post = new dtoPost();
				post.setTitle(txt_place);
				post.setCategoryId("5");
				post.setContent(txt_detail);
				post.setPostDate(this.getCurrentDate());
				post.setPrice("0");
				post.setUserId(userId);
				post.setViews("0");
				post.setLocationId(txt_location);
				ModelPost modelPost = new ModelPost();
				modelPost.addTouristPlace(post);

				String postId = modelPost.getLastPost(userId);
				String view_url = "detail?cate=5&post=" + postId;
				try {
					response.sendRedirect(view_url);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

	private void updateAFood(HttpServletRequest request, HttpServletResponse response) {
		String txt_place = request.getParameter("txt_place");
		String txt_detail = request.getParameter("txt_detail");
		String txt_location = request.getParameter("txt_location");
		String btn_post = request.getParameter("btn_post");
		if (btn_post != null && txt_detail != null && txt_location != null) {
			if (txt_detail != "" && txt_location != "") {
				dtoPost post = new dtoPost();
				post.setPostId(edit_post);
				post.setTitle(txt_place);
				post.setCategoryId("5");
				post.setContent(txt_detail);
				post.setPrice("0");
				post.setNumberPeople("0");
				post.setLocationId(txt_location);
				ModelPost modelPost = new ModelPost();
				modelPost.updatePost(post);

				String view_url = "detail?cate=5&post=" + edit_post;
				try {
					response.sendRedirect(view_url);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

}
