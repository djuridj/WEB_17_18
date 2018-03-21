package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Subforum;
import beans.SubforumSearch;

/**
 * Servlet implementation class SearchSubforum
 */
@WebServlet("/SearchSubforum")
public class SearchSubforum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSubforum() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		//String path = servlets.Registration.path;
		HttpSession session = request.getSession();
		Serialization s = new Serialization();
		Hashtable<String, Subforum> sub1 = s.listSubforums(path);
		List<String> list = new ArrayList<String>();
		String name = "";
		String description = "";
		String moderator = "";
		//mozda bez ova dva
		String icon = "";
		String rules = "";
		Subforum sf = new Subforum(name,description,icon,rules,moderator);
		
		String nameS = request.getParameter("subname");
		String descriptionS = request.getParameter("subdescription");
		String moderatorS = (request.getParameter("submoderator"));	
		
		SubforumSearch sss = new SubforumSearch();
		
		sss.name = nameS;
		sss.description = descriptionS;
		sss.moderator = moderatorS;
		session.setAttribute("pppSesija", sss);
		

		if(!nameS.equals(""))		
		{
			Set<String> keys = sub1.keySet();
			for (String kor : keys) {

				sf = sub1.get(kor);
				if(!sf.getName().contains(nameS))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				sub1.remove( list.get(i));
			}
		}
		
		
		if (!descriptionS.equals("")) 
		{
			
			Set<String> keys = sub1.keySet();
			for (String kor : keys) {

				sf = sub1.get(kor);
				if(!sf.getDescription().contains(descriptionS))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				sub1.remove( list.get(i));
			}
		}
		
		if (!moderatorS.equals("")) 
		{
			
			Set<String> keys = sub1.keySet();
			for (String kor : keys) {

				sf = sub1.get(kor);
				if(!sf.getModerator().contains(moderatorS))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				sub1.remove( list.get(i));
			}
		}		
		
		session.setAttribute("subforumsearch", sub1);
		response.sendRedirect("search.jsp");
	}

}
