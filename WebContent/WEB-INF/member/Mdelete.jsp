<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("mid");
	MemberDao dao = new MemberDao();
	dao.DeleteData(mid);	
	
	response.sendRedirect("./../member/logout.jsp") ;
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
