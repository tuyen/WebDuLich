package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelUser;
import utility.Md5Utility;

/**
 * Servlet implementation class ControllerSignIn
 */
@WebServlet("/ControllerSignIn")
public class ControllerSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Md5Utility md5 = new Md5Utility();
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//PrintWriter out = response.getWriter();
		String email = request.getParameter("user[email]");
		String password = request.getParameter("user[userpassword]");
		password = md5.md5(password);
		ModelUser signin = new ModelUser();
		boolean check = signin.checkSignIn(email, password);
		if (check==true)
		{
			response.getWriter().print(check);
		}
		else
		{
			response.getWriter().print("Email đăng nhập hoặc mật khẩu không đúng!");
		}
	}

}
