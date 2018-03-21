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

import beans.Subforum;


/**
 * Servlet implementation class DeleteSubforum
 */
@WebServlet("/DeleteSubforum")
public class DeleteSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//String path = servlets.Registration.path;
		String path = getServletContext().getRealPath("");
		@SuppressWarnings("unchecked")
		Hashtable<String, Subforum> subs = (Hashtable<String, Subforum>) session.getAttribute("subforum");
		
		String name = request.getParameter("name1");	
		subs.remove(name);
		
		session.setAttribute("subforum", subs);
		
		Serialization s = new Serialization();	
		s.deleteSubforum(name, path);
		RequestDispatcher disp = request.getRequestDispatcher("subforums.jsp");
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
