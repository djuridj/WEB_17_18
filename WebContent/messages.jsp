<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MESSAGES</title>
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

<p>Logged user: ${user.username}</p>
<p>User role: ${user.role}</p>

<h1>MESSAGES</h1>

<h3>Recieved</h3>
<table border="1">
		<tr>
			<th width="20%">Recieved from</th>
			<th width="20%">Content</th>			
		</tr>
	<c:forEach items="${message}" var="mes">
	<c:if test="${ user.username == mes.value.reciever}">
		<tr>
			<td align="center">${mes.value.sender}</td>
			<td align="center">${mes.value.content}</td>
			<td>
			<form name="reply" action="messageCreate.jsp">
    			<input type="submit" name="reply" value="Reply"></input>
    			<input type="hidden" name="sender" value="${user.username}"></input>
    			<input type="hidden" name="author" value="${mes.value.sender}"></input>
  			</form>
  			<c:if test="${mes.value.red == false}">
			<form name="markAsRed" method="post" action="MarkAsRed">
    			<input type="submit" name="reply" value="Mark As Red"></input>
    			<input type="hidden" name="id" value="${mes.value.id}"></input>
    			<input type="hidden" name="sender" value="${mes.value.sender}"></input>
    			<input type="hidden" name=reciever value="${mes.value.reciever}"></input>
    			<input type="hidden" name="content" value="${mes.value.content}"></input>
  			</form>
  			</c:if>
			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<h3>Sent</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Sended to</th>
			<th width="20%">Content</th>
			<th width="20%">Message is red</th>			
		</tr>
	<c:forEach items="${message}" var="mes">
	<c:if test="${ user.username == mes.value.sender}">
		<tr>
			<td align="center">${mes.value.reciever}</td>
			<td align="center">${mes.value.content}</td>
			<td align="center">${mes.value.red}</td>
			<c:if test="${user.username != mes.value.sender}">
			<td>
			<form name="reply" action="messageCreate.jsp">
    			<input type="submit" name="reply" value="Reply"></input>
    			<input type="hidden" name="sender" value="${user.username}"></input>
    			<input type="hidden" name="author" value="${mes.value.sender}"></input>
  			</form>
  			</td>
			</c:if>
		</tr>
		</c:if>
	</c:forEach>
</table>

</body>
</html>