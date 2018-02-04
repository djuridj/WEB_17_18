<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/projekat.css">

<script type="text/javascript">
	function check() {
		var message = "";
		var end = false;
		
	    var name = document.forms['addSubforum'].name.value;
	    if (name == null || nema == "") {
	        message += "Name not typed in.\n";
	        end = true;
	    }
		
	    var description = document.forms['addSubforum'].description.value;
	    if (description == null || description == "") {
	        message += "Description not typed in.\n";
	        end = true;
	    }
	    
	    var icon = document.forms['addSubforum'].icon.value;
	    if (icon == null || icon == "") {
	        message += "Icon not typed in.\n";
	        end = true;
	    }
	    
	    var rules = document.forms['addSubforum'].rules.value;
	    if (rules == null || rules == "") {
	        message += "Rules not typed in.\n";
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

<ul>
<li><a href="logedIndex.jsp">USER PAGE</a></li>
<li><a href="subforums.jsp">SUBFORUMS</a></li>
<li><a href="messages.jsp">MESSAGES</a></li>
<li><a href="complaints.jsp">COMPLAINTS</a></li>
<li><a href="search.jsp">SEARCH</a></li>

<li>
<c:if test="${user.role == 'Admin'}">
	<a href="users.jsp">LIST USERS</a>
</c:if>
</li>

<li style="float:right">
<form action="Logout" method="post">
 	<input type="submit" value = "Logout">
</form>
</li>
</ul>

<p>Logged user: ${user.username}</p>
<p>User role: ${user.role}</p>

<h3>All subforums</h3>
<table border="1">
		<tr bgcolor="lightgrey">
			<th width="20%">Icon</th>
			<th width="20%">Name</th>
			<th width="20%">Description</th>
			<th width="20%">Rules</th>
			<th width="20%">Mod</th>			
		</tr>
	<c:forEach items="${subforum}" var="forum">
		<tr>
			<c:choose>
				<c:when test="${forum.value.name == 'Sport' }">
					<td align="center"><img src="img/foot.png" width = "100" height = "100"></img></td>
				</c:when>
				<c:otherwise>
					<td align="center">${forum.value.icon}</td>
				</c:otherwise>
			</c:choose>
			<td align="center">${forum.value.name}</td>
			<td align="center">${forum.value.description}</td>			
			<td align="center">${forum.value.rules}</td>
			<td align="center">${forum.value.moderator}</td>
			<td>
			<form name="openSubforum" action="subforumContent.jsp">
    			<input type="submit" name="openButton" value="Open"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			
  			<c:if test="${ user.username != null}">
  			
				<form name="followSubforum" method="POST" action="FollowSubforum">
	    			<input type="submit" value="Follow Subforum"></input>
	    			<input type="hidden" name="name" value="${forum.value.name}"></input>
	    			<input type="hidden" name="description" value="${forum.value.description}"></input>
	    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
	    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
	    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
	    			<input type="hidden" name="followe" value="${sessionScope.user.username}"></input>
	  			</form>
  			
  			<c:if test="${user.username == forum.value.moderator or user.role == 'Admin'}">
  			
			<a href="./DeleteSubforum?name1=${forum.value.name}"><button>DELETE</button></a>
  			
  			
  			<form name="changeSubforum" action="subforumContentChange.jsp">
    			<input type="submit" name="changeButton" value="Change"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
    			<input type="hidden" name="description" value="${forum.value.description}"></input>
    			<input type="hidden" name="icon" value="${forum.value.icon}"></input>
    			<input type="hidden" name="rules" value="${forum.value.rules}"></input>
    			<input type="hidden" name="moderator" value="${forum.value.moderator}"></input>
  			</form>
  			
  			</c:if>
  			
  			<form name="complainOnSub" action="subforumComplain.jsp">
    			<input type="submit" name="complainOnSubButton" value="Complain"></input>
    			<input type="hidden" name="name" value="${forum.value.name}"></input>
  			</form>
  			
  			</c:if>
		</tr>
	</c:forEach>
</table>

<c:if test="${ user.role != 'User'}">
	<form name = "addSubforum" method="POST" action="AddSubforum" onsubmit="return check()">
		<h2>New subforum addition</h2>
		<table title="Enter new subforum data" align="center" >
		
		<tr>
		<td align="right">Name: </td><td><input type="text" name="name"></td> 
		</tr>
		
		<tr>
		<td align="right">Description:  </td>
		<td>
		<textarea name="description" cols="21.75" rows="7"></textarea>
		</td>
		</tr>
		
		<tr>
		<td align="right">Icon:  </td><td><input type="text"	name="icon"></td>	
		</tr>
		
		<tr>
		<td align="right">Rules:	 </td>
		<td>
		<textarea name="rules" cols="21.75" rows="7"></textarea>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="left"><input type = "submit" value="AddSubforum"></td>
		</tr>
		</table>
	</form>
</c:if>

</body>
</html>