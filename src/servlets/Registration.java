package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import beans.Role;
import beans.User;

public class Registration extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Registration() {
        super();
	} 
	
	public static String path = "C:/Users/DIOLE/workspace helios/WEB_17_18/WebContent/db/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String regDate = df.format(today);
		String role = Role.User.name();
		
		Serialization s = new Serialization();
		
		User u = new User(username, password, firstname, lastname, telephone, email, regDate, role);

		
		RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
		rd.forward(request, response);
		s.addUser(u, path);
		
	}		

}
