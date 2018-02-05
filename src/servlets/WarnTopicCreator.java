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

import beans.TopicComplaint;

/**
 * Servlet implementation class WarnTopicCreator
 */
@WebServlet("/WarnTopicCreator")
public class WarnTopicCreator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarnTopicCreator() {
        super();
        // TODO Auto-generated constructor stub
    }

    String path = servlets.Registration.path;
    
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
		
		String text = request.getParameter("text");  
		String date = request.getParameter("date");
		String topic = request.getParameter("topic");
		String author = request.getParameter("author");
		String admin = "admin";
		String moderator = request.getParameter("moderator");
		String status = request.getParameter("status");
		String warning = "Topic author is warned";
		
		TopicComplaint tpc = new TopicComplaint(text, date, topic, author, admin, moderator, status, warning);
		
		Serialization s = new Serialization();
		
		
		Hashtable<String, TopicComplaint> tc = s.listSTopicComplaints(path);
		
		String idBrisanje = "";
		
		Set<String> keys = tc.keySet();
		for (String kor : keys) {
			if (kor.equals(tpc.getText())) {
				idBrisanje = kor;
				
			}
		}
		
		s.deleteTopicComplaint(idBrisanje, path);
		tc.remove(idBrisanje);

		s.addTopicComplaint(tpc, path);
		tc.put(idBrisanje, tpc);
		
		session.setAttribute("topiccomplaint", tc);
		
		response.sendRedirect("complaints.jsp");

	}

}
