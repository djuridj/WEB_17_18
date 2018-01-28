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

import beans.CommentComplaint;

/**
 * Servlet implementation class ComplainOnComment
 */
@WebServlet("/ComplainOnComment")
public class ComplainOnComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplainOnComment() {
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
		String text = request.getParameter("text");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String date = df.format(today);
		int comment = Integer.parseInt(request.getParameter("comment"));
		String author = request.getParameter("author");
		String admin = "admin";
		String moderator = request.getParameter("moderator");
	
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		
		CommentComplaint cmc = new CommentComplaint(text, date, comment, author, admin, moderator);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, CommentComplaint> comc = (Hashtable<String, CommentComplaint>) session.getAttribute("commentcomplaint");

		
		comc.put(text, cmc);
		session.setAttribute("commentcomplaint", comc);
		RequestDispatcher rd = request.getRequestDispatcher("subforums.jsp");
		rd.forward(request, response);
		s.addCommentComplaint(cmc, path);
	}

}
