<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<p>Logged user: ${sessionScope.user.username}</p>
<p>User role: ${sessionScope.user.role}</p>
<p>Subforum: ${param.subforum}</p>
<p>Topic: ${param.headline}</p>

<h2>New comment</h2>


	<form name = "addComment" method="POST" action="AddComment">
		<table title="Enter new comment data" align="center" >
		
		<tr>
		<td align="right">Text:  </td><td><input	type="text" name="text"></td>
		</tr>
		 
		 <tr>
		 <td colspan="2" align="left"><input type = "submit" value="AddComment"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="topic" value="${param.headline}"></input>
		 
		 <input type="hidden" name="parent" value="${param.parent}"></input>
		 
	</form>

</body>
</html>