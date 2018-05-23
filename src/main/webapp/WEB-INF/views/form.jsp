<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  
      <link rel="stylesheet" href="resources/assets/css1/style.css">

  
</head>

<body>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a id="loginButton" href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          
          <form action="AddUsersToDB" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                Enter User Name<span class="req">*</span>
              </label>
              <input  name="username" type="text" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Enter User Email<span class="req">*</span>
              </label>
              <input  name="email" type="email"required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Enter User Password<span class="req">*</span>
            </label>
            <input  name="password" type="password"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Enter User phone<span class="req">*</span>
            </label>
            <input  name="phone" type="text"required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Enter User Address<span class="req">*</span>
            </label>
            <input  name="address"  type="text"required autocomplete="off"/>
          </div>
          
          
          
          
          <button type="submit" value="Go " class="button button-block"/>Submit</button>
          
          </form>

        </div>
        
        <div id="login">   
        
        	<c:if test="${empty param.error}">
        		<h1>Welcome Back!</h1>
        	</c:if>
        	
        	<c:if test="${not empty param.error}">
        		<h1>Invalid Credentials</h1>
        		
        	</c:if>
        
          
          
          <form action="${pageContext.request.contextPath}/login" method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="text"required name = "email" autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required name = "password" autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button type="submit" class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  

  

    <script  src="resources/assets/js1/index.js"></script>




</body>

</html>

<c:if test="${not empty param.error}">
        		<!-- <h1>Invalid Credentials</h1> -->
        		
        		<script type="text/javascript">
        		
        			$("#loginButton").trigger("click");
        		
        		</script>
        		
        	</c:if>