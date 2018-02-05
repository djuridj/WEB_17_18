<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subforum Complaint</title>
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

<h2>New complaint</h2>

	<form name = "addComplaint" method="POST" action="ComplainOnSubforum">
		<table title="Enter new complaint" align="center" >
		
		<tr>
		<td align="right">Text:  </td><td><textarea name="text" cols="40" rows="5"></textarea></td>
		</tr>
		 
		 <tr>
		 <td colspan="2" align="left"><input type = "submit" value="AddComplaint"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="subforum" value="${param.name}"></input>
		 
		 <input type="hidden" name="author" value="${user.username}"></input>
		 
	</form>
</body>
</html>