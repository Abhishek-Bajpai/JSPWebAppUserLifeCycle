<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout Page</title>
</head>
<body>
<%
request.getSession().invalidate();

response.getWriter().println("<br/><label style= \'color:green\'><h3>You are successfully logged out of your account! Enjoy your day.</h3></label>");

RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
dispatcher.include(request, response);// Include the resource in the current servlet which is login.html 
%>
</body>
</html>