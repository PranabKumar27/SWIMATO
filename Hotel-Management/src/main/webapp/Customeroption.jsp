<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Integer customerid=(Integer)session.getAttribute("customerid"); %>
<%String customername=(String)session.getAttribute("customername"); %>

<% if(customerid !=null) { %>
<h1>Hello!! <%=customername %></h1>
<h3>WelCome to SWIMATO</h3>

<a href="readhotelname.jsp">View Product by hotel</a><br>
<a href="fetchallproducts">Buy Food</a><br>
<a href="readpricerange.jsp">Display Products By Range</a><br>
<a href="">View Previous Order</a>


<% } else {%>
<h1>Invalid Credential 😑❌</h1>
<h2>Please <button><a href="Customerloginform.jsp">Login</a></button> First</h2>
<% } %>
</body>
</html>