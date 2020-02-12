<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int stock= Integer.parseInt(request.getParameter("stock"));
	int qty = Integer.parseInt(request.getParameter("qty"));
	
	//재고 수량 초과
	if(stock < qty) {
		session.setAttribute("message", "재고 수량이 부족합니다 ㅜㅜ");
		response.sendRedirect("./../product/PdetailView.jsp");
	} else {
		//장바구니에 담기
		mycart.AddOrder(pnum, qty);
		//어딜가도 장바구니 정보는 유지되어야 하므로 session에 담아줌
		session.setAttribute("mycart", mycart);
		response.sendRedirect("./../product/Plist.jsp");
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
