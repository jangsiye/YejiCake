<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>    

<jsp:useBean id="mdao" class="model.OrderDao" />
<%
	//총 적립 포인트는 이미 세션에 바인딩되어 있으므로 가져옴
	int totalPoint = (Integer)session.getAttribute("totalPoint");
	
	int cnt = -1 ; 
	if(mycart != null){
		cnt = mdao.calculate(loginfo, mycart, totalPoint) ;
	}
	if( cnt != -1 ){ //DB 작업 완료
		session.removeAttribute("totalAmount") ;	
		session.removeAttribute("totalPoint") ;
		session.removeAttribute("mycart") ;
		session.removeAttribute("shoplists") ; //쇼핑 정보 삭제

		session.setAttribute("message", "결재를 완료했습니다. 감사합니다.");
		
		response.sendRedirect("./../product/list.jsp") ;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	abc
</body>
</html>
