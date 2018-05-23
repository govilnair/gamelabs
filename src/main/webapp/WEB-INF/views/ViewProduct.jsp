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
<title>View Products</title>
</head>
<body>
    <br>

	<h1 style="margin: auto; width: 80%; text-align:center;">View Products</h1>

	<br>
	
	<table style="margin: auto; width: 80%; text-align:center;" class="table table-striped">
		<br>
		<thead>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>DESCRIPTION</td>
				<td>PRICE</td>
				<td>QUANTITY</td>
				<td>IMAGE</td>
				<td>UPDATE</td>
				<td>DELETE</td>
			</tr>
		</thead>
		</b>
		<tbody>
		
			<c:forEach items="${prolist}" var="x"> 
				<tr>
					<td>${x.getId()}</td>
			         <td>
					<a href="${pageContext.request.contextPath}/singleProduct?id=${x.getId()}">${x.getName()}
					</a>
					</td>
					<td>${x.getDescription()}</td>
					<td>${x.getPrice() }</td>
					<td>${x.getQuantity() }</td>
					<td> <img src="${x.imageUrl}" style="height:100px; width:100px"/></td>
					<td><a href ="${pageContext.request.contextPath}/UpdateProductFromDB?id=${x.getId()}" class="btn btn-primary">UPDATE</a></td>
					<td><a href="${pageContext.request.contextPath}/DeleteProductFromDB?id=${x.getId()}" class="btn btn-danger">DELETE</a></td>
					
				</tr>
			</c:forEach>			 
			
		</tbody>
	</table>
</body>
</html>