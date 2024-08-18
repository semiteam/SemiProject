<%@ page import = "semi.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
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