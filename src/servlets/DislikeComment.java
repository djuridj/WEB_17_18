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

import beans.Comment;

/**
 * Servlet implementation class DislikeComment
 */
@WebServlet("/DislikeComment")
public class DislikeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DislikeComment() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String topic = request.getParameter("topic");
		String author = request.getParameter("author");
		String date = request.getParameter("date");
		int parent = Integer.parseInt(request.getParameter("parent"));
		String text = request.getParameter("text");
		int positives = Integer.parseInt(request.getParameter("positives"));
		int c = Integer.parseInt(request.getParameter("negatives"))+1;
		int negatives = c;
		Boolean changed = false;
		
		Comment co = new Comment(id, topic, author, date, parent, text, positives, negatives,changed);
		
		Serialization s = new Serialization();

		Hashtable<Integer, Comment> com = s.listComments(path);
		
		int idBrisanje = 0;
		
		Set<Integer> keys = com.keySet();
		for (Integer kor : keys) {
			if (kor.equals(co.getId())) {
				idBrisanje = kor;	
			}
		}
		
		s.deleteComment(idBrisanje, path);
		com.remove(idBrisanje);
		
		s.addComment(co, path);
		com.put(idBrisanje, co);
		
		session.setAttribute("comment", com);
		
		response.sendRedirect("subforums.jsp");

	}

}
