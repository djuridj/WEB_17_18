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

import beans.Subforum;
import beans.User;

/**
 * Servlet implementation class UpdateSubforum
 */
@WebServlet("/UpdateSubforum")
public class UpdateSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

    //String path = servlets.Registration.path;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = getServletContext().getRealPath("");	
		//Subforum subforum = (Subforum)session.getAttribute("changesubforum"); 
		
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String icon = request.getParameter("icon");
		String rules = request.getParameter("rules");
		
		User u = (User)request.getSession().getAttribute("user");
		String moderator = u.getUsername();
		
		Subforum sf = new Subforum(name, description, icon, rules, moderator);
		
		Serialization s = new Serialization();
		
		
		Hashtable<String, Subforum> sub = s.listSubforums(path);
		
		String idBrisanje = "";
		
		Set<String> keys = sub.keySet();
		for (String kor : keys) {
			if (kor.equals(sf.getName())) {
				idBrisanje = kor;
				
			}
		}
		
		s.deleteSubforum(idBrisanje, path);
		sub.remove(idBrisanje);
		
		s.addForum(sf, path);
		sub.put(idBrisanje, sf);
		
		session.setAttribute("subforum", sub);
		
		response.sendRedirect("subforums.jsp");
		
	}

}
