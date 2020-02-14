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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<style type="text/css">

	.box {
		float:left;
		margin: 30px;
		width: 300px;
		
	}
</style>
</head>
<body>

<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-default">
	
		<div class="panel-heading">
			<h2 class="panel-title">상품 목록</h2>
		</div>
		
		<div class="container">
			<br>
			<ul class="nav nav-tabs col-sm-10">
				<li class="active"><a data-toggle="tab" href="#cake">Cake</a></li>
				<li><a data-toggle="tab" href="#otherdesert">Other Desert</a></li>
				<li><a data-toggle="tab" href="#props">props</a></li>
			</ul>
		
			<div class="tab-content col-sm-12">

				<div id="cake" class="tab-pane fade in active">
				<h3>맛있는 케이크야</h3>		
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 1}">
					<div class="box">
						<p><img src="<%=contextPath%>/upload/${product.image}" width="100%"/></p>
						<p>
							<a href="PdetailView.jsp?pnum=${product.pnum}">
								${product.pname}
							</a>
						</p>
						<p>${product.price}Won</p>
						<p><i class="far fa-eye"></i> ${product.hit}</p>
					</div>
				</c:when>
				</c:choose>
				</c:forEach>
				</div>
				
				<div id="otherdesert" class="tab-pane fade in">
				<h3>다른 디저트</h3>
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 2}">
					<div class="box">
						<p><img src="<%=contextPath%>/upload/${product.image}" width="100%"/></p>
						<p>
							<a href="PdetailView.jsp?pnum=${product.pnum}">
								${product.pname}
							</a>
						</p>
						<p>${product.price}</p>
						<p><i class="far fa-eye"></i> ${product.hit}</p>
					</div>
				</c:when>
				</c:choose>
				</c:forEach>
				</div>
				
				<div id="props" class="tab-pane fade in">
				<h3>소품입니다</h3>
				<c:forEach var="product" items="${requestScope.lists}" >
				<c:choose>
				<c:when test="${product.category eq 3}">
					<div class="box">
						<p><img src="<%=contextPath%>/upload/${product.image}" width="100%"/></p>
						<p>
							<a href="PdetailView.jsp?pnum=${product.pnum}">
								${product.pname}
							</a>
						</p>
						<p>${product.price}</p>
						<p><i class="far fa-eye"></i> ${product.hit}</p>
					</div>
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
