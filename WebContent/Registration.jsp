<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>
	

	<form name = "registration" method="POST" action="Registration">
		<h2>New user registration</h2>
		<table title="Enter registration data" align="center" >
		
		<tr>
		<td align="right">Username: </td><td><input type="text" name="username"></td> 
		</tr>
		
		<tr>
		<td align="right">Password:  </td><td><input	type="password" name="password"></td>
		</tr>
		
		<tr>
		<td align="right">First Name:  </td><td><input type="text"	name="firstname"></td>	
		</tr>
		
		<tr>
		<td align="right">Last Name:	 </td><td>	<input type="text" name="lastname"></td>
		</tr>
		
		<tr>
		<td align="right">Telephone:  </td><td> <input type="text" name="telephone"></td>
		</tr>
		
		
		<tr>
		<td align="right">Email:  </td><td><input type="text"	name="email"></td>
		</tr>
		
		
		<tr>
		
		<td colspan="2" align="left"><input type = "submit" value="Registration"></td>
		 </tr>
		 
		 </table>
	</form>
</body>
</html>