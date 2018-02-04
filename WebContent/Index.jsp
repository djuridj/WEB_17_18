<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">
<script type="text/javascript">
	function check() {
		var message = "";
		var end = false;
		
	    var username = document.forms['login'].username.value;
	    if (username == null || username == "") {
	        message += "Username not typed in.\n";
	        end = true;
	    }
		
	    var password = document.forms['login'].password.value;
	    if (password == null || password == "") {
	        message += "Password not typed in.\n";
	        end = true;
	    }
	    
	    if(end){
	    	alert(message);
	    	return false;
	    }
	    
	}
</script>
</head>



<body>
	
	<form name="login" method="post"  action="Login" onsubmit="return check()">
		<h2>Login</h2>
   		<p>Username:</p>
  		<input type="text" name="username">
  		<p>Password:</p>
  		<input type="password" name="password">
  		<p></p>
  		<input type="submit" value="Login">
		
  		<p> Not registered? Click <a href="Registration.jsp">here</a> . </p>
	</form> 

</body>
</html>