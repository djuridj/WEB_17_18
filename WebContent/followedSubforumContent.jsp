<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subforum</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
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
			<th width="20%">Subforum</th>
			<th width="20%">Headline</th>
			<th width="20%">Type</th>
			<th width="20%">Author</th>
			<th width="20%">Date</th>			
		</tr>
	<c:forEach items="${topic}" var="top">
	<c:if test="${ param.name == top.value.subforum ||  subforum.name == top.value.subforum}">
		<tr>
			<td align="center">${top.value.subforum}</td>
			<td align="center">${top.value.headline}</td>
			<td align="center">${top.value.type}</td>
			<td align="center">${top.value.author}</td>
			<td align="center">${top.value.date}</td>
			<td>
			<form name="openTopic" action="topicContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
  			</form>
  			</td>
  			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Follow"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
  			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Delete"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>
	
<form name="newTopic" action="topicCreate.jsp">
    			<input type="submit" name="newButton" value="New Topic"></input>
    			<input type="hidden" name="name" value="${param.name}"></input>
</form>

<h2>New topic addition</h2>


	<form name = "addTopic" method="POST" action="AddTopic">
		<table title="Enter new topic data" align="center" >
		
		<tr>
		<td align="right">Headline:  </td><td><input	type="text" name="headline"></td>
		</tr>
		
		<tr>
		<td align="right">Type:  </td><td><input type="text"	name="type"></td>	
		</tr>
		
		<tr>
		<td align="right">Content:	 </td><td>	<input type="text" name="content"></td>
		</tr>
		
		<tr>
		<td colspan="2" align="left"><input type = "submit" value="AddTopic"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="subforum" value="${param.name}"></input>
	</form>

</body>
</html>