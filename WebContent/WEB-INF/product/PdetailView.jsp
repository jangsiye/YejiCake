<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="dao" class="model.ProductDao" />
<%
	request.setCharacterEncoding("UTF-8");

	int pnum = Integer.parseInt(request.getParameter("pnum"));
	//조회수 증가시켜주고
	dao.UpHit(pnum);
	//데이터 불러오기
	Product product = dao.SelectByPk(pnum);
	
	request.setAttribute("product", product);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1 class="panel-title" align="left">상품 상세 보기</h1>
		</div>
		<div class="panel-body">
			<div class="col-sm-10" align="center">
			
				<h2>『 ${product.pname} 』</h2>
				<p>${product.price}원</p>
				
				<p>
					<img align="middle" src="<%=realPath%>/${product.image}"
						class="img-thumbnail" width="70%">
				</p>
				
				<p>${product.content}</p>
				
				<!-- 만약 이미지2가 있으면 그것도 출력해주기 -->
				<%if(product.getImage2() != null) { %>
				<p align="center">
					<img align="middle" src="<%=realPath%>/${product.image2}"
						class="img-thumbnail" width="70%">
				</p>
				<%} %>
				
				<p>${product.point}점을 적립해드려요.</p>
				<p>${product.hit}명이나 이 케이크를 살펴봤습니다!</p>

				<br><br>
				<form action="./../mall/insert.jsp" method="post" role="form" class="form-inline">			
				<table class="table table-hover table-condensed">
					<tr>
						<td width="25%" align="center">주문하기</td>
						<td>개수</td>
						<td><input type="text" class="form-control" name="qty"><br></td>
					</tr>
					<tr>
						<td></td>
						<td>요청사항</td>
						<td><input type="text" placeholder="레터링을 적어주세요" class="form-control" name="remark"><br></td>
					</tr>	
						
					<tr>
						<td></td>
						<td></td>
						<td align="right"><button class="btn btn-default" type="submit">장바구니 담기</button></td>
					</tr>			
				</table>
				</form>	
			</div>

			<hr>
			
			<div class="col-sm-offset-5 col-sm-4">
				<div class="btn-group btn-group-justified" align="right">
					<button class="btn btn-default" onclick="history.back();">돌아가기</button>
					<c:if test="${whologin == 2}">
 							<a href="PupdateForm.jsp?pnum=<%=product.getPnum()%>" class="btn btn-default">수정</a>
 							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=contextPath%>/product/Pdelete.jsp?pnum=${product.pnum}" class="btn btn-default">삭제</a> 						
					</c:if>
				</div>
		     </div>				
			
		</div>
		<!-- end panel-body -->
	</div>
</div>

</body>
</html>
