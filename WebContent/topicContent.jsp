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
<p>Subofrum: ${param.subforum}</p>

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

<h3>Comments of this topic</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Topic</th>
			<th width="20%">Author</th>
			<th width="20%">Date</th>
			<th width="20%">Parent</th>
			<th width="20%">Text</th>		
		</tr>
	<c:forEach items="${comment}" var="com">
	<c:if test="${ param.headline == com.value.topic}">
		<tr>
			<td align="center">${com.value.topic}</td>
			<td align="center">${com.value.author}</td>
			<td align="center">${com.value.date}</td>
			<td align="center">${com.value.parent}</td>
			<td align="center">${com.value.text}</td>

  			<td>
  			<!-- 
			<form name="deleteComment" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Delete"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			 -->
  			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<form name="newComment" action="commentCreate.jsp">
    			<input type="submit" name="newButton" value="New Comment"></input>
    			<input type="hidden" name="headline" value="${param.headline}"></input>
    			<input type="hidden" name="subforum" value="${param.subforum}"></input>
</form>

</body>
</html>