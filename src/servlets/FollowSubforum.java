package servlets;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.FollowedSub;

public class FollowSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

    String path = servlets.Registration.path;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String icon = request.getParameter("icon");
		String rules = request.getParameter("rules");
		String moderator = request.getParameter("moderator");
		String followe = request.getParameter("followe");
	
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		
		FollowedSub fs = new FollowedSub(name, description, icon, rules, moderator, followe);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, FollowedSub> fsub = (Hashtable<String, FollowedSub>) session.getAttribute("followedsubforum");

		
		fsub.put(name, fs);
		session.setAttribute("followedsubforum", fsub);
		RequestDispatcher rd = request.getRequestDispatcher("subforums.jsp");
		rd.forward(request, response);
		s.addFollowed(fs, path);
	}

}
