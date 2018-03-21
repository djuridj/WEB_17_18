package servlets;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;

/**
 * Servlet implementation class ChangeRole
 */
@WebServlet("/ChangeRole")
public class ChangeRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeRole() {
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
		//HttpSession session = request.getSession();
		String path = getServletContext().getRealPath("");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String regDate = request.getParameter("regDate");
		String role = request.getParameter("role");
		
		User u = new User(username, password, firstname, lastname, telephone, email, regDate, role);
		
		Serialization s = new Serialization();
		
		
		Hashtable<String, User> usr = s.listUsers(path);
		
		String idBrisanje = "";
		
		Set<String> keys = usr.keySet();
		for (String kor : keys) {
			if (kor.equals(u.getUsername())) {
				idBrisanje = kor;
				
			}
		}
		
		s.deleteUser(idBrisanje, path);
		usr.remove(idBrisanje);
		
		
		usr.put(idBrisanje, u);
		s.addUser(u, path);
		
		//session.setAttribute("allusers", u);
		response.sendRedirect("users.jsp");
	}

}
