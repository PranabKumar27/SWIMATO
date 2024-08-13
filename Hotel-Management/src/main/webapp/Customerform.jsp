<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="/css/Customerform.css" %>
</style>
</head>
<body>
<%@ include file="/component/navbar.jsp" %>
<form:form action="savecustomer" modelAttribute="customerobj">
<div class="inputBox">
    <form:input path="name" type="text" />
    <span>Name</span>
</div>
<div class="inputBox">
    <form:input path="email" type="email" required="required"/>
    <span>Email</span>
</div>
<div class="inputBox">
    <form:input path="password" type="password" required="required"/>
    <span>Password</span>
</div>
<div class="inputBox">
    <form:input path="address" type="text" required="required"/>
    <span>Address</span>
</div>
<div class="inputBox">
    <form:input path="mobilenumber" type="number" required="required"/>
    <span>Contact</span>
</div>
<input type="submit">
</form:form>
</body>
</html>