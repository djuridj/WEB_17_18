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

import beans.SubforumComplaint;

/**
 * Servlet implementation class ComplainOnSubforum
 */
@WebServlet("/ComplainOnSubforum")
public class ComplainOnSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplainOnSubforum() {
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
		String text = request.getParameter("text");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date today = Calendar.getInstance().getTime();        
		String date = df.format(today);
		String subforum = request.getParameter("subforum");
		String author = request.getParameter("author");
		String admin = "admin";
		String status = "Complaint on hold";
		String warning = "No warnings";
	
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		
		SubforumComplaint sfc = new SubforumComplaint(text, date, subforum, author, admin, status, warning);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, SubforumComplaint> subc = (Hashtable<String, SubforumComplaint>) session.getAttribute("subforumcomplaint");

		
		subc.put(text, sfc);
		session.setAttribute("subforumcomplaint", subc);
		RequestDispatcher rd = request.getRequestDispatcher("complaints.jsp");
		rd.forward(request, response);
		s.addSubforumComplaint(sfc, path);
	}

}
