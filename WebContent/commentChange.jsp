<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Udate comment</title>
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
	
<form  action="UpdateComment" method="post">
	<h2>Update comment:</h2>
	
	<p>Topic: ${param.topic}</p>
	<p>Author: ${param.author}</p>
	<p>Date made: ${param.date}</p>

		<p>Text:</p>
		<textarea name="text" cols="40" rows="5">${param.text}</textarea>  
		
	
		<input type="submit" value="Update">

	
		<input type="hidden" name="topic" value="${param.topic}"></input>
		<input type="hidden" name="author" value="${param.author}"></input>
		<input type="hidden" name="date" value="${param.date}"></input>
		<input type="hidden" name="id" value="${param.id}"></input>
		<input type="hidden" name="parent" value="${param.parent}"></input>
		<input type="hidden" name="positives" value="${param.positives}"></input>
		<input type="hidden" name="negatives" value="${param.negatives}"></input>
</form>

</body>
</html>