<%@page import="mall.ShoppingInfo"%>
<%@ include file="./../common/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//파라미터 받아주고
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	
	//패키지 상품이 삭제되면, 할인쿠폰도 함께 삭제해주기
	if(pnum==22) {			//블랙 패키지
		mycart.DeleteOrder(pnum);
		mycart.DeleteOrder(25);
	} else if(pnum==23) {	//프룻 패키지
		mycart.DeleteOrder(pnum);
		mycart.DeleteOrder(26);
	} else if (pnum==24) {	//마카롱 패키지
		mycart.DeleteOrder(pnum);
		mycart.DeleteOrder(27);
	} else {	//일반 상품은 상품만 삭제
		mycart.DeleteOrder(pnum);
	}
	
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
