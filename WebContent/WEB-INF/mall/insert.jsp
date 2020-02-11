<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>   

<%
	int pnum = Integer.parseInt(request.getParameter("pnum")) ;
	int stock = Integer.parseInt(request.getParameter("stock")) ;
	int qty = Integer.parseInt(request.getParameter("qty")) ;
	
	if( stock < qty ){ //재고 수량 초과
		session.setAttribute("message", "재고 수량이 부족합니다ㅜㅜ");
	}else{//카트에 담기
		mycart.AddOrder(pnum, qty) ;
		session.setAttribute("mycart", mycart) ;	
	}
	response.sendRedirect("./../product/Plist.jsp") ;
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
