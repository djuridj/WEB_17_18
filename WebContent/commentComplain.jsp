<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comment complain</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>



	<form name = "addComplaint" method="POST" action="ComplainOnComment">
		<h2>New complaint</h2>
		
		<p>Text:</p>
		<textarea name="text" cols="40" rows="5"></textarea>
		 
		<input type = "submit" value="AddComplaint">
		 
		 <input type="hidden" name="comment" value="${param.comment}"></input>
		 <input type="hidden" name="moderator" value="${param.moderator}"></input>
		 <input type="hidden" name="author" value="${user.username}"></input>
		 
	</form>

</body>
</html>