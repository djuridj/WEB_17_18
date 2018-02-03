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

import beans.SubforumComplaint;

/**
 * Servlet implementation class WarnSubforumCreator
 */
@WebServlet("/WarnSubforumCreator")
public class WarnSubforumCreator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarnSubforumCreator() {
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
		String subforum = request.getParameter("subforum");
		String author = request.getParameter("author");
		String admin = "admin";
		String status = request.getParameter("status");
		String warning = "Subforum author is warned";
		
		SubforumComplaint sfc = new SubforumComplaint(text, date, subforum, author, admin, status, warning);
		
		Serialization s = new Serialization();
		
		
		Hashtable<String, SubforumComplaint> sc = s.listSubforumComplaints(path);
		
		String idBrisanje = "";
		
		Set<String> keys = sc.keySet();
		for (String kor : keys) {
			if (kor.equals(sfc.getText())) {
				idBrisanje = kor;
				
			}
		}
		
		s.deleteSubforumComplaint(idBrisanje, path);
		sc.remove(idBrisanje);

		s.addSubforumComplaint(sfc, path);
		sc.put(idBrisanje, sfc);
		
		session.setAttribute("subforumcomplaint", sc);
		
		response.sendRedirect("logedIndex.jsp");
	}

}
