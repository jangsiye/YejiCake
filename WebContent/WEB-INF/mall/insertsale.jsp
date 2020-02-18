<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	//패키지
	int pnum1 = Integer.parseInt(request.getParameter("pnum1"));
	int stock1= Integer.parseInt(request.getParameter("stock1"));
	int qty1 = Integer.parseInt(request.getParameter("qty1"));
	String remark1 = request.getParameter("remark1");
	
	//할인쿠폰
	int pnum2 = Integer.parseInt(request.getParameter("pnum2"));
	int stock2= Integer.parseInt(request.getParameter("stock2"));
	int qty2 = Integer.parseInt(request.getParameter("qty2"));
	String remark2 = request.getParameter("remark2");

	//재고 수량 초과
	if(stock1 < qty1 || stock2 < qty2 ) {
		session.setAttribute("message", "패키지 상품이 소진되었습니다 ㅜㅜ");
		response.sendRedirect("./../product/PsaleForm.jsp");
	} else {
		//장바구니에 담기
		mycart.AddOrder(pnum1, qty1, remark1);
		mycart.AddOrder(pnum2, qty2, remark2);

		//어딜가도 장바구니 정보는 유지되어야 하므로 session에 담아줌
		session.setAttribute("mycart", mycart);

		response.sendRedirect("./../mall/list.jsp");
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