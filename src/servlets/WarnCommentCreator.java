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

import beans.CommentComplaint;

/**
 * Servlet implementation class WarnCommentCreator
 */
@WebServlet("/WarnCommentCreator")
public class WarnCommentCreator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarnCommentCreator() {
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
		int comment = Integer.parseInt(request.getParameter("comment"));
		String author = request.getParameter("author");
		String admin = "admin";
		String moderator = request.getParameter("moderator");
		String status = request.getParameter("status");
		String warning = "Comment author is warned";
		
		CommentComplaint cmc = new CommentComplaint(text, date, comment, author, admin, moderator, status, warning);
		
		Serialization s = new Serialization();
		
		Hashtable<String, CommentComplaint> cc = s.listCommentComplaints(path);
		
		String idBrisanje = "";
		
		Set<String> keys = cc.keySet();
		for (String kor : keys) {
			if (kor.equals(cmc.getText())) {
				idBrisanje = kor;
				
			}
		}
		
		s.deleteCommentComplaint(idBrisanje, path);
		cc.remove(idBrisanje);

		s.addCommentComplaint(cmc, path);
		cc.put(idBrisanje, cmc);
		
		session.setAttribute("commentcomplaint", cc);
		
		response.sendRedirect("complaints.jsp");
	}

}
