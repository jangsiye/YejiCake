<%@page import="mall.ShoppingInfo"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<jsp:useBean id="odao" class="model.OrderDao"/>
<jsp:useBean id="mdao" class="model.MemberDao"/>
<%
	int oid = Integer.parseInt(request.getParameter("oid")) ;

	Order order = odao.SelectDataByPk( oid ) ;
	
	Member member = mdao.SelectByPk(order.getMid());
	List<ShoppingInfo> lists = odao.ShowDetail( oid ) ;
	
	request.setAttribute("order", order) ;
	request.setAttribute("member", member) ;
	request.setAttribute("lists", lists) ;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.sale {
	display:none;
}
</style>
</head>
<body>
	<div class="container col-md-offset-<%=2%> col-md-<%=8%>">
		<h1>${member.name}님의 주문 상세 내역</h1>
		<hr>
		<p>${member.name}
			고객님<br> 고객님께서 <strong>${order.orderdate}</strong>에 구매하신 상품에 대한 상세 결제
			내역입니다.
		</p>
		<hr>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">주문 내역</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>상품 코드</th>
								<th class="text-center">제품명</th>
								<th class="text-center">단가</th>
								<th class="text-center">수량</th>
								<th class="text-center">금액</th>
								<th class="text-center">레터링</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totalAmount" value="0" />
							<c:forEach items="${requestScope.lists}" var="shopinfo">
								<tr>
									<td>${shopinfo.pnum}</td>
									<td>${shopinfo.pname}</td>
									<td class="text-center"><fmt:formatNumber
											value="${shopinfo.price}" pattern="###,###"/> 원</td>
									<td class="text-center"><fmt:formatNumber
											value="${shopinfo.qty}" pattern="###,###"/> 개</td>
									<td class="text-center"><c:set var="amount"
											value="${shopinfo.price * shopinfo.qty}" /> <c:set
											var="totalAmount" value="${totalAmount + amount}" /> <fmt:formatNumber
											value="${amount}" pattern="###,###"/> 원</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td class="no-line"></td>
								<td class="no-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line text-center"><strong>합계</strong></td>
								<td class="thick-line text-right"><fmt:formatNumber
										value="${totalAmount}" /> 원</td>
							</tr>
							<!-- 요금에 따른 운송비 구하기 -->
							<c:set var="shipExpense" value="0" />
							<c:choose>
								<c:when test="${totalAmount >= 50000}">
									<c:set var="shipExpense" value="0" />
								</c:when>
								<c:when test="${totalAmount >= 30000}">
									<c:set var="shipExpense" value="2000" />
								</c:when>
								<c:otherwise>
									<c:set var="shipExpense" value="4000" />
								</c:otherwise>
							</c:choose>
							<tr>
								<td class="thick-line"><strong>레터링</strong></td>
								<td class="thick-line">《    ${lists[0].remark}   》</td>
								<td class="no-line"></td>
								<td class="no-line text-center"><strong>운송비</strong></td>
								<td class="no-line text-right"><fmt:formatNumber
										value="${shipExpense}" pattern="###,###"/> 원</td>
							</tr>
							<tr>
								<td class="no-line"></td>
								<td class="no-line"></td>
								<td class="no-line"></td>
								<td class="no-line text-center"><strong>최종 금액</strong></td>
								<td class="no-line text-right">
									<c:set var="finalAmount" value="${totalAmount + shipExpense}" />
									<strong>
										<fmt:formatNumber value="${finalAmount}" pattern="###,###"/> 원
									</strong>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">결제 정보</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center gr"><strong>주문 번호</strong></td>
								<td>${order.oid}</td>
								<td class="text-center gr"><strong>주문일</strong></td>
								<td>${order.orderdate}</td>
							</tr>
							<% 
								//※ jsp변수를 jstl변수로 바꿔주기!
								int saleprice = 0;
								pageContext.setAttribute("saleprice", saleprice);
							%>
							<tr>
								<td class="text-center gr"><strong>주문 총액</strong></td>
								<td><fmt:formatNumber value="${totalAmount}" pattern="###,###"/> 원</td>
								<td class="text-center gr"><strong>할인 금액</strong></td>
								<td>
								<div class="sale">
									<c:forEach items="${requestScope.lists}" var="shopinfo">
										<c:choose>
											<c:when test="${shopinfo.pnum==25}">
												${saleprice = saleprice + shopinfo.price}
											</c:when>
											<c:when test="${shopinfo.pnum==26}">
												${saleprice = saleprice + shopinfo.price}
											</c:when> 
											<c:when test="${shopinfo.pnum==27}">
												${saleprice = saleprice + shopinfo.price}
											</c:when> 
										</c:choose>
									</c:forEach>
								</div>
								<fmt:formatNumber value="${saleprice}" pattern="##,###,###"/>원
								</td>
							</tr>
							<tr>
								<td class="text-center gr"><strong>결제 금액</strong></td>
								<td><fmt:formatNumber value="${finalAmount}" pattern="###,###"/> 원</td>
								<td class="text-center gr"><strong>결제 상태</strong></td>
								<td>결제 완료</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">배송 정보</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center gr"><strong>받으시는 분</strong></td>
								<td>${member.name}(${member.mid})
									님</td>
							</tr>
							<tr>
								<td class="text-center gr"><strong>주소</strong></td>
								<td>${member.address}</td>
							</tr>
							<tr>
								<td class="text-center gr"><strong>적립 포인트 </strong></td>
								<td><fmt:formatNumber value="${member.mpoint}" pattern="###,###"/> 원</td>
							</tr>
							<tr>
								<td class="text-center gr"><strong>배송 방법 </strong></td>
								<td>택배</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
