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
<title>U Category</title>
</head>
<body>

<br>

	<h1 style="margin: auto; width: 80%; text-align:center;">Update Category</h1>

	<br>

	<form:form style="margin: auto; width: 80%; text-align:center;" 
	action="${pageContext.request.contextPath}/SaveUpdatedCategoryToDB" method="post" modelAttribute="cate">
	
			<form:hidden path="id" class="form-control"/>
	
		<form:input path="name" class="form-control"/>
		
	
		<br>
		
		<form:textarea style="resize: none;" path="description" 
		 class="form-control"></form:textarea>
	
		<br>
		
		<form:input path="" type="submit" value="Save" class="btn btn-success"/>
	
	</form:form>

</body>
</html>