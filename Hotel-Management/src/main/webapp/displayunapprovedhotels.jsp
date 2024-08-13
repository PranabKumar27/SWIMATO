<%@page import="com.jsp.hotelmanagementsystem.entities.Hotel"%>
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
<% List<Hotel> hotels=(List<Hotel>)request.getAttribute("unapprovedhotels"); %>
<table cellPadding="20px" border="2">
	<th>ID</th>
	<th>NAME</th>
	<th>E-MAIL</th>
	<th>ADDRESS</th>
	<th>MOBILE-NUMBER</th>
	<th>STATUS</th>
	<th>UNAPPROVED</th>
	
<% for(Hotel hotel:hotels) { %>
	<tr>
		<td><%=hotel.getId() %></td>
		<td><%=hotel.getName() %></td>
		<td><%=hotel.getEmail() %></td>
		<td><%=hotel.getAddress() %></td>
		<td><%=hotel.getMobilenumber() %></td>
		<td><%=hotel.getStatus() %></td>
		<td><a href="approvehotel?id=<%= hotel.getId() %>">Approve</a></td>
	</tr>

<% } %>
	
</table>
<button><a href="Adminoption.jsp">Back To Menu </a></button> 
<button><a href="adminlogout">Log Out</a></button>
</body>
</html>