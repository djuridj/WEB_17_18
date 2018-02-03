<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create comment</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>
<p>Subforum: ${param.subforum}</p>
<p>Topic: ${param.headline}</p>




	<form name = "addComment" method="POST" action="AddComment">

		<h2>New comment</h2>		
		
		 <textarea name="text" cols="40" rows="5"></textarea>
		 
		<p></p>
		<input type = "submit" value="Add Comment">
		

		 
		 <input type="hidden" name="topic" value="${param.headline}"></input>
		 
		 <input type="hidden" name="parent" value="${param.parent}"></input>
		 
	</form>

</body>
</html>