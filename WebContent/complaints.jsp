<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Complaints</title>
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


<h1>RECIEVED COMPLAINTS</h1>

<c:if test="${user.role == 'Admin'}">
<h3>Complaints on subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Subforum</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>			
		</tr>
	<c:forEach items="${subforumcomplaint}" var="sfc">
		<tr>
			<td align="center">${sfc.value.author}</td>
			<td align="center">${sfc.value.date}</td>
			<td align="center">${sfc.value.subforum}</td>
			<td align="center">${sfc.value.text}</td>
			<td align="center">${sfc.value.status}</td>
			<td align="center">${sfc.value.warning}</td>
			<c:if test="${ sfc.value.status != 'Complaint refused' }">
			<td>
			<form name="refuseComplaint" method="post" action="RefuseSubforumComplaint">
    			<input type="submit" name="reply" value="Refuse"></input>
    			<input type="hidden" name="author" value="${sfc.value.author}"></input>
    			<input type="hidden" name="date" value="${sfc.value.date}"></input>
    			<input type="hidden" name=subforum value="${sfc.value.subforum}"></input>
    			<input type="hidden" name="text" value="${sfc.value.text}"></input>
    			<input type="hidden" name="warning" value="${sfc.value.warning}"></input>
  			</form>
  			</td>
  			</c:if>
  			<c:if test="${ sfc.value.warning != 'Subforum author is warned'}">
  			<td>
			<form name="warnMaker" method="post" action="WarnSubforumCreator">
    			<input type="submit" name="reply" value="Warning"></input>
    			<input type="hidden" name="author" value="${sfc.value.author}"></input>
    			<input type="hidden" name="date" value="${sfc.value.date}"></input>
    			<input type="hidden" name=subforum value="${sfc.value.subforum}"></input>
    			<input type="hidden" name="text" value="${sfc.value.text}"></input>
    			<input type="hidden" name="status" value="${sfc.value.status}"></input>
  			</form>
  			</td>
  			</c:if>
		</tr>
	</c:forEach>
</table>
</c:if>

<h3>Complaints on topics</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Topic</th>
			<th width="20%">Moderator</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>
		</tr>
	<c:forEach items="${topiccomplaint}" var="tpc">
	<c:if test="${user.role == 'Admin' || user.username == tpc.value.moderator}">
		<tr>
			<td align="center">${tpc.value.author}</td>
			<td align="center">${tpc.value.date}</td>
			<td align="center">${tpc.value.topic}</td>
			<td align="center">${tpc.value.moderator}</td>
			<td align="center">${tpc.value.text}</td>
			<td align="center">${tpc.value.status}</td>
			<td align="center">${tpc.value.warning}</td>
			<c:if test="${ tpc.value.status != 'Complaint refused' }">
			<td>
			<form name="refuseComplaint" method="post" action="RefuseTopicComplaint">
    			<input type="submit" name="reply" value="Refuse"></input>
    			<input type="hidden" name="author" value="${tpc.value.author}"></input>
    			<input type="hidden" name="date" value="${tpc.value.date}"></input>
    			<input type="hidden" name="topic" value="${tpc.value.topic}"></input>
    			<input type="hidden" name="moderator" value="${tpc.value.moderator}"></input>
    			<input type="hidden" name="text" value="${tpc.value.text}"></input>
    			<input type="hidden" name="warning" value="${tpc.value.warning}"></input>
  			</form>
  			</td>
  			</c:if>
  			<c:if test="${ tpc.value.warning != 'Topic author is warned'}">
  			<td>
			<form name="warnMaker" method="post" action="WarnTopicCreator">
    			<input type="submit" name="reply" value="Warning"></input>
    			<input type="hidden" name="author" value="${tpc.value.author}"></input>
    			<input type="hidden" name="date" value="${tpc.value.date}"></input>
    			<input type="hidden" name="topic" value="${tpc.value.topic}"></input>
    			<input type="hidden" name="moderator" value="${tpc.value.moderator}"></input>
    			<input type="hidden" name="text" value="${tpc.value.text}"></input>
    			<input type="hidden" name="status" value="${tpc.value.status}"></input>
  			</form>
  			</td>
  			</c:if>
		</tr>
	</c:if>
	</c:forEach>
</table>

