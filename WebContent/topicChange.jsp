<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Update topic:</h2>	
<form  action="UpdateTopic" method="post">
	<p>Subforum</p>
	<p>${param.subforum}</p>
	
	<p>Headline</p>
	<p>${param.headline}</p>
	
	<p>Type</p>
	<p>${param.type}</p>
	
	<p>Author</p>
	<p>${param.author}</p>
	
	<p>Date</p>
	<p>${param.date}</p>
	
	
	<table title="Enter updated topic data" align="center" >
	<tr>
		<td>Content</td> <td><input	type="text" name="content" value="${param.content}"></td>
	</tr>

	<tr>
		<td><input type="submit" value="Update"></td>
	</tr>
	</table>
	
	<input type="hidden" name="subforum" value="${param.subforum}"></input>
	<input type="hidden" name="headline" value="${param.headline}"></input>
	<input type="hidden" name="type" value="${param.type}"></input>
	<input type="hidden" name="author" value="${param.author}"></input>
	<input type="hidden" name="date" value="${param.date}"></input>
	<input type="hidden" name="likes" value="${param.likes}"></input>
	<input type="hidden" name="dislikes" value="${param.dislikes}"></input>
	
</form>

</body>
</html>