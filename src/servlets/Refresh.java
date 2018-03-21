package servlets;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Subforum;
import beans.Topic;
import beans.User;

/**
 * Servlet implementation class Refresh
 */
@WebServlet("/Refresh")
public class Refresh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Refresh() {
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
		
		//String path = servlets.Registration.path;
		String path = getServletContext().getRealPath("");
		Serialization s = new Serialization();
		
		Hashtable<String, Subforum> sf = s.listSubforums(path);
		Hashtable<String, Topic> tp = s.listTopics(path);
		Hashtable<String, User> usrs = s.listUsers(path);
		
		HttpSession session = request.getSession();
		session.setAttribute("usersearch", usrs);
		session.setAttribute("subforumsearch", sf);
		session.setAttribute("topicsearch", tp);
		response.sendRedirect("search.jsp");
	}

}
