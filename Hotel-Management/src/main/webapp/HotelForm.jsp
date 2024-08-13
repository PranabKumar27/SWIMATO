<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="/css/HotelForm.css" %>

</style>
</head>
<body>
<%@include file="/component/navbar.jsp" %>

<form:form action="savehotel" modelAttribute="hotelobj">
<h3>HOTEL SIGNUP</h3>
 <label for="username">HOTEL NAME</label>
   <form:input  class="box" path="name"/>
<label for="username">HOTEL E-MAIL</label>
 <form:input    class="box" path="email"/>
<label for="username">HOTEL PASSWORD</label>
 <form:input   class="box" path="password"/>
<label for="username">CONTACT NO.</label>
 <form:input    class="box" path="mobilenumber"/>
<label for="username">CONTACT NO.</label>
 <form:input   class="box" path="address"/>

<input type="submit" value="Register">

 
</form:form>
</body>
</html>