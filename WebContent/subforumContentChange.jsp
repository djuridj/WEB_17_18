<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update subforum</title>
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

<h2>Update subforum:</h2>	
<form  action="UpdateSubforum" method="post">
	<table title="Enter updated subofrum data" align="center" >
	<tr>
		<td>Name</td> <td><input	type="text" name="name" value="${param.name}" readonly></td>
	</tr>
	
	<tr>
		<td>Description</td> 
		<td><textarea name="description" cols="21.75" rows="7">${param.description}</textarea></td>
	</tr>
	
	<tr>
		<td>Icon</td> <td><input	type="text" name="icon" value="${param.icon}"></td>
	</tr>
	
	<tr>
		<td>Rules</td>
		<td><textarea name="rules" cols="21.75" rows="7">${param.rules}</textarea></td>
	<tr>
	
	<tr>
		<td>Moderator</td> <td><input	type="text" name="moderator" value="${param.moderator}" readonly></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Update"></td>
	</tr>
	</table>
</form>

</body>
</html>