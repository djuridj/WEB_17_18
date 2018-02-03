<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Topic complaint</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
</head>
<body>
<h2>New complaint</h2>




	<form name = "addComplaint" method="POST" action="ComplainOnTopic">
		<table title="Enter new complaint" align="center" >
		
		<tr>
		<td align="right">Text:  </td><td><input	type="text" name="text" style="height:200px"></td>
		</tr>
		 
		 <tr>
		 <td colspan="2" align="left"><input type = "submit" value="AddComplaint"></td>
		 </tr>
		 
		 </table>
		 
		 <input type="hidden" name="topic" value="${param.headline}"></input>
		 <input type="hidden" name="moderator" value="${param.moderator}"></input>
		 <input type="hidden" name="author" value="${user.username}"></input>
		 
	</form>
</body>
</html>