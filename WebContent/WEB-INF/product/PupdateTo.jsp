<%@page import="model.ProductDao"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String image = request.getParameter("image");
	String pname = request.getParameter("pname");
	int price = Integer.parseInt(request.getParameter("price"));
	String content = request.getParameter("content");
	int point = Integer.parseInt(request.getParameter("point"));

%> 
<% 
	Product bean = new Product();
	bean.setImage(image);
	bean.setPname(pname);
	bean.setPrice(price);
	bean.setContent(content);
	bean.setPoint(point);
	
	ProductDao dao = new ProductDao();
	int cnt = -1 ;
	cnt = dao.UpdateData(bean);
%>     
<%
	if(cnt == -1){
		response.sendRedirect("PupdateForm.jsp");
	} else {
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
