package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelPost;

/**
 * Servlet implementation class CotrollerPostDetail
 */
@WebServlet("/postdetail")
public class CotrollerPostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CotrollerPostDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	private void updateView(HttpServletRequest request,
			HttpServletResponse response)
	{
		String post = request.getParameter("post");
		if(post != null)
		{
			if(post != "")
			{
				ModelPost mdPost = new ModelPost();
				mdPost.updateView(post);
			}	
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String category = request.getParameter("cate");
		this.updateView(request, response);
		switch (category) {
		case "1":
			request.getRequestDispatcher("view/tour-detail.jsp").include(
					request, response);
			break;
		case "2":
		case "3":
			request.getRequestDispatcher("view/tourist-place-detail.jsp").include(
					request, response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String comment = request.getParameter("txtComment");
		
	}

}
