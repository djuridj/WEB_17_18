<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<%Serialization s = new Serialization(); %>
<%//String path = "C:/Users/DIOLE/workspace helios/WEB_17_18/WebContent/db/"; %>
<%String path = Registration.path; %>
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
<%} %>

		</tr>
</table>

</body>
</html>