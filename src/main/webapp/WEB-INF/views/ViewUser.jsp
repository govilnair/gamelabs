<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
</head>
<body>
    <br>

	<h1 style="margin: auto; width: 80%; text-align:center;">View Users</h1>

	<br>
	
	<table style="margin: auto; width: 80%; text-align:center;" class="table table-striped">
		<b>
		<thead>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>EMAIL</td>
				<td>PASSWORD</td>
				<td>PHONE</td>
				<td>ADDRESS</td>
				<td>ROLE</td>
				<td>UPDATE</td>
				<td>DELETE</td>
			</tr>
		</thead>
		</b>
		<tbody>
		
			<c:forEach items="${usernlist}" var="x">
				<tr>
					<td>${x.getId()}</td>
					<td>${x.getUsername()}</td>
					<td>${x.getEmail()}</td>
					<td>${x.getPassword()}</td>
					<td>${x.getPhone()}</td>
					<td>${x.getAddress()}</td>
					<td>${x.getRole()}</td>
					<td><a href = "${pageContext.request.contextPath}/UpdateUsersFromDB?id=${x.getId()}" class="btn btn-primary">UPDATE</a></td>
					<td><a href="${pageContext.request.contextPath}/DeleteUsersFromDB?id=${x.getId()}" class="btn btn-danger">DELETE</a></td>
				</tr>
			</c:forEach>			
			
		</tbody>
	</table>


</body>
</html>