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

import beans.Topic;
import beans.TopicSearch;

/**
 * Servlet implementation class SearchTopic
 */
@WebServlet("/SearchTopic")
public class SearchTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTopic() {
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
		String path = servlets.Registration.path;
		HttpSession session = request.getSession();
		Serialization s = new Serialization();
		Hashtable<String, Topic> top1 = s.listTopics(path);
		List<String> list = new ArrayList<String>();
		String headline = "";
		String content = "";
		String author = "";
		String subforum = "";
		//mozda bez ova dva
		String type = "";
		String date = "";
		int likes = 0;
		int dislikes = 0;
		Topic t = new Topic(subforum, headline, type, author, date, content, likes, dislikes);
		
		String headlineT = request.getParameter("topheadline");
		String contentT = request.getParameter("topcontent");
		String authorT = (request.getParameter("topauthor"));
		String subforumT = (request.getParameter("topsubforum"));
		
		TopicSearch ttt = new TopicSearch();
		
		ttt.headline = headlineT;
		ttt.content = contentT;
		ttt.author = authorT;
		ttt.subforum = subforumT;
		session.setAttribute("tttSesija", ttt);
		

		if(!headlineT.equals(""))		
		{
			Set<String> keys = top1.keySet();
			for (String kor : keys) {

				t = top1.get(kor);
				if(!t.getHeadline().contains(headlineT))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				top1.remove( list.get(i));
			}
		}
		
		
		if (!contentT.equals("")) 
		{
			
			Set<String> keys = top1.keySet();
			for (String kor : keys) {

				t= top1.get(kor);
				if(!t.getContent().contains(contentT))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				top1.remove( list.get(i));
			}
		}
		
		if (!authorT.equals("")) 
		{
			
			Set<String> keys = top1.keySet();
			for (String kor : keys) {

				t = top1.get(kor);
				if(!t.getAuthor().contains(authorT))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				top1.remove( list.get(i));
			}
		}		
		
		if (!subforumT.equals("")) 
		{
			
			Set<String> keys = top1.keySet();
			for (String kor : keys) {

				t = top1.get(kor);
				if(!t.getSubforum().contains(subforumT))
				{
					list.add(kor);
				}
			}
			for(int i=0;i<list.size();i++)
			{
				top1.remove( list.get(i));
			}
		}
		
		session.setAttribute("topicsearch", top1);
		response.sendRedirect("search.jsp");
	}

}
