<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="beans.User" scope="session"></jsp:useBean>
<jsp:useBean id="subforum" class="beans.Subforum" scope="session"></jsp:useBean>
<%@ page import="beans.Subforum" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Topic</title>
</head>
<body>

	<p>Logged user: <%=user.getUsername() %></p>
	<p>User role: <%=user.getRole() %></p>
	<p>Registration date: <%=user.getRegDate() %></p>
	<p>Subforum: <%=subforum.getName() %></p>
	
	<h2>New topic addition</h2>

	<form align="center" name = "addTopic" method="POST" action="AddTopic" align="center"">
		<table title="Enter new topic data" align="center" >
		
		<tr>
		<td align="right">Headline:  </td><td><input	type="text" name="headline"></br></td>
		</tr>
		
		<tr>
		<td align="right">Type:  </td><td><input type="text"	name="type">	</br>	</td>	
		</tr>
		
		<tr>
		<td align="right">Content:	 </td><td>	<input type="text" name="content"> </br></td>
		</tr>
		
		<td colspan="2" align="left"><input type = "submit" value="AddTopic"></td>
		 </tr>
		 
		 </table>
	</form>
</body>
</html>