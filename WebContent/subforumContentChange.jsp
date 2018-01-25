<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<p>Update subforum</p>
	<p><input	type="text" name="name" value="${param.name}"></p>
	<p><input	type="text" name="name" value="${param.description}"></p>
	<p><input	type="text" name="name" value="${param.icon}"></p>
	<p><input	type="text" name="name" value="${param.rules}"></p>
	<p><input	type="text" name="name" value="${param.moderator}"></p>
	
	<a href="./ChangeTopic?name1=${param.name}">UPDATE</a>

</body>
</html>