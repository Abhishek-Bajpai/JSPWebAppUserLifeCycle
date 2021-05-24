<%@page import="co.edureka.jsp.dbutil.UserInfo"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="co.edureka.jsp.dbutil.UserInfoDAOImpl"%>
<%@page import="co.edureka.jsp.dbutil.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Registration Form</title>
</head>
<body>
<%
String firstName = request.getParameter("fname");
String lastName = request.getParameter("lname");
String email= request.getParameter("email");
String pwd = request.getParameter("passcode");


UserInfo user=new UserInfo(email, pwd, firstName, lastName );

UserInfoDAO userDAO = new UserInfoDAOImpl();
response.setContentType("text/html");

userDAO.insert(user);

PrintWriter writer = response.getWriter();
writer.println("<h1>Account created successfully, You may login now.. <h1>");
RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
dispatcher.include(request, response);


%>

</body>
</html>