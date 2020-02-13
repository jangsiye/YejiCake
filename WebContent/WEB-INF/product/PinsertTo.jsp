<%@page import="model.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "./../common/common.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int maxPostSize = 10 * 1024 * 1024 ;
	String encoding = "UTF-8";

	MultipartRequest mr 
	= new MultipartRequest(
		request,
		realPath,
		maxPostSize,
		encoding,
		new DefaultFileRenamePolicy()
			);

	ProductDao dao = new ProductDao();
	int cnt = -1;
	cnt = dao.InsertData(mr);
	
	if(cnt == -1){
		response.sendRedirect("PinsertForm.jsp");
	}else{
		response.sendRedirect("Plist.jsp");
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
