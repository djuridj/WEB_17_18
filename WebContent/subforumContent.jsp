<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="beans.User" scope="session"></jsp:useBean>
<jsp:useBean id="subforum" class="beans.Subforum" scope="session"></jsp:useBean>
<%@ page import="beans.Subforum" %>
<%@ page import="beans.Role" %>
<%@ page import="beans.Topic" %>
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
<title>Insert title here</title>
</head>
<body>
	<p>Logged user: <%=user.getUsername() %></p>
	<p>User role: <%=user.getRole() %></p>
	<p>Registration date: <%=user.getRegDate() %></p>
	<p>Subforum: <%=subforum.getName() %></p>

	<%Serialization s = new Serialization(); %>
	<%//String path = "C:/Users/DIOLE/workspace helios/WEB_17_18/WebContent/db/"; %>
	<%String path = Registration.path; %>
	<%Hashtable<String, Topic> topics = s.listTopics(path); %>
	<%ArrayList<Topic> top = new ArrayList<Topic>(topics.values()); %>
	
<table border="1">
	<%for(Topic t : top){ %>
		<tr>
		<td>
		<table border="1">
			<tr>
				<td>Subforum</td><td><%=t.getSubforum()%></td>
			</tr>
			<tr>
				<td>Headline</td><td><%=t.getHeadline()%></td>
			</tr>
			<tr>
				<td>Type</td><td><%=t.getType()%></td>
			</tr>
			<tr>
				<td>Author</td><td><%=t.getAuthor()%></td>
			</tr>
			<tr>
				<td>Date</td><td><%=t.getDate()%></td>
			</tr>
			<tr>
				<td>Content</td><td><%=t.getContent()%></td>
			</tr>
			<tr>
				<td>Likes</td><td><%=t.getLikes()%></td>
			</tr>
			<tr>
				<td>Dislikes</td><td><%=t.getDislikes()%></td>
			</tr>
		</table>
		</td>
<%} %>

		</tr>
</table>

<a href="topic.jsp">Add Topic</a>

</body>
</html>
