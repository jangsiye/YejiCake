<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum")) ;
	mycart.DeleteOrder( pnum ) ;
	session.setAttribute("mycart", mycart) ;
	response.sendRedirect("list.jsp") ;
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
