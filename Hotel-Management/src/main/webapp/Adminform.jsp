<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
      <%@include file="/css/Adminform.css"%>
    </style>
</head>
<body>

 <div class="overlay">
        <form:form action="saveAdmin" modelAttribute="adminobj">
            <div class="con">
                <header class="head-form">
                    <h2> ADMIN SIGN UP</h2>
                    <p> signup here with your name,email and password</p>
                </header>
                <br>
                <div class="field-set">
                	<form:input class="form-input" id="txt-input" type="text" placeholder="Name" path="name" />
                	<br>
                    <form:input class="form-input" id="txt-input" type="text" placeholder="Email" path="email" />
                    <br>
                    <form:input class="form-input" type="text" placeholder="Password" id="pwd" name="password" path="password" />
                    <br>
                    <button class="log-in"> Register </button>
                </div>
                <div class="other">
                    <button class="btn submits sign-up"><a href="Adminlogin.jsp">I'm a member</a></button>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>