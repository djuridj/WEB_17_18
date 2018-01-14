package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Subforum;
import beans.User;


public class AddSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    String path = servlets.Registration.path;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String icon = request.getParameter("icon");
		String rules = request.getParameter("rules");
		
		User u = (User)request.getSession().getAttribute("user");
		String mod = u.getUsername();
		//String mod = request.getParameter("moderator");
	
		Serialization s = new Serialization();
		
		Subforum sf = new Subforum(name, description, icon, rules, mod);
		
		try {
			s.addForum(sf, path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("subforum", sf);
		//request.getSession().setAttribute("subforum",sf);
		RequestDispatcher rd = request.getRequestDispatcher("notlogedIndex.jsp");
		rd.forward(request, response);
		return;
	}

}
