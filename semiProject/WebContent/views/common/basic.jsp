<%@page import="java.util.Enumeration"%>
<%@page import="semi.admin.model.vo.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "semi.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Member loginUser = (Member)session.getAttribute("loginUser");
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>여행가조</title>
	<style>
		body {
			-webkit-user-select:none;
			-moz-user-select:none;
			-ms-user-select:none;
			user-select:none;
		}
	</style>
	</head>
	<body>
		<% if (alertMsg != null) { %>
	    	<script>
	    		alert("<%= alertMsg %>");
	    	</script>
	    	<% session.removeAttribute("alertMsg"); %>
    	<% } %>
    	
    	<script>
	    	$(function() {
	    		$('#top_menu_3').on('click', function() {
	    			window.location.href = '<%= contextPath %>/Logout.me';
		    	});
	    	})
    	</script>
	</body>
</html>