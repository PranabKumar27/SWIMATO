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
<form:form action="saveproduct" modelAttribute="productobj">
Enter Name:<form:input path="name"/>
Enter Type:<form:input path="type"/>
Enter Cost:<form:input path="cost"/>
Enter Discount:<form:input path="discount"/>
<input type="submit" value="Save">
</form:form>
</body>
</html>