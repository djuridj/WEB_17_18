package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control",
		"private, no-store, no-cache, must-revalidate");

		HttpSession session = request.getSession();
		session.setAttribute("user", "");
		session.setAttribute("allusers", "");
		session.setAttribute("usersearch", "");
		session.setAttribute("subforum", "");
		session.setAttribute("subforumsearch", "");
		session.setAttribute("topic", "");
		session.setAttribute("topicsearch", "");
		session.setAttribute("comment", "");
		session.setAttribute("followedsubforum", "");
		session.setAttribute("message", "");
		session.setAttribute("savedtopic", "");
		session.setAttribute("subforumcomplaint", "");
		session.setAttribute("topiccomplaint", "");
		session.setAttribute("commentcomplaint", "");
		response.sendRedirect("Index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
