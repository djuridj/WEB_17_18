<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>
<p>Registration date: ${sessionScope.user.regDate}</p>


<h3>All subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Name</th>
			<th width="20%">Description</th>
			<th width="20%">Icon</th>
			<th width="20%">Rules</th>
			<th width="20%">Mod</th>			
		</tr>
	<c:forEach items="${subforum}" var="forum">
		<tr>
			<td align="center">${forum.value.name}</td>
			<td align="center">${forum.value.description}</td>
			<td align="center">${forum.value.icon}</td>
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
			<a href="./DeleteSubforum?name1=${forum.value.name}" type="button">DELETE</a>
  			</td>
		</tr>
	</c:forEach>
</table>


<c:if test="${ user.role != 'User'}"> 
	<a href="subforumCreate.jsp">New Subforum</a>
</c:if>

</body>
</html>