<h3>Complaints on comments</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Comment</th>
			<th width="20%">Moderator</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>			
		</tr>
	<c:forEach items="${commentcomplaint}" var="cmc">
	<c:if test="${user.role == 'Admin' || user.username == cmc.value.moderator}">
		<tr>
			<td align="center">${cmc.value.author}</td>
			<td align="center">${cmc.value.date}</td>
			<td align="center">${cmc.value.comment}</td>
			<td align="center">${cmc.value.moderator}</td>
			<td align="center">${cmc.value.text}</td>
			<td align="center">${cmc.value.status}</td>
			<td align="center">${cmc.value.warning}</td>
			<c:if test="${ cmc.value.status != 'Complaint refused' }">
			<td>
			<form name="refuseComplaint" method="post" action="RefuseCommentComplaint">
    			<input type="submit" name="reply" value="Refuse"></input>
    			<input type="hidden" name="author" value="${cmc.value.author}"></input>
    			<input type="hidden" name="date" value="${cmc.value.date}"></input>
    			<input type="hidden" name=comment value="${cmc.value.comment}"></input>
    			<input type="hidden" name=moderator value="${cmc.value.moderator}"></input>
    			<input type="hidden" name="text" value="${cmc.value.text}"></input>
    			<input type="hidden" name="warning" value="${cmc.value.warning}"></input>
  			</form>
  			</td>
  			</c:if>
  			<c:if test="${ cmc.value.warning != 'Comment author is warned'}">
  			<td>
			<form name="warnMaker" method="post" action="WarnCommentCreator">
    			<input type="submit" name="reply" value="Warning"></input>
    			<input type="hidden" name="author" value="${cmc.value.author}"></input>
    			<input type="hidden" name="date" value="${cmc.value.date}"></input>
    			<input type="hidden" name=comment value="${cmc.value.comment}"></input>
    			<input type="hidden" name=moderator value="${cmc.value.moderator}"></input>
    			<input type="hidden" name="text" value="${cmc.value.text}"></input>
    			<input type="hidden" name="status" value="${cmc.value.status}"></input>
  			</form>
  			</td>
  			</c:if>
		</tr>
	</c:if>
	</c:forEach>
</table>

<h1>MADE COMPLAINTS</h1>

<h3>Sent Complaints on subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Subforum</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>			
		</tr>
	<c:forEach items="${subforumcomplaint}" var="sfc">
	<c:if test="${user.username == sfc.value.author}">
		<tr>
			<td align="center">${sfc.value.author}</td>
			<td align="center">${sfc.value.date}</td>
			<td align="center">${sfc.value.subforum}</td>
			<td align="center">${sfc.value.text}</td>
			<td align="center">${sfc.value.status}</td>
			<td align="center">${sfc.value.warning}</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<h3>Sent Complaints on topics</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Topic</th>
			<th width="20%">Moderator</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>			
		</tr>
	<c:forEach items="${topiccomplaint}" var="tpc">
	<c:if test="${user.username == tpc.value.author}">
		<tr>
			<td align="center">${tpc.value.author}</td>
			<td align="center">${tpc.value.date}</td>
			<td align="center">${tpc.value.topic}</td>
			<td align="center">${tpc.value.moderator}</td>
			<td align="center">${tpc.value.text}</td>
			<td align="center">${tpc.value.status}</td>
			<td align="center">${tpc.value.warning}</td>
		</tr>
	</c:if>
	</c:forEach>
</table>


<h3>Sent Complaints on comments</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Comment</th>
			<th width="20%">Moderator</th>
			<th width="20%">Text</th>
			<th width="20%">Status</th>
			<th width="20%">Warning</th>			
		</tr>
	<c:forEach items="${commentcomplaint}" var="cmc">
	<c:if test="${user.username == cmc.value.author}">
		<tr>
			<td align="center">${cmc.value.author}</td>
			<td align="center">${cmc.value.date}</td>
			<td align="center">${cmc.value.comment}</td>
			<td align="center">${cmc.value.moderator}</td>
			<td align="center">${cmc.value.text}</td>
			<td align="center">${cmc.value.status}</td>
			<td align="center">${cmc.value.warning}</td>
		</tr>
	</c:if>
	</c:forEach>
</table>

</body>
</html>