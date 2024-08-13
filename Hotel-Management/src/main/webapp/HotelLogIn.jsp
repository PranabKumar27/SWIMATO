<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style media="screen">
       <%@include file="/css/HotelLogIn.css"%>
    </style>
</head>
<body>
<%@include file="component/navbar.jsp" %>
	 
${message}
<form action="loginvalidation" method="post">
	
	
	
	  <h3>HOTEL LOGIN</h3>
		
        <label for="username">Username</label>
        <input type="email" placeholder="Email" name="email" class="box">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" name="password" class="box">
		<h5 class="msg">${message}</h5>
        <input type="submit" value="Log In">
        <div class="social">
            <a href="addhotel" class="signup">Sign Up</a>
            <a href="#" class="forgetpassword">Forget Password?</a>
        </div>
</form>
</body>
</html>