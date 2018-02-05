package servlets;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Message;
import beans.User;

/**
 * Servlet implementation class AddMessage
 */
@WebServlet("/AddMessage")
public class AddMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessage() {
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
		User u = (User)request.getSession().getAttribute("user");
		Random rand = new Random();
		int  id = rand.nextInt(2000) + 1;
		String sender = u.getUsername();
		String reciever = request.getParameter("reciever");
		String content = request.getParameter("content");
		Boolean red = false;
		
		HttpSession session = request.getSession();
		
		Serialization s = new Serialization();
		Message m = new Message(id,sender,reciever,content,red);
		
		@SuppressWarnings("unchecked")
		Hashtable<String, Message> mes = (Hashtable<String, Message>) session.getAttribute("message");
		mes.put(content, m);
		
		session.setAttribute("message",mes);
		RequestDispatcher rd = request.getRequestDispatcher("messages.jsp");
		rd.forward(request, response);
		s.addMessage(m, path);
	}

}
