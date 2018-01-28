package servlets;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Comment;
import beans.CommentComplaint;
import beans.FollowedSub;
import beans.Message;
import beans.SavedTopic;
import beans.Subforum;
import beans.SubforumComplaint;
import beans.Topic;
import beans.TopicComplaint;
import beans.User;

public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Login() {
		// TODO Auto-generated constructor stub
	}
	
	String path = servlets.Registration.path;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		
		
		
		if(!u.getUsername().equals("nema")){ //vec je ulogovan
			response.sendRedirect("logedIndex.jsp");
			return;
		}
		request.getRequestDispatcher("loginRegularUser.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		@SuppressWarnings("unused")
		String message = "";
		
		if (username == null || password == null) {
			message = "Wrong username or password! Please try again!";
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
			return;
		}
	
	Serialization s = new Serialization();
		
	Hashtable<String, User> users = s.listUsers(path);
	Hashtable<String, User> usrs = s.listUsers(path);
	Hashtable<String, Subforum> sf = s.listSubforums(path);
	Hashtable<String, Topic> tp = s.listTopics(path);
	Hashtable<Integer, Comment> com = s.listComments(path);
	Hashtable<String, FollowedSub> fs = s.listFollowed(path);
	Hashtable<String, Message> mes = s.listMessages(path);
	Hashtable<String, SavedTopic> stc = s.listSavedTopics(path);
	Hashtable<String, SubforumComplaint> sfc = s.listSubforumComplaints(path);
	Hashtable<String, TopicComplaint> tpc = s.listSTopicComplaints(path);
	Hashtable<String, CommentComplaint> cmc = s.listCommentComplaints(path);
	
		if(users.containsKey(username)){
			User u = users.get(username);
			
			if(u.getPassword().equals(password)){
				//if(u.getRole().equals(Role.User)){
					System.out.println("User with a same name exists " + u.getUsername());
					
					HttpSession session = request.getSession();
					session.setAttribute("user", u);
					session.setAttribute("allusers", usrs);
					session.setAttribute("subforum", sf);
					session.setAttribute("topic", tp);
					session.setAttribute("comment", com);
					session.setAttribute("followedsubforum", fs);
					session.setAttribute("message", mes);
					session.setAttribute("savedtopic", stc);
					session.setAttribute("subforumcomplaint", sfc);
					session.setAttribute("topiccomplaint", tpc);
					session.setAttribute("commentcomplaint", cmc);
					response.sendRedirect("logedIndex.jsp");
					return;

				//}
			} else {
				System.out.println("Bad pass");
				message = "Wrong username or pass, try again";
				request.setAttribute("username", u.getUsername());
			}
		} else {
			System.out.println("User doesn't exist " + username);
			message = "Wrong username or pass, try again";
		}
	
	RequestDispatcher rd = request.getRequestDispatcher("logedIndex.jsp");
	rd.forward(request, response);
	return;
	}

}
