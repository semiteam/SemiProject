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
	<title>Insert title here</title>
	</head>
	<body>
		<% if (alertMsg != null) { %>
	    	<script>
	    		alert("<%= alertMsg %>");
	    	</script>
	    	<% session.removeAttribute("alertMsg"); %>
    	<% } %>
    	
    	<script>
	    	$('#top_menu_3').on('click', function() {
	    		<% if (loginUser != null) {%>
	    			<% session.removeAttribute("loginUser"); %>
	    			console.log('good');
	    		<% } else if (loginAdmin != null) { %>
	    			<% session.removeAttribute("loginAdmin"); %>
	    			console.log('good55');
	    		<% } %>
	    		$('#top_menu_3').attr('href', '<%= contextPath %>/Logout.me');
	    	});
	    	
	    	/*
	    	<% if (!(loginUser != null || loginAdmin != null)) { %>
		   		$('.swiper-slide').on('click', function() {
		    		$(this).attr('onclick', 'alert("로그인 후 이용 가능한 페이지입니다.")');
		    	});
		   	<% } %>
		   	*/
    	</script>
	</body>
</html>