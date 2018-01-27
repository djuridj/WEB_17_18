<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Udate comment</title>
</head>
<body>

<h2>Update comment:</h2>	
<form  action="UpdateComment" method="post">
	<p>Topic</p>
	<p>${param.topic}</p>
	
	<p>Author</p>
	<p>${param.author}</p>
	
	<p>Date made</p>
	<p>${param.date}</p>
	
	
	<table title="Edit text" align="center" >

	
	<tr>
		<td>Text</td> <td><input	type="text" name="text" value="${param.text}"></td>
	<tr>
	
	<tr>
		<td><input type="submit" value="Update"></td>
	</tr>
	</table>
	
		<input type="hidden" name="topic" value="${param.topic}"></input>
		<input type="hidden" name="author" value="${param.author}"></input>
		<input type="hidden" name="date" value="${param.date}"></input>
		<input type="hidden" name="id" value="${param.id}"></input>
		<input type="hidden" name="parent" value="${param.parent}"></input>
		<input type="hidden" name="positives" value="${param.positives}"></input>
		<input type="hidden" name="negatives" value="${param.negatives}"></input>
</form>

</body>
</html>