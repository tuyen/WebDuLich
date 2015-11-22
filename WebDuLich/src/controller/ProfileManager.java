package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.LoginUtility;
import utility.Md5Utility;
import model.ModelUser;
import dto.dtoUser;

/**
 * Servlet implementation class ProfileManager
 */
@WebServlet("/ProfileManager")
public class ProfileManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	LoginUtility login = new LoginUtility();
	String userId =""; 
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
		if(!login.isLogged(request, response))
		{
			response.sendRedirect("ControllerHome");
			return;
		}
		else
		{
			userId = login.getLoggedUserID();
		}
		request.setAttribute("loggedUserId", userId);
		request.getRequestDispatcher("view/account-manager.jsp").include(
				request, response);
	}

	
	private void updateUserProfile(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		PrintWriter out = response.getWriter();
		String btn_change = request.getParameter("btn_change");
		String confirmPassword = request.getParameter("confirmPassword");
		String newPassword = request.getParameter("newPassword");
		String oldPassword = request.getParameter("oldPassword");
		if (btn_change != null) {
			if (confirmPassword.equals(newPassword)) {
				ModelUser modelUser = new ModelUser();
				Md5Utility md5 = new Md5Utility();
				if (md5.md5(oldPassword).equals(modelUser.getUserPassword(userId))) {
					modelUser.updateUserPassword(userId, md5.md5(newPassword));
					out.print("change_success");
				}
				else
				{
					out.print("old_password_is_incorrect");
				}
			}
			else
			{
				out.print("password_not_match");
			}
			return;

		}
		String companyDescription = request.getParameter("companyDescription");
		String companyName = request.getParameter("companyName");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");

		if (companyDescription != null && companyName != null
				&& address != null && email != null && birthday != null
				&& fullName != null && phone != null) {
			if (companyDescription != "" && companyName != "" && address != ""
					&& email != "" && birthday != "" && fullName != ""
					&& phone != "") {
				dtoUser user = new dtoUser();
				user.setBirthday(birthday);
				user.setCompany(companyName);
				user.setEmail(email);
				user.setFullName(fullName);
				user.setCompanyDescription(companyDescription);
				user.setAddress(address);
				user.setPhone(phone);
				user.setUserId(userId);
				ModelUser modelUser = new ModelUser();
				modelUser.updateUserProfile(user);
				try {
					request.setAttribute("loggedUserId", userId);
					request.getRequestDispatcher("view/account-manager.jsp")
							.include(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(!login.isLogged(request, response))
		{
			response.sendRedirect("ControllerHome");
			return;
		}
		else
		{
			userId = login.getLoggedUserID();
		}
		
		try {
			this.updateUserProfile(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
