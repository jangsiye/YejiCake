<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<jsp:useBean id="mdao" class="model.OrderDao"></jsp:useBean>
<%
	int totalPoint = (Integer)session.getAttribute("totalPoint");	//강등 필수!
	int cnt = -1;
	
	if(mycart != null) {
		cnt = mdao.calculate(loginfo, mycart, totalPoint);
	}
	
	if( cnt == 1) {	//db 작업 완료
		//장바구니 세션만 종료!! invalidate()하면 로그인까지 종료됨...
		session.removeAttribute("totalAmount");
		session.removeAttribute("totalPoint");
		session.removeAttribute("mycart");
		session.removeAttribute("shoplists");
		
		session.setAttribute("message", "결제 완료! 감사합니다.");
		
		response.sendRedirect("./../common/main.jsp");
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
