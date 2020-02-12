<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<jsp:useBean id="mdao" class="model.OrderDao"/>
<%
	List<Order> lists = mdao.orderMall( loginfo.getMid() ) ;
	request.setAttribute("lists", lists) ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- c:forEach 구문을 이용하여 표시하기  -->
	<!-- pdf 문서 12 페이지 그림 참고 -->
<div class="col-sm-offset-3 col-sm-6">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">이전주문내역</h2>
		</div>
		<div class="panel-body col-sm-12">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>주문 일자</th>
							<th>상세 보기</th>							
						</tr>					
					</thead>
					<c:forEach var="order" items="${requestScope.lists}" varStatus="status">
					<tr>
						<td align="center" valign="middle">${order.oid}</td>						
						<td align="center" valign="middle">${order.orderdate}</td>						
						<td align="center" valign="middle">
							<a href="detailView.jsp?oid=${order.oid}">상세 보기</a>
						</td>						
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
        
	</div>
</div>
</body>
</html>
