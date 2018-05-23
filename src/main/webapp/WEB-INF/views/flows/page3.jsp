<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>



<script type="text/javascript">

	angular.module("myApp",[]).controller("myCtrl",function( $scope , $http ){
		
		
		$scope.data = [];

		$scope.sum = 0;
		
		$http.get("fetchCartItems")
		    .then(function(response) {
		        console.log(response.data);
		    
		        $scope.data = response.data;
		    
		    	for( i = 0 ; i < $scope.data.length ; i++ ){
		    		$scope.sum += $scope.data[i].cartquantity * $scope.data[i].product.price;
		    	}
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

<body ng-app="myApp" ng-controller="myCtrl">

    <h3 style="; margin-top: 100px; text-align:center; color:green,blacks;"><u>GAMELABS</u></h3>
    <br>
    <br>
	<h4 style=" margin:auto; text-align:center; color:black;">INVOICE</h4>
	<br>
	<a style =" float: left; color:green;"  href="${flowExecutionUrl}&_eventId=goToPage2">GO TO PAGE 2</a>
	<a style =" float: right; color:green;"  href="${flowExecutionUrl}&_eventId=goToPage4">GO TO PAGE 4</a>
	<br>
	<h4 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">GRAND TOTAL:</h4>
	<h3 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">{{sum}}</h3>

	<h4 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">BILLING ADDRESS:</h4>
	<h3 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">{{data[0].cartbilladdr}}</h3>
	
	<h4 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">SHIPPING ADDRESS:</h4>
	<h3 ng-if="data.length != 0" style="margin-top: 50px; text-align:center; color:black; ">{{data[0].cartshipaddr}}</h3>
	
	<h4 ng-if="data.length == 0" style="margin-top: 50px; text-align:center; color:black; ">NOTHING IN CART </h4>

	<table ng-if="data.length != 0" style=" width:80%; margin:auto;" class="table">
	
		<thead>
			<tr>
				<td style="border-left: solid 1px black;">ID</td>
				<td style="border-left: solid 1px black;">NAME</td>
				<td style="border-left: solid 1px black;">DESCRIPTION</td>
				<td style="border-left: solid 1px black;">PRICE</td>
				<td style="border-left: solid 1px black;">QUANTITY</td>
				<td style="border-left: solid 1px black;">IMAGE</td>
				<td style="border-left: solid 1px black;">SUB-TOTAL</td>
				<td style="border-left: solid 1px black;">GRAND-TOTAL</td>
			</tr>
		</thead>
		
		<tbody>
			<tr ng-repeat="x in data" style="background-color:black; ">
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.cartid}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.product.brand}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.product.name}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.product.description}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.product.price}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white">{{x.cartquantity}}</td>
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white;  border-right: solid 1px white;">
				<img style="max-width: 200px;" class="img img-thumbnail" src="{{x.product.imageUrl}}"/>
				
				</td>	
				<td style="border-left: solid 2px white; border-bottom: solid 2px white; color: white;  border-right: solid 1px white;">
				
				{{x.cartquantity * x.product.price}}
				
				</td>
			</tr>
		</tbody>
	
	</table>
	
			
	

</body>
</html>
