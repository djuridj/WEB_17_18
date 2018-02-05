<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change topic</title>
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

<h2>Update topic:</h2>	
<form  action="UpdateTopic" method="post">
	
	<table title="Enter updated topic data" align="center" >
		<tr>
		<td>Subforum: </td>
		<td>${param.subforum}</td>
		</tr>
		
		<tr>
		<td>Headline: </td>
		<td>${param.headline}</td>
		</tr>
		
		<tr>
		<td>Type: </td>
		<td>${param.type}</td>
		</tr>
		
		<tr>
		<td>Author: </td>
		<td>${param.author}</td>
		</tr>
		
		<tr>
		<td>Date: </td>
		<td>${param.date}</td>
		</tr>
		
		<tr>
			<td>Content</td>
			<td><textarea name="content" cols="21.75" rows="7">${param.content}</textarea></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="Update"></td>
		</tr>
		
	</table>
	
	<input type="hidden" name="subforum" value="${param.subforum}"></input>
	<input type="hidden" name="headline" value="${param.headline}"></input>
	<input type="hidden" name="type" value="${param.type}"></input>
	<input type="hidden" name="author" value="${param.author}"></input>
	<input type="hidden" name="date" value="${param.date}"></input>
	<input type="hidden" name="likes" value="${param.likes}"></input>
	<input type="hidden" name="dislikes" value="${param.dislikes}"></input>
	
</form>

</body>
</html>