<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="beans.User" scope="session"></jsp:useBean>
<%@ page import="beans.Subforum" %>
<%@ page import="servlets.Serialization"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.Hashtable" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>

<p>Logged user: <%=user.getUsername() %></p>
<p>User role: <%=user.getRole() %></p>
<p>Registration date: <%=user.getRegDate() %></p>

			<form action="Logout" method="post">
			 	<input type="submit" value = "Logout">
		    </form>


<p></p>
<a href="notlogedIndex.jsp">SUBFORUMS</a>

</body>
</html>