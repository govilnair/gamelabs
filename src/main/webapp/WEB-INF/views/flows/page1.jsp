<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>hi there!</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>
<body>

<script type="text/javascript">

	angular.module("myApp",[]).controller("myCtrl",function( $scope , $http ){
		
		
$scope.data = [];
		
		$http.get("fetchCartItems")
		    .then(function(response) {
		        console.log(response.data);
		    
		        $scope.data = response.data;
		    });
		
		$scope.RemoveItem = function( arg ){
			
			$http.get("removeCartItem?id="+arg)
		    .then(function(response) {
		        console.log(response.data);
		    
		        if( response.data.msg == "done" ){
		       
		        	//
		        	$http.get("fetchCartItems")
				    .then(function(response) {
				        console.log(response.data);
				    
				        $scope.data = response.data;
				    });
		        	//
		        	
		        }
		        	
		        
		    });
		}
		
	});

</script>

<body ng-app="myApp" ng-controller="myCtrl" >


 <h4 style="margin-top: 100px; text-align:center; color:green;">PAGE-1</h4>

    <a style ="float: left;" href="${flowExecutionUrl}&_eventId=goToProducts">Back To Products</a>
	<a  style ="float: right;" href="${flowExecutionUrl}&_eventId=goToPage2">Go To Page 2</a>
	<h4 ng-if="data.length == 0" style="margin-top: 100px; text-align:center; color:green; ">NOTHING IN CART </h4>

	<table ng-if="data.length != 0" style="width:80%;text-align:center;margin:auto;background-color: white;" class="table table-striped">
			<thead>  
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>DESCRIPTION</td>
				<td>QUANTITY</td>
				<td>IMAGE</td>
				<td>PRICE</td>
				
				
			</tr>
		</thead>
		
		<tbody>
			<tr ng-repeat="x in data">
				<td>{{x.cartid}}</td>
				<td>{{x.product.name}}</td>
				<td>{{x.product.price}}</td>
				<td>{{x.cartquantity}}</td>
				<td>{{x.product.image}}</td>
				<td>{{x.product.description}}</td>
				
			</tr>
		</tbody>
	
	</table>

</body>
</html>

 

