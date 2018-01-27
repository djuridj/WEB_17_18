<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update subforum</title>
</head>
<body>

<h2>Update subforum:</h2>	
<form  action="UpdateSubforum" method="post">
	<table title="Enter updated subofrum data" align="center" >
	<tr>
		<td>Name</td> <td><input	type="text" name="name" value="${param.name}" readonly></td>
	</tr>
	
	<tr>
		<td>Description</td> <td><input	type="text" name="description" value="${param.description}"></td>
	</tr>
	
	<tr>
		<td>Icon</td> <td><input	type="text" name="icon" value="${param.icon}"></td>
	</tr>
	
	<tr>
		<td>Rules</td> <td><input	type="text" name="rules" value="${param.rules}"></td>
	<tr>
	
	<tr>
		<td>Moderator</td> <td><input	type="text" name="moderator" value="${param.moderator}" readonly></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="Update"></td>
	</tr>
	</table>
</form>

</body>
</html>