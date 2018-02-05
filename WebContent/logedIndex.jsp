<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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


<h3>All followed subforums</h3>
<table border="1">
		<tr>
			<th width="20%">Name</th>
			<th width="20%">Description</th>
			<th width="20%">Icon</th>
			<th width="20%">Rules</th>
			<th width="20%">Mod</th>			
		</tr>
		<c:forEach items="${followedsubforum}" var="fforum">
		<c:forEach items="${subforum}" var="forum">
		<c:if test="${ user.username == fforum.value.followe && fforum.value.name == forum.value.name}">
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

				<a href="./UnfollowSubforum?name1=${fforum.value.name}" type="button"><button>Unfollow</button></a>

			</td>
		</tr>
		</c:if>
		</c:forEach>
</c:forEach>
</table>


<h3>All saved topics</h3>
<table border="1">
		<tr>
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

				<a href="./UnsaveTopic?headline1=${stop.value.headline}"><button>Unsave</button></a>

  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

</body>
</html>