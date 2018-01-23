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

<p>Sender: ${sessionScope.user.username}</p>
<p>Reciever: ${param.author}</p>

	<form name = "addMessage" method="POST" action="AddMessage">
		<table title="Enter new topic data" align="center" >
		
		<tr>
		<td align="right">Content:  </td><td><input	type="text" name="content"></td>
		</tr>
		
		<tr>
		<td colspan="2" align="left"><input type = "submit" value="AddMessage"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="reciever" value="${param.author}"></input>
	</form>

</body>
</html>