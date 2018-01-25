<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>

<a href="logedIndex.jsp">USER PAGE</a>
<a href="subforums.jsp">SUBFORUMS</a>

<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">List Users</a>
</c:if>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>

<form action="Logout" method="post">
 	<input type="submit" value = "Logout">
</form>

<h3>All followed subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Name</th>
			<th width="20%">Description</th>
			<th width="20%">Icon</th>
			<th width="20%">Rules</th>
			<th width="20%">Mod</th>			
		</tr>
	<c:forEach items="${followedsubforum}" var="fforum">
	<c:if test="${ user.username == fforum.value.followe}">
		<tr>
			<td align="center">${fforum.value.name}</td>
			<td align="center">${fforum.value.description}</td>
			<td align="center">${fforum.value.icon}</td>
			<td align="center">${fforum.value.rules}</td>
			<td align="center">${fforum.value.moderator}</td>
			<td>
			<form name="openSubforum" action="followedSubforumContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="name" value="${fforum.value.name}"></input>
    			<input type="hidden" name="description" value="${fforum.value.description}"></input>
    			<input type="hidden" name="icon" value="${fforum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${fforum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${fforum.value.moderator}"></input>
  			</form>
  			</td>
  			<td>
				<a href="./DeleteSubforum?name1=${forum.value.name}" type="button">Unfollow</a>
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<h3>All saved topics</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Subforum</th>
			<th width="20%">Headline</th>
			<th width="20%">Type</th>
			<th width="20%">Author</th>
			<th width="20%">Content</th>
			<th width="20%">Date</th>			
		</tr>
	<c:forEach items="${savedtopic}" var="stop">
	<c:if test="${ user.username == stop.value.follower}">
		<tr>
			<td align="center">${stop.value.subforum}</td>
			<td align="center">${stop.value.headline}</td>
			<td align="center">${stop.value.type}</td>
			<td align="center">${stop.value.author}</td>
			<td align="center">${stop.value.content}</td>
			<td align="center">${stop.value.date}</td>
			<td>
			<form name="openTopic" action="savedTopicContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="subforum" value="${stop.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${stop.value.headline}"></input>
    			<input type="hidden" name="type" value="${stop.value.type}"></input>
    			<input type="hidden" name="author" value="${stop.value.author}"></input>
    			<input type="hidden" name="content" value="${stop.value.content}"></input>
    			<input type="hidden" name="date" value="${stop.value.date}"></input>
  			</form>
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<h3>Recieved messages</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Sender</th>
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
		</tr>
		</c:if>
	</c:forEach>
</table>

</body>
</html>