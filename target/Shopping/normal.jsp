<%@page import="com.app.mycart.entities.User"%>
<%
	User user=(User)session.getAttribute("current-user");

	if(user==null){
		session.setAttribute("message", "your not Logged in Please Login first");
		response.sendRedirect("login.jsp");
		return;
	}
	/* else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message","sorry! you don't have access");
			response.sendRedirect("login.jsp");
			return;
		}
	
	} */

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>
<h1>This normal user</h1>
</body>
</html>