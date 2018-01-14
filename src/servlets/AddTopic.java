package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Subforum;
import beans.Topic;
import beans.User;

/**
 * Servlet implementation class AddTopic
 */
@WebServlet("/AddTopic")
public class AddTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String path = servlets.Registration.path;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTopic() {
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
		Subforum sf = (Subforum)request.getSession().getAttribute("subforum");
		String subforum = sf.getName();
		String headline = request.getParameter("headline");
		String type = request.getParameter("type");
		User u = (User)request.getSession().getAttribute("user");
		String author = u.getUsername();
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String date = df.format(today);
		String content = request.getParameter("content");
		int likes = 0;
		int dislikes = 0;
		
		Serialization s = new Serialization();
		
		Topic t = new Topic(subforum,headline,type,author,date,content,likes,dislikes);
		
		try {
			s.addTopic(t, path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("topic",t);
		RequestDispatcher rd = request.getRequestDispatcher("subforumContent.jsp");
		rd.forward(request, response);
		return;
	}

}
