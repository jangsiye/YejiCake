<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mall.ShoppingInfo"%>
<%@ include file="./../common/common.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String remark = request.getParameter("remark");
%> 
<% 
	mycart.EditRemark(remark);
	//★ 다시 바인딩 해줘야 함
	session.setAttribute("mycart", mycart);
	//리스트로 돌아가기
	response.sendRedirect("list.jsp");

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
