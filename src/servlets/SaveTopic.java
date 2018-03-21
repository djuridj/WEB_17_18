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

import beans.SavedTopic;

/**
 * Servlet implementation class SaveTopic
 */
@WebServlet("/SaveTopic")
public class SaveTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveTopic() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //String path = servlets.Registration.path;

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
		String path = getServletContext().getRealPath("");
		String subforum = request.getParameter("subforum");
		String headline = request.getParameter("headline");
		String type = request.getParameter("type");
		String author = request.getParameter("author");        
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		String follower = request.getParameter("follower");
		
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		
		SavedTopic st = new SavedTopic(subforum,headline,type,author,date,content,follower);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, SavedTopic> stop = (Hashtable<String, SavedTopic>) session.getAttribute("savedtopic");
		
		stop.put(headline, st);
		session.setAttribute("savedtopic",stop);
		RequestDispatcher rd = request.getRequestDispatcher("logedIndex.jsp");
		rd.forward(request, response);
		s.addSavedTopic(st, path);

	}

}
