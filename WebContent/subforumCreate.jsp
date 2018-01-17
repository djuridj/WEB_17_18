<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Subforum</title>
</head>
<body>
	<h2>New subforum addition</h2>

	<form align="center" name = "addSubforum" method="POST" action="AddSubforum" align="center"">
		<table title="Enter new subforum data" align="center" >
		
		<tr>
		<td align="right">Name: </td><td><input type="text" name="name"> </br></td> 
		</tr>
		
		<tr>
		<td align="right">Description:  </td><td><input	type="text" name="description"></br></td>
		</tr>
		
		<tr>
		<td align="right">Icon:  </td><td><input type="text"	name="icon">	</br>	</td>	
		</tr>
		
		<tr>
		<td align="right">Rules:	 </td><td>	<input type="text" name="rules"> </br></td>
		</tr>
		
		
		<td colspan="2" align="left"><input type = "submit" value="AddSubforum"></td>
		 </tr>
		 
		 </table>
	</form>
</body>
</html>