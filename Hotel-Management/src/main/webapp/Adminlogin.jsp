<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
 <%@include file="/css/adminlogin.css"%> 
 </style>
</head>
<body>
         <div class="overlay">
        <form action="adminValidation">
            <div class="con">
                <header class="head-form">
                    <h2> ADMIN LOG IN</h2>
                    <p>login here using your email and password</p>
                </header>
                <br>
                <div class="field-set">
                    <input class="form-input" id="txt-input" type="text" placeholder="Email" name="email"required>
                    <br>
                    <input class="form-input" type="password" placeholder="Password" id="pwd" name="password" required>
                    <br>
                    <button class="log-in"> Log In </button>
                </div>
                <div class="other">
                    <button class="btn submits frgt-pass">Forgot Password</button>
                    <button class="btn submits sign-up"><a href="addAdmin">Sign Up</a></button>
                </div>
            </div>
        </form>
    </div>
    

</body>
</html>