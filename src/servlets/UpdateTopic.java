package servlets;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Topic;

/**
 * Servlet implementation class UpdateTopic
 */
@WebServlet("/UpdateTopic")
public class UpdateTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTopic() {
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
		HttpSession session = request.getSession();
		String path = getServletContext().getRealPath("");
		String subforum = request.getParameter("subforum");
		String headline = request.getParameter("headline");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		int likes = Integer.parseInt(request.getParameter("likes"));
		int dislikes = Integer.parseInt(request.getParameter("dislikes"));
		
		Topic to = new Topic(subforum, headline, type, author, date, content, likes, dislikes);
		
		Serialization s = new Serialization();
		
		
		Hashtable<String, Topic> top = s.listTopics(path);
		
		String idBrisanje = "";
		
		Set<String> keys = top.keySet();
		for (String kor : keys) {
			if (kor.equals(to.getHeadline())) {
				idBrisanje = kor;	
			}
		}
		
		s.deleteTopic(idBrisanje, path);
		top.remove(idBrisanje);
		
		s.addTopic(to, path);
		top.put(idBrisanje, to);
		
		session.setAttribute("topic", top);
		
		response.sendRedirect("subforums.jsp");
	}

}
