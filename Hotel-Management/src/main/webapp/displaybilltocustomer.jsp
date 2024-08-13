<%@page import="com.jsp.hotelmanagementsystem.entities.FoodOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  FoodOrder foodOrder=(FoodOrder)request.getAttribute("foodOrderinfo"); %>

Address:<%= foodOrder.getName() %>
<%= foodOrder.getMobileNumber() %>
<%= foodOrder.getAddress() %>
<%= foodOrder.getTotalPrice() %>
</body>
</html>