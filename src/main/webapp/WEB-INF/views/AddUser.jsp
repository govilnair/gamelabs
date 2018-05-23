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
<title>Add Users</title>
</head>
<body>

<br>

	<h1 style="margin: auto; width: 80%; text-align:center;">Add Users</h1>

	<br>


  <div id="signup">  

	<form:form style="margin: auto; width: 80%; text-align:center;" 
	action="${pageContext.request.contextPath}/AddUsersToDB" method="post" modelAttribute="usern">
	 
		<form:input path="username" placeholder="Enter User Name" class="form-control"/>
	
		<br>
		<form:input path="email" placeholder="Enter User Email" class="form-control"/>
	
		<br>
		<form:input path="password" placeholder="Enter User Password" class="form-control"/>
	
		<br>
		<form:input path="phone" placeholder="Enter User Phone" class="form-control"/>
	
		<br>
		<form:input path="address" placeholder="Enter User Address" class="form-control"/>
		
		<br>
		<form:input path="saddress" placeholder="Enter User shipping Address" class="form-control"/>
		
		<br>
		<form:input path="baddress" placeholder="Enter User billing Address" class="form-control"/>
	
		<%-- <br>
		<form:input path="urole" placeholder="Enter User role" class="form-control"/>
	
	 --%>	<br>
		<%-- <form:textarea style="resize: none;" path="description" 
		placeholder="Enter User Details" class="form-control"></form:textarea>
	 --%>
		<br>
		
		<form:input path="" type="submit" value="Submit" class="btn btn-success"/>
	
	</form:form>

</div>
</body>
</html>