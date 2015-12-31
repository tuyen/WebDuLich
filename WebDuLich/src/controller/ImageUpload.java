package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import utility.LoginUtility;

/**
 * Servlet implementation class ImageUpload
 */
@WebServlet("/ImageUpload")
public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CheckDatabaseServerConnection ckcon = new CheckDatabaseServerConnection();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUpload() {
		super();
		// TODO Auto-generated constructor stub
	}
	LoginUtility login = new LoginUtility();
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
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		if((!login.isLogged(request, response))||(!login.getAccountType().equals("company")))
		{
			request.getRequestDispatcher("view/Access-denied.jsp").include(request,
					response);
			return;
		}
		
		String userId = login.getLoggedUserID();		
		String path = this.getServletContext().getRealPath("/")
				+ "/view/resource/image/user/" + userId + "/";
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		List<String> listImages = new ArrayList<String>();
		PrintWriter out = response.getWriter();
		if (listOfFiles != null) {
			for (int i = 0; i < listOfFiles.length; i++) {
				if (listOfFiles[i].isFile()) {
					String name = listOfFiles[i].getName();
					listImages.add("/view/resource/image/user/" + userId + "/"
							+ name);
				}
			}
		}
		request.setAttribute("url_image", listImages);
		request.getRequestDispatcher("view/user-images.jsp").include(request,
				response);
	}

	private void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		if((!login.isLogged(request, response))||(!login.getAccountType().equals("company")))
		{
			request.getRequestDispatcher("view/Access-denied.jsp").include(request,
					response);
			return;
		}
		
		String userId = login.getLoggedUserID();	
		if (ServletFileUpload.isMultipartContent(request)) {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			List<FileItem> files = fileUpload.parseRequest(request);
			for (FileItem i : files) {
				if (!i.isFormField()) {
					String path = this.getServletContext().getRealPath("/");
					File f = new File(path + "/view/resource/image/user/"
							+ userId + "/");
					int list = f.listFiles().length;

					String des = path
							+ "/view/resource/image/user/"
							+ userId
							+ "/"
							+ list
							+ "."
							+ FilenameUtils.getExtension(i.getName())
									.toUpperCase();

					String url = "/view/resource/image/user/"
							+ userId
							+ "/"
							+ list
							+ "."
							+ FilenameUtils.getExtension(i.getName())
									.toUpperCase();
					String filename = list
							+ "."
							+ FilenameUtils.getExtension(i.getName())
									.toUpperCase();
					i.write(new File(des));
					response.getWriter().print(
							"{\"uploaded\": 1,\"fileName\": \"" + filename
									+ "\",\"url\": \"" + url + "\"}");
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
		if(!ckcon.isConnected())
		{			
			request.getRequestDispatcher("view/DatabaseError.jsp").include(request,
					response);
			return;
		}
		try {
			this.uploadImage(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
