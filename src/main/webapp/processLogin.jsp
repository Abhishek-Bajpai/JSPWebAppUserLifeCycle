<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="co.edureka.jsp.dbutil.UserInfoDAOImpl"%>
<%@page import="co.edureka.jsp.dbutil.UserInfoDAO"%>
<%@page import="co.edureka.jsp.dbutil.UserInfo"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String providedUserName = request.getParameter("userID");
	String providedPassword = request.getParameter("passcode");
	

	UserInfoDAO userDAO = new UserInfoDAOImpl();
	response.setContentType("text/html");
	PrintWriter writer = response.getWriter();
//	writer.println("UserName provided on the form : " + providedUserName + "<br/>");
//	writer.println("Password provided on the form : " + providedPassword + "<br/><br/><br/><br/>");

	try {
		//userInfo.insert(new UserInfo("cosmoleak@gmail.com", "PopEye", "David", "Warner"));
		ArrayList<UserInfo> listOfUsersWithSameUID = userDAO.selectByUserName(providedUserName);
		if (null != listOfUsersWithSameUID && listOfUsersWithSameUID.size() > 0) {
			for(UserInfo userInfo:listOfUsersWithSameUID){
			if (providedUserName.equalsIgnoreCase(userInfo.getUserName()) && providedPassword.equals(userInfo.getPassword())) {
				System.out.println("UserName/PWD Matched !! ");
				writer.println("This is a valid user, User is logged in, information below !! <br/><br/>");
				
 				writer.println("<table border=1><tr>");
				writer.println("<tr><th>First Name</th><th>Last Name</th><th>User Name</th>/<tr/>");
				writer.println("<td>"+ userInfo.getFirstName() +"</td>"+"<td>"+ userInfo.getLastName() +"</td>"+"<td>"+ userInfo.getUserName() +"</td>");
				writer.println("</tr></table><br/><br/>");
				
				writer.println("<form action='logout.jsp' method='post'>");
				writer.println("<input type='submit' value='Logout' />");
				writer.println("</form>");
			}
			else {
				writer.println("<label style= \'color:red\'><h1>Invalid UserID/Password</h1></label>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
				dispatcher.include(request, response);// Include the resource in the current servlet which is login.html 
			}
			
			}	
		} else {
			// TODO : Send the user to Registration Page
			writer.println("<label style= \'color:red\'><h1>This User does NOT exist<br/>Pls register your account</h1></label>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("registration.html");
			dispatcher.include(request, response);
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>

</body>
</html>