package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Comment;
import beans.User;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
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
		Random rand = new Random();
		int  id = rand.nextInt(2000) + 1;
		String topic = request.getParameter("topic");
		User u = (User)request.getSession().getAttribute("user");
		String author = u.getUsername();
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String date = df.format(today);
		String a = request.getParameter("parent");
		int parent = 0;
		if (!a.equals(""))
			parent = Integer.parseInt(a);
		else
			parent = 0;

		
		String text = request.getParameter("text");
		int positives = 0;
		int negatives = 0;
		Boolean changed = false;
		
		HttpSession session = request.getSession();
		Serialization s = new Serialization();
		
		Comment c = new Comment(id,topic,author,date,parent,text,positives,negatives,changed);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, Comment> com = (Hashtable<String, Comment>) session.getAttribute("comment");
		
		com.put(text, c);
		
		session.setAttribute("comment",com);
		RequestDispatcher rd = request.getRequestDispatcher("subforums.jsp");
		rd.forward(request, response);
		s.addComment(c, path);
	}

}
