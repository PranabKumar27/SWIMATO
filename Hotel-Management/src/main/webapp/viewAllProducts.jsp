<%@page import="com.jsp.hotelmanagementsystem.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% List<Product> products=(List<Product>)request.getAttribute("allproducts"); %>

<table cellPadding="20px" border="5px">
	<th>ID</th>
	<th>NAME</th>
	<th>TYPE</th>
	<th>COST</th>
	<th>DISCOUNT</th>
	<th>UPDATE</th>
	<th>DELETE</th>
	
	<% for(Product product:products) { %>
	<tr>
		<td><%= product.getId() %></td>
		<td><%= product.getName() %></td>
		<td><%= product.getType() %></td>
		<td><%= product.getCost() %></td>
		<td><%= product.getDiscount() %></td>
		<td><a href="updateproduct?id=<%= product.getId()%>" style="text-decoration:none">update</a></td>
		<td><a href="deleteproduct?id=<%= product.getId()%>" style="text-decoration:none">delete</a></td>
	</tr>
	<% } %>
	
</table>

<a href="HotelOptions.jsp">Back to menu</a> <a href="hotellogout">LogOut</a>
</body>
</html>