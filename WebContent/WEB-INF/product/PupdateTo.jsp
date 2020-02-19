<%@page import="model.ProductDao"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pname = request.getParameter("pname");
	int price = Integer.parseInt(request.getParameter("price"));
	int hit = Integer.parseInt(request.getParameter("hit"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String content = request.getParameter("content");
	int point = Integer.parseInt(request.getParameter("point"));

%> 
<% 
	Product product = new Product();
	
	product.setPnum(pnum);
	product.setPname(pname);
	product.setPrice(price);
	product.setHit(hit);
	product.setStock(stock);
	product.setContent(content);
	product.setPoint(point);
	
	ProductDao dao = new ProductDao();
	int cnt = -1 ;
	cnt = dao.UpdateData(product);
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
