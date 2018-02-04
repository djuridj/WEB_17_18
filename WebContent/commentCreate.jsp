<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create comment</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>

<ul>
<li><a href="logedIndex.jsp">USER PAGE</a></li>
<li><a href="subforums.jsp">SUBFORUMS</a></li>
<li><a href="messages.jsp">MESSAGES</a></li>
<li><a href="complaints.jsp">COMPLAINTS</a></li>
<li><a href="search.jsp">SEARCH</a></li>

<li>
<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">LIST USERS</a>
</c:if>
</li>

<li style="float:right">
<form action="Logout" method="post">
 	<input type="submit" value = "Logout">
</form>
</li>
</ul>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>
<p>Subforum: ${param.subforum}</p>
<p>Topic: ${param.headline}</p>




	<form name = "addComment" method="POST" action="AddComment">

		<h2>New comment</h2>		
		
		 <textarea name="text" cols="40" rows="5"></textarea>
		 
		<p></p>
		<input type = "submit" value="Add Comment">
		

		 
		 <input type="hidden" name="topic" value="${param.headline}"></input>
		 
		 <input type="hidden" name="parent" value="${param.parent}"></input>
		 
	</form>

</body>
</html>