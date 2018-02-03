<%@page import="beans.SubforumSearch"%>
<%@page import="beans.TopicSearch"%>
<%@page import="beans.UserSearch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>

<a href="logedIndex.jsp">USER PAGE</a>
<a href="subforums.jsp">SUBFORUMS</a>
<a href="messages.jsp">MESSAGES</a>
<a href="complaints.jsp">COMPLAINTS</a>
<a href="search.jsp">SEARCH</a>

<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">List Users</a>
</c:if>

<p>Logged user: ${user.username}</p>
<p>User role: ${user.role}</p>

<form action="Logout" method="post">
 	<input type="submit" value = "Logout">
</form>

<% SubforumSearch ss = new SubforumSearch(); %>
<%if(session.getAttribute("pppSesija") == null) {ss.name = ""; ss.description = ""; ss.moderator = "";} else { ss =(SubforumSearch) session.getAttribute("pppSesija");} %>

<% TopicSearch ts = new TopicSearch(); %>
<%if(session.getAttribute("tttSesija") == null) {ts.headline = ""; ts.content = ""; ts.author = ""; ts.subforum = "";} else { ts =(TopicSearch) session.getAttribute("tttSesija");} %>

<% UserSearch us = new UserSearch(); %>
<%if(session.getAttribute("uuuSesija") == null) {us.username = "";} else { us =(UserSearch) session.getAttribute("uuuSesija");} %>


<form name="subforumSearch" action="SearchSubforum" method="post">
		<h3>SUBFORUM SEARCH:</h3>
		
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="subname"  id="subname"  value="<%= ss.name %>"  /></td>
			</tr>
			<tr>
				<td>Description:</td>
				<td><input type="text" name="subdescription" id="subdescription" value="<%= ss.description %>" /></td>
			</tr>
			<tr>
				<td>Moderator:</td>
				<td><input type="text" name="submoderator" id="submoderator" value="<%= ss.moderator %>" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><button id="subforumSearch">
						Search</button></td>
			</tr>
			
		</table>
</form>

<h3>All subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Name</th>
			<th width="20%">Description</th>
			<th width="20%">Icon</th>
			<th width="20%">Rules</th>
			<th width="20%">Moderator</th>			
		</tr>
	<c:forEach items="${subforumsearch}" var="forum">
		<tr>
			<td align="center">${forum.value.name}</td>
			<td align="center">${forum.value.description}</td>
			<c:if test="${forum.value.name == 'Sport' }">
				<td><img src="img/foot.png" width = "100" height = "100"></img></td>
			</c:if>
			<td align="center">${forum.value.rules}</td>
			<td align="center">${forum.value.moderator}</td>
			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
  			<c:if test="${ user.username != null}">
  			<td>
				<form name="followSubforum" method="POST" action="FollowSubforum">
	    			<input type="submit" value="Follow Subforum"></input>
	    			<input type="hidden" name="name" value="${forum.value.name}"></input>
	    			<input type="hidden" name="description" value="${forum.value.description}"></input>
	    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
	    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
	    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
	    			<input type="hidden" name="followe" value="${sessionScope.user.username}"></input>
	  			</form>
  			</td>
  			<td>
			<a href="./DeleteSubforum?name1=${forum.value.name}"><button>DELETE</button></a>
  			</td>
  			<td>
  			<form name="changeSubforum" action="subforumContentChange.jsp">
    			<input type="submit" name="changeButton" value="Change"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
  			<td>
  			<form name="complainOnSub" action="subforumComplain.jsp">
    			<input type="submit" name="complainOnSubButton" value="Complain"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
  			</form>
  			</td>
  			</c:if>
		</tr>
	</c:forEach>
</table>

<form name="topicSearch" action="SearchTopic" method="post">
		<h3>TOPIC SEARCH:</h3>
		
		<table>
			<tr>
				<td>Headline:</td>
				<td><input type="text" name="topheadline"  id="topheadline"  value="<%= ts.headline %>"  /></td>
			</tr>
			<tr>
				<td>Content:</td>
				<td><input type="text" name="topcontent" id="topcontent" value="<%= ts.content %>" /></td>
			</tr>
			<tr>
				<td>Author:</td>
				<td><input type="text" name="topauthor" id="topauthor" value="<%= ts.author %>" /></td>
			</tr>
			<tr>
				<td>Subforum:</td>
				<td><input type="text" name="topsubforum" id="topsubforum" value="<%= ts.subforum %>" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><button id="topicSearch">
						Search</button></td>
			</tr>
			
		</table>
</form>


<h3>All Topics</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Subforum</th>
			<th width="20%">Headline</th>
			<th width="20%">Type</th>
			<th width="20%">Author</th>
			<th width="20%">Content</th>
			<th width="20%">Date</th>			
		</tr>
	<c:forEach items="${topicsearch}" var="top">
		<tr>
			<td align="center">${top.value.subforum}</td>
			<td align="center">${top.value.headline}</td>
			<td align="center">${top.value.type}</td>
			<td align="center">${top.value.author}</td>
			<td align="center">${top.value.content}</td>
			<td align="center">${top.value.date}</td>
			<td>
			<form name="openTopic" action="topicContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="content" value="${top.value.content}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
    			<input type="hidden" name="moderator" value="${param.moderator}"></input>
  			</form>
  			</td>
  			<td>
			<form name="saveTopic" method="POST" action="SaveTopic">
    			<input type="submit" name="saveTopicButton" value="Save Topic"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
    			<input type="hidden" name="content" value="${top.value.content}"></input>
    			<input type="hidden" name="follower" value="${user.username}"></input>
  			</form>
  			</td>
  			<td>
			<a href="./DeleteTopic?headline1=${top.value.headline}"><button>DELETE</button></a>
  			</td>
  			<td>
			<form name="changeTopic" action="topicChange.jsp">
    			<input type="submit" name="changeTopicButton" value="Change Topic"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
    			<input type="hidden" name="content" value="${top.value.content}"></input>
    			<input type="hidden" name="likes" value="${top.value.likes}"></input>
    			<input type="hidden" name="dislikes" value="${top.value.dislikes}"></input>
  			</form>
  			</td>
  			<td>
  			<form name="complainOnTopic" action="topicComplain.jsp">
    			<input type="submit" name="complainOnTopicButton" value="Complain"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="moderator" value="${param.moderator}"></input>
  			</form>
  			</td>
		</tr>
	</c:forEach>
</table>

<form name="userSearch" action="SearchUser" method="post">
		<h3>USER SEARCH:</h3>
		
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="useruname"  id="useruname"  value="<%= us.username %>"  /></td>
			</tr>

			
			<tr>
				<td colspan="2" align="center"><button id="userSearch">
						Search</button></td>
			</tr>
			
		</table>
</form>

<h3>All users</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Username</th>
			<th width="20%">First name</th>
			<th width="20%">Last name</th>
			<th width="20%">Email</th>
			<th width="20%">Telephone</th>
			<th width="20%">Role</th>	
		</tr>
	<c:forEach items="${usersearch}" var="usr">
		<tr>
			<td align="center">${usr.value.username}</td>
			<td align="center">${usr.value.firstname}</td>
			<td align="center">${usr.value.lastname}</td>
			<td align="center">${usr.value.email}</td>
			<td align="center">${usr.value.telephone}</td>
			<td align="center">${usr.value.role}</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>