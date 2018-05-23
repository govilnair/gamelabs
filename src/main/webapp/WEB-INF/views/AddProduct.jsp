<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<title>Add Product</title>
</head>
<body>

<br>

	<h1 style="margin: auto; width: 80%; text-align:center;">Add Product</h1>

	<br>

	<form:form style="margin: auto; width: 80%; text-align:center;" 
	action="${pageContext.request.contextPath}/AddProductToDB" method="post" modelAttribute="pro" enctype="multipart/form-data">
	
		<form:input path="name" placeholder="Enter Product Name" class="form-control"/>
	
		<br>
		<form:input path="price" placeholder="Enter Product Price" class="form-control"/>
		<br>
		<form:input path="description" placeholder="Enter Product description" class="form-control"/>
		<br>
		<form:input path="quantity" placeholder="Enter Product quantity" class="form-control"/>
		<br>
		
		
		
			
		<form:input path="" type="submit" value="Submit" class="btn btn-success"/>
		
		 <input type="file" name="file"><br /> 
		
		<input type="submit" value="Upload"> 

	
	</form:form>
	

</body>
</html>