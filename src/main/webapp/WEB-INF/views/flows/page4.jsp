<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript"></script>

angular.module("myApp",[]).controller("myCtrl",function( $scope , $http)
{
$scope.data = [];
$scope.sum = 0;
$ http.get("deleteFromCart")
.then(function(response){
console.log(response.data);

});
});

</head>
<body>


<h1 style="margin-top: 100px; text-align:center; color:green; ">page4</h1>
<br>
	<br>

	<a  style ="float: left;" href="${pageContext.request.contextPath}/ViewProduct">Back To Products</a>
	<a  style ="float: right;" href="${pageContext.request.contextPath}">Back To Home</a>

</body>
</html>