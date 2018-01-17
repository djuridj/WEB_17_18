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
<p>Registration date: ${sessionScope.user.regDate}</p>

	<form>
    <h3>Topic Details:</h3>
    <table border="1" cellpadding="5">
      <tr>
        <td>Suboforum</td>
        <td>${param.subforum}</td>
      </tr>
      <tr>
        <td>Headline</td>
        <td>${param.headline}</td>
      </tr>
      <tr>
        <td>Type</td>
        <td>${param.type}</td>
      </tr>
      <tr>
        <td>Author</td>
        <td>${param.author}</td>
      </tr>
      <tr>
        <td>Date</td>
        <td>${param.date}</td>
      </tr>
    </table>
  </form>

</body>
</html>