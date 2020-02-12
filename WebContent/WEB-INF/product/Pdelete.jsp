<%@page import="model.ProductDao"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDao dao = new ProductDao();
	dao.DeleteData(pnum);
	//out.print( bean );
	
	response.sendRedirect("Plist.jsp");
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
