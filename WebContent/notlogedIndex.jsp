<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="beans.User" scope="session"></jsp:useBean>
<%@ page import="beans.Subforum" %>
<%@ page import="servlets.Serialization"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.Hashtable" %>
<%@page import="beans.Subforum"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subforums</title>
</head>
<body>

<%Serialization s = new Serialization(); %>
<%String path = "C:/Users/DIOLE/workspace helios/WEB_17_18/WebContent/db/"; %>
<%Hashtable<String, Subforum> subforums = s.listSubforums(path); %>
<%ArrayList<Subforum> sub = new ArrayList<Subforum>(subforums.values()); %>
<table border="1">
	<tr>
		<th>Name</th><th>Description</th><th>Icon</th><th>Rules</th><th>Mod</th>
	</tr>
	<%for(Subforum sf : sub){ %>
		<tr>
			<td><%=sf.getName()%></td><td><%=sf.getDescription()%></td><td><%=sf.getIcon()%></td><td><%=sf.getRules()%></td><td><%=sf.getMod()%></td>
		</tr>
	<%} %>
</table>


</body>
</html>