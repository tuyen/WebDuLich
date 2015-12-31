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
import javax.servlet.http.HttpSession;

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
@WebServlet("/CotrollerPostDetail")
public class CotrollerPostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ModelBookedTour mdBookedTour = new ModelBookedTour();
	ModelPost mdPost = new ModelPost();
	ModelUser mdAccount = new ModelUser();
	LoginUtility login = new LoginUtility();
	Calendar cal;
	Date currentDate;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CotrollerPostDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	private void updateView(HttpServletRequest request, HttpServletResponse response) {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (!ckcon.isConnected()) {
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request, response);
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("controller", "abc");
		String category = request.getParameter("cate");
		String postId = request.getParameter("post");
		if (category == null) {
			response.sendRedirect("page-not-found");
			return;
		}
		if (category == "" || Integer.parseInt(category) > 5 || Integer.parseInt(category) < 0
				|| !mdPost.checkPostExist(postId, category)) {
			response.sendRedirect("page-not-found");
			return;
		}
		this.updateView(request, response);
		request.setAttribute("isLogged", this.login.isLogged(request, response));
		switch (category) {
		case "1":
			request.getRequestDispatcher("view/tour-detail.jsp").include(request, response);
			break;
		case "2":
		case "3":
		case "4":
		case "5":
			request.getRequestDispatcher("view/tourist-place-detail.jsp").include(request, response);
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (request.getParameter("bookTour") == null) {
			if (!ckcon.isConnected()) {
				request.getRequestDispatcher("view/DatabaseError.jsp").include(request, response);
				return;
			}
			if ((!login.isLogged(request, response))) {
				response.sendRedirect("sign-in");
				return;
			} else {
				userId = this.login.getLoggedUserID();
			}
		}
		else
		{
			response.getWriter().write("Bạn chưa đăng nhập, vui lòng đăng nhập để đặt tour!");
			return;
		}
		String txt_postId = request.getParameter("txt_postId");
		String txt_comment = request.getParameter("txt_comment");
		String btn_comment = request.getParameter("btn_comment");
		String txt_cate = request.getParameter("txt_cate");
		String date = this.getCurrentDateTime();
		if (txt_postId != null && txt_comment != null && txt_cate != null) {
			if (txt_postId != "" && txt_comment != "" && txt_cate != "") {
				ModelComment mdComment = new ModelComment();
				dtoComment dto = new dtoComment();
				dto.setContent(txt_comment);
				dto.setDateComment(date);
				dto.setUserId(userId);
				dto.setPostId(txt_postId);
				mdComment.addComment(dto);
				response.sendRedirect("detail?cate=" + txt_cate + "&post=" + txt_postId);
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
				String postOwnerId = mdPost.getUserIdFromPost(postId, categoryId);

				dtoUser postOwnerAccount = mdAccount.getAccountByUserId(postOwnerId);
				dtoUser customerAccount = mdAccount.getAccountByUserId(customerId);
				// if user book a tour
				if (booked.equals("1")) {
					// if this tour has already exist
					int isBooked = mdBookedTour.checkBookedTour(customerId, postId);
					if (isBooked == -1) {// if this tour is canceled
						// check if user can book this tour again
						if (mdBookedTour.checkUserCanBookTour(customerId, postId)) {
							// user can book tour
							bookTour(request, response, postUrl, postId, customerId, customerAccount, true,
									postOwnerAccount);
						} else {
							// user can not book tour
							response.getWriter().write("Bạn đã hủy đặt tour này, Vui lòng đặt lại sau 24h nữa!");
						}
					} else {
						if (isBooked == 0)
							// user can book tour
							bookTour(request, response, postUrl, postId, customerId, customerAccount, false,
									postOwnerAccount);
					}
				} else {// if user cancel a tour has already booked
					cancelBookedTour(request, response, postUrl, postId, customerId, customerAccount, postOwnerAccount);
				}
			} else {// if user are not logged in
				response.getWriter().write("Bạn chưa đăng nhập, vui lòng đăng nhập để đặt tour!");
			}
		}
	}

	private void bookTour(HttpServletRequest request, HttpServletResponse response, String postUrl, String postId,
			String customerId, dtoUser customerAccount, boolean isBooked, dtoUser postOwnerAccount) {

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

		String content = "Xin chào!" + postOwnerAccount.getFullName() + "! <br>"
				+ "Tour du liÌ£ch baÌ£n Ä‘Äƒng taÌ£i <a href = '" + postUrl
				+ "'> BananaTour </a> vÆ°Ì€a Ä‘Æ°Æ¡Ì£c khaÌ�ch haÌ€ng Ä‘ÄƒÌ£t mua. <br>"
				+ "ThÃ´ng tin khaÌ�ch Ä‘ÄƒÌ£t mua nhu sau: <br> - TÃªn: " + customerAccount.getFullName()
				+ ".<br> - Email: " + customerAccount.getEmail() + ". <br> - Ä�iÃªÌ£n thoaÌ£i: "
				+ customerAccount.getPhone() + ".<br> - Ä�iÌ£a chiÌ‰: " + customerAccount.getAddress()
				+ ". <br> BananaTour xin chuÌ�c " + postOwnerAccount.getFullName()
				+ " coÌ� 1 ngaÌ€y laÌ€m viÃªÌ£c hiÃªÌ£u quaÌ‰ vaÌ€ coÌ� Ä‘Æ°Æ¡Ì£c nhÆ°Ìƒng hÆ¡Ì£p Ä‘Ã´Ì€ng chÃ¢Ì�t lÆ°Æ¡Ì£ng tÆ°Ì€ BananaTour!";
		sendMail(request, customerAccount.getEmail(), "ThÃ´ng baÌ�o Ä‘ÄƒÌ£t tour", content);
		try {
			response.getWriter().write(
					"BaÌ£n Ä‘aÌƒ Ä‘ÄƒÌ£t tour thaÌ€nh cÃ´ng, Ä‘Æ¡n viÌ£ lÆ°Ìƒ haÌ€nh seÌƒ liÃªn hÃªÌ£ vÆ¡Ì�i baÌ£n sÆ¡Ì�m nhÃ¢Ì�t coÌ� thÃªÌ‰. ChuÌ�c baÌ£n coÌ� nhÆ°Ìƒng chuyÃªÌ�n Ä‘i thuÌ� viÌ£!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void cancelBookedTour(HttpServletRequest request, HttpServletResponse response, String postUrl,
			String postId, String customerId, dtoUser customerAccount, dtoUser postOwnerAccount) {
		dtoBookedTour bookedTour = new dtoBookedTour();
		bookedTour.setTourId(postId);
		bookedTour.setUserId(customerId);
		bookedTour.setTime(getCurrentDateTime());
		bookedTour.setStatus(0);

		mdBookedTour.updateBookedTour(bookedTour);

		String content = "Xin chaÌ€o " + postOwnerAccount.getFullName() + "! <br>"
				+ "KhaÌ�ch haÌ€ng Ä‘ÄƒÌ£t tour du liÌ£ch baÌ£n Ä‘Äƒng taÌ£i <a href = '" + postUrl
				+ "'> BananaTour </a> vÆ°Ì€a huÌ‰y Ä‘ÄƒÌ£t tour. <br>"
				+ "ThÃ´ng tin khaÌ�ch haÌ€ng nhÆ° sau: <br> - TÃªn: " + customerAccount.getFullName()
				+ ".<br> - Email: " + customerAccount.getEmail() + ". <br> - Ä�iÃªÌ£n thoaÌ£i: "
				+ customerAccount.getPhone() + ".<br> - Ä�iÌ£a chiÌ‰: " + customerAccount.getAddress()
				+ ". <br> BananaTour rÃ¢Ì�t tiÃªÌ�c vÃªÌ€ Ä‘iÃªÌ€u naÌ€y! Xin chuÌ�c " + postOwnerAccount.getFullName()
				+ " coÌ� 1 ngaÌ€y laÌ€m viÃªÌ£c hiÃªÌ£u quaÌ‰ vaÌ€ coÌ� Ä‘Æ°Æ¡Ì£c nhÆ°Ìƒng hÆ¡Ì£p Ä‘Ã´Ì€ng chÃ¢Ì�t lÆ°Æ¡Ì£ng khaÌ�c tÆ°Ì€ BananaTour!";
		sendMail(request, customerAccount.getEmail(), "ThÃ´ng baÌ�o huÌ‰y tour", content);
		try {
			response.getWriter().write(
					"BaÌ£n Ä‘aÌƒ huÌ‰y Ä‘ÄƒÌ£t tour thaÌ€nh cÃ´ng. ChuÌ�c baÌ£n coÌ� nhÆ°Ìƒng lÆ°Ì£a choÌ£n thuÌ� viÌ£ vÆ¡Ì�i BananaTour!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void sendMail(HttpServletRequest request, String recipient, String subject, String content) {
		// verify by email
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		String resultMessage = "";
		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
			// resultMessage =
			// "B?n dï¿½ d?t tour thï¿½nh cï¿½ng, don v? l? hï¿½nh s? liï¿½n h?
			// v?i b?n s?m nh?t cï¿½ th?. Chï¿½c b?n cï¿½ nh?ng chuy?n di thï¿½
			// v?!";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "Lỗi gửi mail. Sorry!!!" + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
		}
	}
}
