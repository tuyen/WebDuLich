package utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelUser;
public class LoginUtility
{
	ModelUser user;
	Md5Utility md5;
	String currentUserID = null;
	String currentUserAccounttype = null;
	public LoginUtility()
	{
		user = new ModelUser();
	}
	public void signOut(HttpServletRequest request,HttpServletResponse response)
	{
		this.currentUserID = null;
		Cookie[] cookie = request.getCookies();
		if (cookie == null)
			return;
		for (Cookie c : cookie) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
	public boolean isLogged(HttpServletRequest request, HttpServletResponse response)
	{
		this.currentUserID = null;
		String remember = "";
		Cookie[] cookies = request.getCookies();
		if(cookies==null)
		{
			return false;
		}
		for (int i = 0; i < cookies.length; i++)
		{
			switch (cookies[i].getName())
			{
			case "login_remember":
				remember = cookies[i].getValue();
				break;
			case "login_cookie":
				currentUserID = cookies[i].getValue();
				break;
			case "login_accounttype":
				currentUserAccounttype = cookies[i].getValue();
			default:
				break;
			}
		}
		switch (remember)
		{
		case "true":
			return true;
		case "false":
			HttpSession session = request.getSession();
			currentUserID = (String)session.getAttribute("userID");
			currentUserAccounttype = (String)session.getAttribute("login_accounttype");
			if (this.currentUserID!=null)
				return true;
			else 
				return false;
		default:
			return false;
		}
		
	}
	public String getLoggedUserID()
	{
		return this.currentUserID;
	}
	public String getAccountType()
	{
		return this.currentUserAccounttype;
	}
}
