<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Topic content</title>
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
<p>Subforum: ${param.subforum}</p>
<p>Moderator of Subforum: ${param.moderator}</p>

	<form>
    <h3>Topic Details:</h3>
    <table border="1" cellpadding="5">
      <tr>
        <td>Suboforum</td>
        <td>${param.subforum}</td>
      </tr>
      <tr>
        <td>Headline</td>
        <td>${param.headline}</td>
      </tr>
      <tr>
        <td>Type</td>
        <td>${param.type}</td>
      </tr>
      <tr>
        <td>Author</td>
        <td>${param.author}</td>
      </tr>
      <tr>
        <td>Content</td>
        <td>${param.content}</td>
      </tr>
      <tr>
        <td>Date</td>
        <td>${param.date}</td>
      </tr>
    </table>
  </form>

<h3>Comments of this topic</h3>
<c:forEach items="${comment}" var="com">
<c:if test="${ param.headline == com.value.topic}">
<c:choose>
<c:when test="${com.value.parent == 0}">
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Positives</th>
			<th width="20%">Negatives</th>
			<th width="20%">Topic</th>
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Parent</th>
			<th width="20%">Text</th>
			<th width="20%">Changed</th>		
		</tr>	
		<tr>
			<td align="center">${com.value.positives}</td>
			<td align="center">${com.value.negatives}</td>
			<td align="center">${com.value.topic}</td>
			<td align="center">${com.value.author}</td>
			<td align="center">${com.value.date}</td>
			<td align="center">${com.value.parent}</td>
			<td align="center">${com.value.text}</td>
			<td align="center">${com.value.changed}</td>

  			<td> 
			<form name="addMessage" action="messageCreate.jsp">
    			<input type="submit" name="addMessage" value="Send Message To Author"></input>
    			<input type="hidden" name="sender" value="${param.username}"></input>
    			<input type="hidden" name="author" value="${com.value.author}"></input>
  			</form>
  			<form name="replyComment" action="commentCreate.jsp">
    			<input type="submit" name="replyButton" value="Reply"></input>
    			<input type="hidden" name="headline" value="${param.headline}"></input>
    			<input type="hidden" name="subforum" value="${param.subforum}"></input>
    			<input type="hidden" name="parent" value="${com.value.id}"></input>
			</form>
			<c:if test ="${user.username == com.value.author or user.username == param.moderator or  user.role == 'Admin'}">
			<form name="deleteComment" method="post" action="DeleteComment">
    			<input type="submit" name="deleteCommentButton" value="Delete"></input>
    			<input type="hidden" name="id" value="${com.value.id}"></input>
    			<input type="hidden" name="topic" value="${com.value.topic}"></input>
    			<input type="hidden" name="date" value="${com.value.date}"></input>
    			<input type="hidden" name="parent" value="${com.value.parent}"></input>
    			<input type="hidden" name=positives value="${com.value.positives}"></input>
    			<input type="hidden" name=negatives value="${com.value.negatives}"></input>
    			<input type="hidden" name=changed value="${com.value.changed}"></input>
			</form>
			</c:if>
			<c:if test ="${user.username == com.value.author or user.username == param.moderator}">
			<form name="updateComment" action="commentChange.jsp">
    			<input type="submit" name="updateComment" value="Edit"></input>
    			<input type="hidden" name="id" value="${com.value.id}"></input>
    			<input type="hidden" name="topic" value="${com.value.topic}"></input>
    			<input type="hidden" name="author" value="${com.value.author}"></input>
    			<input type="hidden" name="date" value="${com.value.date}"></input>
    			<input type="hidden" name="parent" value="${com.value.parent}"></input>
    			<input type="hidden" name="text" value="${com.value.text}"></input>
    			<input type="hidden" name=positives value="${com.value.positives}"></input>
    			<input type="hidden" name=negatives value="${com.value.negatives}"></input>
    			<input type="hidden" name=changed value="${com.value.changed}"></input>
  			</form>
  			</c:if>
  			<form name="complainOnComment" action="commentComplain.jsp">
    			<input type="submit" name="complainOnCommentButton" value="Complain"></input>
    			<input type="hidden" name="comment" value="${com.value.id}"></input>
    			<input type="hidden" name="moderator" value="${param.moderator}"></input>
  			</form>
  			</td>
		</tr>
