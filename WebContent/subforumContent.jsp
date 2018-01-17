<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <h3>Subforum Details:</h3>
    <table border="1" cellpadding="5">
      <tr>
        <td>Name</td>
        <td>${param.name}</td>
      </tr>
      <tr>
        <td>Description</td>
        <td>${param.description}</td>
      </tr>
      <tr>
        <td>Icon</td>
        <td>${param.icon}</td>
      </tr>
      <tr>
        <td>Rules</td>
        <td>${param.rules}</td>
      </tr>
      <tr>
        <td>Moderator</td>
        <td>${param.moderator}</td>
      </tr>
    </table>
  </form>

<h3>Topics of this subforum</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Subforum</th>
			<th width="20%">Headline</th>
			<th width="20%">Type</th>
			<th width="20%">Author</th>
			<th width="20%">Date</th>			
		</tr>
	<c:forEach items="${topic}" var="top">
	<c:if test="${ param.name == top.value.subforum}">
		<tr>
			<td align="center">${top.value.subforum}</td>
			<td align="center">${top.value.headline}</td>
			<td align="center">${top.value.type}</td>
			<td align="center">${top.value.author}</td>
			<td align="center">${top.value.date}</td>
			<td>
			<form name="openTopic" action="topicContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="subforum" value="${top.value.subforum}"></input>
    			<input type="hidden" name="headline" value="${top.value.headline}"></input>
    			<input type="hidden" name="type" value="${top.value.type}"></input>
    			<input type="hidden" name="author" value="${top.value.author}"></input>
    			<input type="hidden" name="date" value="${top.value.date}"></input>
  			</form>
  			</td>
  			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Follow"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
  			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Delete"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>
	

</body>
</html>
