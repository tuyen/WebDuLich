package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.dtoBookedTour;
import dto.dtoComment;
import dto.dtoUser;
import model.ModelBookedTour;
import model.ModelComment;
import model.ModelPost;
import model.ModelUser;
import utility.EmailUtility;
import utility.LoginUtility;

/**
 * Servlet implementation class CotrollerPostDetail
 */
@WebServlet("/postdetail")
public class CotrollerPostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ModelBookedTour mdBookedTour = new ModelBookedTour();
	ModelPost mdPost = new ModelPost();
	ModelUser mdAccount = new ModelUser();
	LoginUtility login = new LoginUtility();
	Calendar cal;
	Date currentDate;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CotrollerPostDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	private void updateView(HttpServletRequest request,
			HttpServletResponse response) {
		String post = request.getParameter("post");
		if (post != null) {
			if (post != "") {
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
		String postId =  request.getParameter("post");
		if(category == null)
		{
			response.sendRedirect("ControllerHome");
			return;
		}
		if(category == "" || Integer.parseInt(category) > 3 || Integer.parseInt(category) < 0 || !mdPost.checkPostExist(postId, category))
		{
			response.sendRedirect("ControllerHome");
			return;
		}
		this.updateView(request, response);
				
		switch (category) {
		case "1":
			request.getRequestDispatcher("view/tour-detail.jsp").include(
					request, response);
			break;
		case "2":
		case "3":
			request.getRequestDispatcher("view/tourist-place-detail.jsp")
					.include(request, response);
			break;
		default:
			break;
		}
	}

	String userId = "";
	private String getCurrentDateTime() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		if((!login.isLogged(request, response)))
		{
			response.getWriter()
			.write("Bạn chưa đăng nhập, vui lòng đăng nhập để sử dụng chức năng này!");			
			return;
		}
		else
		{
			userId = this.login.getLoggedUserID();
		}
		
		String txt_postId = request.getParameter("txt_postId");
		String txt_comment = request.getParameter("txt_comment");
		String btn_comment = request.getParameter("btn_comment");
		String txt_cate = request.getParameter("txt_cate");
		String date = this.getCurrentDateTime();
		if(txt_postId != null && txt_comment != null && txt_cate!=null)
		{
			if(txt_postId != "" && txt_comment != "" && txt_cate!="")
			{
				ModelComment mdComment = new ModelComment();
				dtoComment dto = new dtoComment();
				dto.setContent(txt_comment);
				dto.setDateComment(date);
				dto.setUserId(userId);
				dto.setPostId(txt_postId);
				mdComment.addComment(dto);
				response.sendRedirect("postdetail?cate="+txt_cate+"&post="+txt_postId);
				return;
			}
		}
		
		// when customer click on book-tour button
		if (request.getParameter("bookTour") != null) {
			String booked = request.getParameter("bookTour");
			// check login
			if (login.isLogged(request, response)) {
				String customerId = login.getLoggedUserID();
				String postUrl = request.getParameter("postUrl");
				String postId = request.getParameter("postId");
				String categoryId = request.getParameter("categoryId");
				String postOwnerId = mdPost.getUserIdFromPost(postId,
						categoryId);

				dtoUser postOwnerAccount = mdAccount
						.getAccountByUserId(postOwnerId);
				dtoUser customerAccount = mdAccount
						.getAccountByUserId(customerId);
				// if user book a tour				
				if (booked.equals("1")) {
					// if this tour has already exist
					int isBooked = mdBookedTour.checkBookedTour(customerId, postId);
					if (isBooked == -1) {//if this tour is canceled
						// check if user can book this tour again
						if (mdBookedTour.checkUserCanBookTour(customerId,
								postId)) {
							// user can book tour
							bookTour(request,response, postUrl, postId, customerId,
									customerAccount, true, postOwnerAccount);
						} else {
							// user can not book tour
							response.getWriter()
							.write("Bạn đã hủy đặt tour này, vui lòng đặt tour lại sau 24h!");
						}
					} else {
						if(isBooked == 0)
						// user can book tour
						bookTour(request,response, postUrl, postId, customerId,
								customerAccount, false, postOwnerAccount);
					}
				} else {// if user cancel a tour has already booked
					cancelBookedTour(request, response, postUrl, postId, customerId,
							customerAccount, postOwnerAccount);
				}		
			} else {//if user are not logged in
				response.getWriter()
						.write("Bạn chưa đăng nhập, vui lòng đăng nhập để sử dụng chức năng này!");
			}
		}
	}

	private void bookTour(HttpServletRequest request, HttpServletResponse response, String postUrl,
			String postId, String customerId, dtoUser customerAccount,
			boolean isBooked, dtoUser postOwnerAccount) {

		dtoBookedTour bookedTour = new dtoBookedTour();
		bookedTour.setTourId(postId);
		bookedTour.setUserId(customerId);		
		bookedTour.setTime(getCurrentDateTime());
		bookedTour.setStatus(1);

		if (isBooked)
			mdBookedTour.updateBookedTour(bookedTour);
		else
			mdBookedTour.addBookedTour(bookedTour);
		mdPost.updateBuys(postId);

		String content = "Xin chào "
				+ postOwnerAccount.getFullName()
				+ "! <br>"
				+ "Tour du lịch bạn đăng tại <a href = '"
				+ postUrl
				+ "'> BananaTour </a> vừa được khách hàng đặt mua. <br>"
				+ "Thông tin khách đặt mua nhu sau: <br> - Tên: "
				+ customerAccount.getFullName()
				+ ".<br> - Email: "
				+ customerAccount.getEmail()
				+ ". <br> - Điện thoại: "
				+ customerAccount.getPhone()
				+ ".<br> - Địa chỉ: "
				+ customerAccount.getAddress()
				+ ". <br> BananaTour xin chúc "
				+ postOwnerAccount.getFullName()
				+ " có 1 ngày làm việc hiệu quả và có được những hợp đồng chất lượng từ BananaTour!";
//		sendMail(request, customerAccount.getEmail(), "Thông báo đặt tour",
//				content);
		try {
			response.getWriter()
			.write("Bạn đã đặt tour thành công, đơn vị lữ hành sẽ liên hệ với bạn sớm nhất có thể. Chúc bạn có những chuyến đi thú vị!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void cancelBookedTour(HttpServletRequest request, HttpServletResponse response, String postUrl,
			String postId, String customerId, dtoUser customerAccount,
			dtoUser postOwnerAccount) {
		dtoBookedTour bookedTour = new dtoBookedTour();
		bookedTour.setTourId(postId);
		bookedTour.setUserId(customerId);
		bookedTour.setTime(getCurrentDateTime());
		bookedTour.setStatus(0);

		mdBookedTour.updateBookedTour(bookedTour);

		String content = "Xin chào "
				+ postOwnerAccount.getFullName()
				+ "! <br>"
				+ "Khách hàng đặt tour du lịch bạn đăng tại <a href = '"
				+ postUrl
				+ "'> BananaTour </a> vừa hủy đặt tour. <br>"
				+ "Thông tin khách hàng như sau: <br> - Tên: "
				+ customerAccount.getFullName()
				+ ".<br> - Email: "
				+ customerAccount.getEmail()
				+ ". <br> - Điện thoại: "
				+ customerAccount.getPhone()
				+ ".<br> - Địa chỉ: "
				+ customerAccount.getAddress()
				+ ". <br> BananaTour rất tiếc về điều này! Xin chúc "
				+ postOwnerAccount.getFullName()
				+ " có 1 ngày làm việc hiệu quả và có được những hợp đồng chất lượng khác từ BananaTour!";
//		sendMail(request, customerAccount.getEmail(), "Thông báo hủy tour",
//				content);
		try {
			response.getWriter()
			.write("Bạn đã hủy đặt tour thành công. Chúc bạn có những lựa chọn thú vị với BananaTour!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void sendMail(HttpServletRequest request, String recipient,
			String subject, String content) {
		// verify by email
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		String resultMessage = "";
		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
					content);
			// resultMessage =
			// "B?n d� d?t tour th�nh c�ng, don v? l? h�nh s? li�n h? v?i b?n s?m nh?t c� th?. Ch�c b?n c� nh?ng chuy?n di th� v?!";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "L?i g?i mail. Sorry!!!" + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
		}
	}
}
