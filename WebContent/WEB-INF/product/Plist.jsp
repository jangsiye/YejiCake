<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="model.ProductDao" />
<%
	List<Product> lists = dao.SelectAll();
	request.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">상품 목록</h2>
		</div>
		<div class="panel-body col-sm-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>가격</th>
						
					</tr>					
				</thead>
					<c:forEach var="product" items="${requestScope.lists}" >
					<tr>
						
						<td>${product.image}</td>
						<td>
							<a href="PdetailView.jsp?pnum=${product.pnum}">
								${product.pname}
							</a>
						</td>
						<td>${product.price}</td>
						
					</tr>
					</c:forEach>
				</table>
			</div>
        	<div class="panel-footer">
			하단
			</div>
		</div>
	</div>
</body>
</html>
