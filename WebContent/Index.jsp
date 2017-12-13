<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Login</h2>

		 <form name="login" method="post"  action="Login" onsubmit="return proveraUnosa()" >
   		Username:<br>
  		<input type="text" name="username"></br>
  		Password:<br>
  		<input type="password" name="password"> </br>
  		<input type="submit" value="Login"></br>
		
  		<p> Not registered? Click <a href="Registration.jsp">here</a> . </p>
	</form> 

</body>
</html>