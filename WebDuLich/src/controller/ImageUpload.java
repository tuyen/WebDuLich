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

/**
 * Servlet implementation class ImageUpload
 */
@WebServlet("/ImageUpload")
public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUpload() {
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
		String path = this.getServletContext().getRealPath("/")
				+ "/view/resource/image/user/1/";
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();

		List<String> listImages = new ArrayList<String>();
		PrintWriter out = response.getWriter();
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {				
				String name = listOfFiles[i].getName();	
				listImages.add("/view/resource/image/user/1/" + name);
			}
		}
		request.setAttribute("url_image", listImages);
		request.getRequestDispatcher("view/user-images.jsp").include(request, response);
	}

	private void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (ServletFileUpload.isMultipartContent(request)) {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			List<FileItem> files = fileUpload.parseRequest(request);
			for (FileItem i : files) {
				if (!i.isFormField()) {
					String path = this.getServletContext().getRealPath("/");
					File f = new File(path + "/view/resource/image/user/1/");
					int list = f.listFiles().length;

					String des = path
							+ "/view/resource/image/user/1/"
							+ list
							+ "."
							+ FilenameUtils.getExtension(i.getName())
									.toUpperCase();

					String url = "/view/resource/image/user/1/"
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
		try {
			this.uploadImage(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
