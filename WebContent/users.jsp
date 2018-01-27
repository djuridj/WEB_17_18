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

<a href="logedIndex.jsp">USER PAGE</a>
<a href="subforums.jsp">SUBFORUMS</a>

<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">List Users</a>
</c:if>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>

<h3>All users</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Username</th>
			<th width="20%">Role</th>	
		</tr>
	<c:forEach items="${allusers}" var="usr">
		<tr>
			<td align="center">${usr.value.username}</td>
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