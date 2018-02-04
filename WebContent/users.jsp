<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
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

<h3>All users</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Username</th>
			<th width="20%">First name</th>
			<th width="20%">Last name</th>
			<th width="20%">Email</th>
			<th width="20%">Telephone</th>
			<th width="20%">Role</th>
			<th width="20%">Registration Date</th>	
		</tr>
	<c:forEach items="${allusers}" var="usr">
		<tr>
			<td align="center">${usr.value.username}</td>
			<td align="center">${usr.value.firstname}</td>
			<td align="center">${usr.value.lastname}</td>
			<td align="center">${usr.value.email}</td>
			<td align="center">${usr.value.telephone}</td>
			<td align="center">${usr.value.regDate}</td>
			<td align="center">
				<select name="role">
							<option selected="selected">${usr.value.role}</option>
							<c:if test="${usr.value.role == 'Admin'}">
								<option value="${usr.value.role}">Moderator</option>
								<option value="${usr.value.role}">User</option>
							</c:if>
							<c:if test="${usr.value.role == 'Moderator'}">
								<option value="${usr.value.role}">Admin</option>
								<option value="${usr.value.role}">User</option>
							</c:if>
							<c:if test="${usr.value.role == 'User'}">
								<option value="${usr.value.role}">Admin</option>
								<option value="${usr.value.role}">Moderator</option>
							</c:if>
				</select>
			</td>
			<td>
			<form name="changeRole" method="POST" action="ChangeRole">
    			<input type="submit" name="changeRoleButton" value="Change Role"></input>
    			<input type="hidden" name="username" value="${usr.value.username}"></input>
    			<input type="hidden" name="password" value="${usr.value.password}"></input>
    			<input type="hidden" name="firstname" value="${usr.value.firstname}"></input>
    			<input type="hidden" name="lastname" value="${usr.value.lastname}"></input>
    			<input type="hidden" name="telephone" value="${usr.value.telephone}"></input>
    			<input type="hidden" name="email" value="${usr.value.email}"></input>
    			<input type="hidden" name="regDate" value="${usr.value.regDate}"></input>
    			<input type="hidden" name="role" value="${usr.value.role}"></input>
  			</form>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>