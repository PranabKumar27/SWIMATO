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
<form:form action="saveupdateproduct" modelAttribute="productforupdate">
Id:<form:input path="id" readonly="true"/>
Name:<form:input path="name" /><br>
Type:<form:input path="type"/><br>
Cost:<form:input path="cost"/><br>
Discount:<form:input path="discount"/>
<input type="submit" value="Update">
</form:form>
</body>
</html>