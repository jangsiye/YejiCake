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
		
		<div class="container">
			<br>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#bread">Cake</a></li>
				<li><a data-toggle="tab" href="#beverage">Other Desert</a></li>
				<li><a data-toggle="tab" href="#chicken">props</a></li>
			</ul>
		
			<div class="tab-content">

				<div id="bread" class="tab-pane fade in active">
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 1}">
					<h3>맛있는 케이크야</h3>		
					<p><img src="<%=contextPath%>/upload/${product.image}" width="50%"/></p>
					<p>
						<a href="PdetailView.jsp?pnum=${product.pnum}">
							${product.pname}
						</a>
					</p>
					<p>${product.price}</p>
				</c:when>
				</c:choose>
				</c:forEach>
				</div>
				
				<div id="beverage" class="tab-pane fade in">
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 2}">
					<h3>다른 디저트</h3>		
					<p><img src="<%=contextPath%>/upload/${product.image}" width="50%"/></p>
					<p>
						<a href="PdetailView.jsp?pnum=${product.pnum}">
							${product.pname}
						</a>
					</p>
					<p>${product.price}</p>
				</c:when>
				</c:choose>
				</c:forEach>
				</div>
				
				<div id="chicken" class="tab-pane fade in">
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 3}">
					<h3>소풉입니다</h3>		
					<p><img src="<%=contextPath%>/upload/${product.image}" width="50%"/></p>
					<p>
						<a href="PdetailView.jsp?pnum=${product.pnum}">
							${product.pname}
						</a>
					</p>
					<p>${product.price}</p>
				</c:when>
				</c:choose>
				</c:forEach>
				</div>

			</div>
		</div>

       	<div class="panel-footer">
		하단
		</div>
	</div>
	</div>
</body>
</html>
