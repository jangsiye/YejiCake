<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mall.ShoppingInfo"%>
<%@page import="model.Product"%>
<%@page import="model.ProductDao"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp"%>

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
<%
	request.setCharacterEncoding("UTF-8");
	//★ remark는 getter로 불러옴
	String remark = mycart.getRemark();

	//쇼핑 내역 없음
	if (mycart == null) {
		session.setAttribute("message", "쇼핑 내역이 존재하지 않습니다.");
		response.sendRedirect("./../product/Plist.jsp");
	} else {
		//map에 쇼핑 내역 담아서, set에 담아서, 확장 for로 장바구니 리스트 출력
		Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
		Set<Integer> keylist = maplists.keySet();
		
		List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();
		
		int totalAmount = 0;	//총 금액
		int totalPoint = 0;		//총 포인트

		for(Integer pnum : keylist) {
			//★ qty는 GetAllOrderLists()메소드로 불러오고
			Integer qty = maplists.get(pnum);
			
			//product 빈객체에 해당 pnum의 데이터를 삽입
			ProductDao dao = new ProductDao();
			Product product = dao.SelectByPk(pnum);
			
			//ShopInfo(장바구니 빈 객체)에 product의 데이터를 가져와서 삽입
			ShoppingInfo shopInfo = new ShoppingInfo();
			
			//금액은 단가*수량의 합
			totalAmount += product.getPrice() * qty ;
			//포인트는 포인트*수량의 합
			totalPoint += product.getPoint() * qty ;
			
			shopInfo.setImage(product.getImage());
			shopInfo.setPname(product.getPname());
			shopInfo.setPnum(product.getPnum());
			shopInfo.setPoint(product.getPoint());
			shopInfo.setPrice(product.getPrice());
			
			shopInfo.setQty(qty);
			shopInfo.setRemark(remark);
			
			shoplists.add(shopInfo);
		}	//for 끝

		//어디서든 사용할 수 있게, 세션에 쇼핑리스트, 총금액, 총포인트 저장하기
		session.setAttribute("shoplists", shoplists);
		session.setAttribute("totalAmount", totalAmount);
		session.setAttribute("totalPoint", totalPoint);
	}
%>

<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">장바구니 보기</h2>
		</div>
		<div class="container panel-body col-sm-12">
			<table class="table table-hover">

				<thead>
					<tr>
						<td>상품번호</td>
						<td>상품명</td>
						<td>수량</td>
						<td>단가</td>
						<td>포인트</td>
						<td>금액</td>
						<td>누적포인트</td>
						<td>삭제</td>
					</tr>					
				</thead>
				
				<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
					<tr class="danger">
						<td>${shopinfo.pnum}</td>
						<td align="center" valign="middle">
							<img alt="" src="<%=realPath%>/${shopinfo.image}" class="img-rounded" width="36" height="36"> 
							<br>${shopinfo.pname}</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty}" pattern="###,###"/>개
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.price}" pattern="###,###"/>원
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.point}" pattern="###,###"/>포인트
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty * shopinfo.price}" pattern="###,###"/>원
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty * shopinfo.point}" pattern="###,###"/>포인트
						</td>
						<td align="center" valign="middle">
							<a href="delete.jsp?pnum=${shopinfo.pnum}">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<tr class="header">
					<td colspan="8"  align="center">
						※ 레터링 문구를 확인해주세요 : 《   <%=remark%>   》
					</td>
				</tr>
				<tr class="header">
					<td colspan="4"  align="center">
						<a href="calculate.jsp">결제하기</a>
						&nbsp;&nbsp;
						<a href="./../product/Plist.jsp">추가 주문</a>
					</td>
					<td colspan="4"  align="center">
						<% 
							//※ jsp변수를 jstl변수로 바꿔주기!
							int saleprice = 0;
							pageContext.setAttribute("saleprice", saleprice);
						%>
						<strong>할인 금액 : </strong>
						<div class="sale">
							<c:if test="${not empty sessionScope.shoplists}">
								<c:forEach items="${sessionScope.shoplists}" var="shopinfo">
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
							</c:if>
						</div>
						<fmt:formatNumber value="${saleprice}" pattern="##,###,###"/>원
						&nbsp;&nbsp;
						총 금액 : <fmt:formatNumber value="${sessionScope.totalAmount}" pattern="##,###,###"/>원
						&nbsp;&nbsp;
						총 누적 포인트 : <fmt:formatNumber value="${sessionScope.totalPoint}" pattern="##,###,###"/>원
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>
