<%@page import="com.jsp.hotelmanagementsystem.entities.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
html,body
{
	background-color:grey;
	color:white;
}

        .glow-on-hover {
            width: 220px;
            height: 50px;
            border: none;
            outline: none;
            color: #fff;
            background: #111;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
            
        }

        .glow-on-hover:before {
            content: '';
            background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
            position: absolute;
            top: -2px;
            left: -2px;
            background-size: 400%;
            z-index: -1;
            filter: blur(5px);
            width: calc(100% + 4px);
            height: calc(100% + 4px);
            animation: glowing 20s linear infinite;
            opacity: 0;
            transition: opacity .3s ease-in-out;
            border-radius: 10px;
        }

        .glow-on-hover:active {
            color: #000
        }

        .glow-on-hover:active:after {
            background: transparent;
        }

        .glow-on-hover:hover:before {
            opacity: 1;
        }

        .glow-on-hover:after {
            z-index: -1;
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: #111;
            left: 0;
            top: 0;
            border-radius: 10px;
        }

        @keyframes glowing {
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 400% 0;
            }

            100% {
                background-position: 0 0;
            }
        }
        a
        {
        text-decoration:none;
        color:white;
        }
        .message
        {
        	color:red;
        }
    </style>
    </head>
<body>
<%@include file="component/navbar.jsp" %>

<h4 class="message">${message}</h4>
<% Integer hotel=(Integer)session.getAttribute("hotelid"); %>
<% String hotelname=(String)session.getAttribute("hotelname"); %>


<%if(hotel!=null) { %>

<h1>WelCome !</h1>
<h1><%= hotelname%> 🤗</h1>


<button class="glow-on-hover"><a href="addproduct">ADD PRODUCT</a></button>
<button class="glow-on-hover"><a href="viewallproduct">VIEW ALL PRODUCT</a></button>
<button class="glow-on-hover"><a href="directupdateproduct.jsp">UPDATE PRODUCT</a></button>
<button class="glow-on-hover"><a href="directdeleteproduct.jsp">DELETE PRODUCT</a></button>
<button class="glow-on-hover"><a href="">PRODUCT DISCOUNT</a></button>
<% } else { %>
<h1>Invalid Credential 😑❌</h1>
<h2>Please <button><a href="HotelLogIn.jsp">Login</a></button> First</h2>
<% } %>
</body>
</html>