</table>
</c:when>
<c:when test="${com.value.parent != 0}">
<div class="com">
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Positives</th>
			<th width="20%">Negatives</th>
			<th width="20%">Topic</th>
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Parent</th>
			<th width="20%">Text</th>
			<th width="20%">Changed</th>		
		</tr>	
		<tr>
			<td align="center">${com.value.positives}</td>
			<td align="center">${com.value.negatives}</td>
			<td align="center">${com.value.topic}</td>
			<td align="center">${com.value.author}</td>
			<td align="center">${com.value.date}</td>
			<td align="center">${com.value.parent}</td>
			<td align="center">${com.value.text}</td>
			<td align="center">${com.value.changed}</td>

  			<td> 
			<form name="addMessage" action="messageCreate.jsp">
    			<input type="submit" name="addMessage" value="Send Message To Author"></input>
    			<input type="hidden" name="sender" value="${param.username}"></input>
    			<input type="hidden" name="author" value="${com.value.author}"></input>
  			</form>
  			<form name="replyComment" action="commentCreate.jsp">
    			<input type="submit" name="replyButton" value="Reply"></input>
    			<input type="hidden" name="headline" value="${param.headline}"></input>
    			<input type="hidden" name="subforum" value="${param.subforum}"></input>
    			<input type="hidden" name="parent" value="${com.value.id}"></input>
			</form>
			<c:if test ="${user.username == com.value.author or user.username == param.moderator or  user.role == 'Admin'}">
			<form name="deleteComment" method="post" action="DeleteComment">
    			<input type="submit" name="deleteCommentButton" value="Delete"></input>
    			<input type="hidden" name="id" value="${com.value.id}"></input>
    			<input type="hidden" name="topic" value="${com.value.topic}"></input>
    			<input type="hidden" name="date" value="${com.value.date}"></input>
    			<input type="hidden" name="parent" value="${com.value.parent}"></input>
    			<input type="hidden" name=positives value="${com.value.positives}"></input>
    			<input type="hidden" name=negatives value="${com.value.negatives}"></input>
    			<input type="hidden" name=changed value="${com.value.changed}"></input>
			</form>
			</c:if>
			<c:if test ="${user.username == com.value.author or user.username == param.moderator}">
			<form name="updateComment" action="commentChange.jsp">
    			<input type="submit" name="updateComment" value="Edit"></input>
    			<input type="hidden" name="id" value="${com.value.id}"></input>
    			<input type="hidden" name="topic" value="${com.value.topic}"></input>
    			<input type="hidden" name="author" value="${com.value.author}"></input>
    			<input type="hidden" name="date" value="${com.value.date}"></input>
    			<input type="hidden" name="parent" value="${com.value.parent}"></input>
    			<input type="hidden" name="text" value="${com.value.text}"></input>
    			<input type="hidden" name=positives value="${com.value.positives}"></input>
    			<input type="hidden" name=negatives value="${com.value.negatives}"></input>
    			<input type="hidden" name=changed value="${com.value.changed}"></input>
  			</form>
  			</c:if>
  			<form name="complainOnComment" action="commentComplain.jsp">
    			<input type="submit" name="complainOnCommentButton" value="Complain"></input>
    			<input type="hidden" name="comment" value="${com.value.id}"></input>
    			<input type="hidden" name="moderator" value="${param.moderator}"></input>
  			</form>
  			</td>
		</tr>
</table>
</div>
</c:when>
</c:choose>
</c:if>
</c:forEach>

<form name="newComment" action="commentCreate.jsp">
    			<input type="submit" name="newButton" value="New Comment"></input>
    			<input type="hidden" name="headline" value="${param.headline}"></input>
    			<input type="hidden" name="subforum" value="${param.subforum}"></input>
</form>

</body>
</html>