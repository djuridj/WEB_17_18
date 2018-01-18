package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Subforum;
import beans.User;

public class FollowSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("rawtypes")
		Enumeration e = request.getParameterNames();
		User u = (User)request.getSession().getAttribute("user");
		int j=0;
		ArrayList<String> parameterNames = new ArrayList<String>();
		Hashtable<String, Subforum> hmp = new Hashtable<String, Subforum>();
		
		while(e.hasMoreElements())
		{
			String parameterName = (String)e.nextElement();
			parameterNames.add(parameterName);
		}
		
		String path = servlets.Registration.path;
		Serialization s = new Serialization();

		hmp = s.listSubforums(path);
		ArrayList<Subforum> hm = new ArrayList<Subforum>(hmp.values()); 
		
		Hashtable<String, User> hmk = s.listUsers(path);
		ArrayList<User> hmu = new ArrayList<User>(hmk.values());
		
		for(int i=0; i<parameterNames.size(); i++)
		{
			if(parameterNames.get(i).contains("Dodaj"))
			{
				int index = Integer.parseInt(parameterNames.get(i).substring(5));
				for(Subforum p : hm)
				{
					if(j == index)
					{
						for(User us : hmu)
						{
							if(us.getUsername().equals(u.getUsername()))
							{
								u.followedSubforums.add(p);
								break;
							}
						}
					}
					j++;
				}
				break;
			}
		}
		
		s.setUsers(hmk);
		RequestDispatcher rd = request.getRequestDispatcher("logedIndex.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
