package servlets;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.FollowedSub;

/**
 * Servlet implementation class UnfollowSubforum
 */
@WebServlet("/UnfollowSubforum")
public class UnfollowSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnfollowSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = servlets.Registration.path;
		
		@SuppressWarnings("unchecked")
		Hashtable<String, FollowedSub> fsubs = (Hashtable<String, FollowedSub>) session.getAttribute("followedsubforum");
		
		String name = request.getParameter("name1");	
		fsubs.remove(name);
		
		session.setAttribute("followedsubforum", fsubs);
		
		Serialization s = new Serialization();	
		s.unfollowSubforum(name, path);
		RequestDispatcher disp = request.getRequestDispatcher("logedIndex.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
