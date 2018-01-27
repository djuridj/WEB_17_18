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
 * Servlet implementation class UnsaveTopic
 */
@WebServlet("/UnsaveTopic")
public class UnsaveTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnsaveTopic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = servlets.Registration.path;
		
		@SuppressWarnings("unchecked")
		Hashtable<String, SavedTopic> stopics = (Hashtable<String, SavedTopic>) session.getAttribute("savedtopic");
		
		String headline = request.getParameter("headline1");	
		stopics.remove(headline);
		
		session.setAttribute("savedtopic", stopics);
		
		Serialization s = new Serialization();	
		s.unsaveTopic(headline, path);
		RequestDispatcher disp = request.getRequestDispatcher("logedIndex.jsp");
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
