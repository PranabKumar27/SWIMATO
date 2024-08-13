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
<form:form action="saveitemtoorder" modelAttribute="itemobj">
Name:<form:input type="text" path="name" readonly="true"/>
Type:<form:input type="text" path="type" readonly="true"/>
Cost:<form:input type="number" path="cost" readonly="true"/>
Enter Quantity:<form:input type="number" path="quantity"/>
<input type="submit">
</form:form>
</body>
</html>