<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>*Enter Details of Customer*</h1>
<form:form action="saveFoodOrder" modelAttribute="foodOrderObj">
	Enter Name:<form:input path="name"/><br>
	Enter MobileNumber:<form:input path="mobileNumber"/><br>
	Enter Address:<form:input path="Address"/><br>
	<input type="submit">
</form:form>
</body>
</html>