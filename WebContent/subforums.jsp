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

<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">List Users</a>
</c:if>

<p>Logged user: ${user.username}</p>
<p>User role: ${user.role}</p>

<form action="Logout" method="post">
 	<input type="submit" value = "Logout">
</form>

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

<c:if test="${ user.role != 'User'}">

	<form name = "addSubforum" method="POST" action="AddSubforum">
		<h2>New subforum addition</h2>
		<table title="Enter new subforum data" align="center" >
		
		<tr>
		<td align="right">Name: </td><td><input type="text" name="name"></td> 
		</tr>
		
		<tr>
		<td align="right">Description:  </td><td><input	type="text" name="description"></td>
		</tr>
		
		<tr>
		<td align="right">Icon:  </td><td><input type="text"	name="icon"></td>	
		</tr>
		
		<tr>
		<td align="right">Rules:	 </td><td>	<input type="text" name="rules"></td>
		</tr>
		
		<tr>
		<td colspan="2" align="left"><input type = "submit" value="AddSubforum"></td>
		</tr>
		</table>
	</form>
</c:if>

</body>
</html>