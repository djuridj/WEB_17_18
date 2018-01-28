package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.TopicComplaint;

/**
 * Servlet implementation class ComplainOnTopic
 */
@WebServlet("/ComplainOnTopic")
public class ComplainOnTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplainOnTopic() {
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
		String text = request.getParameter("text");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String date = df.format(today);
		String topic = request.getParameter("topic");
		String author = request.getParameter("author");
		String admin = "admin";
		String moderator = request.getParameter("moderator");
	
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		
		TopicComplaint tpc = new TopicComplaint(text, date, topic, author, admin, moderator);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, TopicComplaint> topc = (Hashtable<String, TopicComplaint>) session.getAttribute("topiccomplaint");

		
		topc.put(text, tpc);
		session.setAttribute("topiccomplaint", topc);
		RequestDispatcher rd = request.getRequestDispatcher("subforums.jsp");
		rd.forward(request, response);
		s.addTopicComplaint(tpc, path);
	}

}
