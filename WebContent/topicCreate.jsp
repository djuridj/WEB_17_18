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
<p>Subofrum: ${param.name}</p>

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
		 
		 <input type="hidden" name="subforum" value="${param.name}"></input>
	</form>

</body>
</html>