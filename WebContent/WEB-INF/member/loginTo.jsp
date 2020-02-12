<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./../common/common.jsp" %>
<%
	MemberDao dao = new MemberDao();
	
	String mid = request.getParameter("mid") ;
	String password = request.getParameter("password") ;
	
	Member member = dao.LoginCheck(mid, password) ;
	
	if( member == null ){
		response.sendRedirect("loginForm.jsp") ;
	} else {
		session.setAttribute("loginfo", member) ;
		response.sendRedirect("./../common/main.jsp") ;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
