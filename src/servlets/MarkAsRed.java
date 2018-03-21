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

import beans.Message;

/**
 * Servlet implementation class MarkAsRed
 */
@WebServlet("/MarkAsRed")
public class MarkAsRed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarkAsRed() {
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
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		String sender = request.getParameter("sender");
		String reciever = request.getParameter("reciever");
		String content = request.getParameter("content");
		Boolean red = true;
		
		Message mg = new Message(id, sender, reciever, content, red);
		
		Serialization s = new Serialization();
		
		
		Hashtable<Integer, Message> msg = s.listMessages(path);
		
		int idBrisanje = 0;
		
		Set<Integer> keys = msg.keySet();
		for (Integer kor : keys) {
			if (kor.equals(mg.getId())) {
				idBrisanje = kor;
			}
		}
		
		s.deleteMessage(idBrisanje, path);
		msg.remove(idBrisanje);
		
		s.addMessage(mg, path);
		msg.put(idBrisanje, mg);
		
		session.setAttribute("message", msg);
		
		response.sendRedirect("messages.jsp");
	}

}
