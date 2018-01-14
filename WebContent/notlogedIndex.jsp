<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="beans.User" scope="session"></jsp:useBean>
<jsp:useBean id="subforum" class="beans.Subforum" scope="session"></jsp:useBean>
<%@ page import="beans.Subforum" %>
<%@ page import="beans.Role" %>
<%@ page import="servlets.Serialization"%>
<%@ page import="beans.User" %>
<%@ page import="servlets.FollowSubforum"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.Hashtable" %>
<%@ page import="java.util.*"%>
<%@page import="servlets.Registration"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subforums</title>
</head>
<body>

<%request.getSession().setAttribute("subforum",""); %>
<%=subforum.getName() %>

<p>Logged user: <%=user.getUsername() %></p>
<p>User role: <%=user.getRole() %></p>
<p>Registration date: <%=user.getRegDate() %></p>

<% int i=0;%>
<%Serialization s = new Serialization(); %>
<%String path = Registration.path; %>
<%//String path = "C:/Users/DIOLE/workspace helios/WEB_17_18/WebContent/db/"; %>
<%Hashtable<String, Subforum> subforums = s.listSubforums(path); %>
<%ArrayList<Subforum> sub = new ArrayList<Subforum>(subforums.values()); %>
<table border="1">
	<%for(Subforum sf : sub){ %>
		<tr>
		<td>
		<table border="1">
			<tr>
				<td>Name</td><td><%=sf.getName()%></td>
			</tr>
			<tr>
				<td>Description</td><td><%=sf.getDescription()%></td>
			</tr>
			<tr>
				<td>Icon</td><td><%=sf.getIcon()%></td>
			</tr>
			<tr>
				<td>Rules</td><td><%=sf.getRules()%></td>
			</tr>
			<tr>
				<td>Mod</td><td><%=sf.getMod()%></td>
			</tr>
		</table>
		</td>
		
		<td>
			
			<form action="FollowSubforum" method="post">
			 	<input type="submit" value = "Follow" name = "Dodaj<%=i%>">
		    </form>
			 
	    </td>
	    
	    <td>
			<form action="DeleteSubforum?name1" method="post">
			 	<input type="submit" value = "Delete">
		    </form> 
	    </td>
	    
	    <td>
	    <form action="OpenTopicForm" method="post">
	    <% request.getSession().getAttribute("subforum");
	    request.getSession().setAttribute("subforum",sf);%>
			 	<input type="submit" value = "Open">
		   </form>
	    </td>

		</tr>
	<%i++;} %>
</table>
 
<%if (!(user.getRole().equals(Role.User.name()))) { %>
<a href="subforum.jsp">Add Subforum</a>
<%} %>

</body>
</html>