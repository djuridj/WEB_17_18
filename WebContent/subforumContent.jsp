<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>
<p>Subforum: ${param.name}</p>

	<form>
    <h3>Subforum Details:</h3>
    <table border="1" cellpadding="5">
      <tr>
        <td>Name</td>
        <td>${param.name}</td>
      </tr>
      <tr>
        <td>Description</td>
        <td>${param.description}</td>
      </tr>
      <tr>
        <td>Icon</td>
        <td>${param.icon}</td>
      </tr>
      <tr>
        <td>Rules</td>
        <td>${param.rules}</td>
      </tr>
      <tr>
        <td>Moderator</td>
        <td>${param.moderator}</td>
      </tr>
    </table>
  </form>

<h3>Topics of this subforum</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%"></th>
			<th width="20%">Likes</th>
			<th width="20%">Dislikes</th>
			<th width="20%">Subforum</th>
			<th width="20%">Headline</th>
			<th width="20%">Type</th>
			<th width="20%">Author</th>
			<th width="20%">Content</th>
			<th width="20%">Date</th>			
		</tr>
	<c:forEach items="${topic}" var="top">
	<c:if test="${ param.name == top.value.subforum ||  subforum.name == top.value.subforum}">
		<tr>
			<td>
			<form name="likeTopic" action="LikeTopic" method="post">
    			<input type="submit" name="likeButton" value="+"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="content" value="${top.value.content}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
    			<input type="hidden" name="likes" value="${top.value.likes}"></input>
    			<input type="hidden" name="dislikes" value="${top.value.dislikes}"></input>
  			</form>
  			<form name="dislikeTopic" action="DislikeTopic" method="post">
    			<input type="submit" name="dislikeButton" value="-"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="content" value="${top.value.content}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
    			<input type="hidden" name="likes" value="${top.value.likes}"></input>
    			<input type="hidden" name="dislikes" value="${top.value.dislikes}"></input>
  			</form>
			</td>
			<td align="center">${top.value.likes}</td>
			<td align="center">${top.value.dislikes}</td>
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
  			<c:if test="${user.username == top.value.author or user.username == param.moderator or user.role == 'Admin'}">
			
			<a href="./DeleteTopic?headline1=${top.value.headline}"><button>DELETE</button></a>
  			
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
  			</c:if>
  			<form name="complainOnTopic" action="topicComplain.jsp">
    			<input type="submit" name="complainOnTopicButton" value="Complain"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="moderator" value="${param.moderator}"></input>
  			</form>
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>



	<form name = "addTopic" method="POST" action="AddTopic">
	<h2>New topic addition</h2>
		<table title="Enter new topic data" align="center" >
		
		<tr>
		<td align="right">Headline:  </td><td><input	type="text" name="headline"></td>
		</tr>
		
		<tr>
		<td align="right">Type:  </td><td><input type="text"	name="type"></td>	
		</tr>
		
		<tr>
		<td align="right">Content:	 </td>
		<td><textarea name="content" cols="21.75" rows="7"></textarea></td>
		</tr>
		
		<tr>
		<td colspan="2" align="left"><input type = "submit" value="AddTopic"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="subforum" value="${param.name}"></input>
	</form>

</body>
</html>
