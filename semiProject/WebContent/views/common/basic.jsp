<%@page import="java.util.Enumeration"%>
<%@page import="semi.admin.model.vo.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "semi.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	//Enumeration<String> attributeNames = request.getSession().getAttributeNames();
	//while(attributeNames.hasMoreElements()) {
	//	String key = attributeNames.nextElement();
	//	System.out.println(key + " : " + session.getAttribute(key));
	//};
	// Member loginUser = (Member)session.getAttribute("loginUser");
	// Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<% if (alertMsg != null) { %>
	    	<script>
	    		alert("<%= alertMsg %>");
	    	</script>
	    	<% session.removeAttribute("alertMsg"); %>
    	<% } %>
	</body>
</html>