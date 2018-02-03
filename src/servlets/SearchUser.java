package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import beans.UserSearch;

/**
 * Servlet implementation class SearchUser
 */
@WebServlet("/SearchUser")
public class SearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = servlets.Registration.path;
		HttpSession session = request.getSession();
		Serialization s = new Serialization();
		Hashtable<String, User> usr1 = s.listUsers(path);
		List<String> list = new ArrayList<String>();
		String username = "";
		String password = "";
		String role = "";
		String firstname = "";
		String lastname = "";
		String email = "";
		String telephone = "";
		String regDate = "";

		User u = new User(username,password,firstname,lastname,telephone,email,regDate,role);
		
		String usernameU = request.getParameter("useruname");
		
		UserSearch uuu = new UserSearch();
		
		uuu.username = usernameU;

		session.setAttribute("uuuSesija", uuu);
		

		if(!usernameU.equals(""))		
		{
			Set<String> keys = usr1.keySet();
			for (String kor : keys) {

				u = usr1.get(kor);
				if(!u.getUsername().contains(usernameU))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				usr1.remove( list.get(i));
			}
		}
		
		
		session.setAttribute("usersearch", usr1);
		response.sendRedirect("search.jsp");
	}

}
