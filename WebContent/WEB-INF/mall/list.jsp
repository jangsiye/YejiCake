<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mall.ShoppingInfo"%>
<%@page import="model.Product"%>
<%@page import="model.ProductDao"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if( mycart == null ){
		session.setAttribute("message", "쇼핑 내역이 존재하지 않습니다.");
		response.sendRedirect("./../product/Plist.jsp") ;
		
	}else{ // 쇼핑 내역 있음
		if( mycart.GetAllOrderLists().size() == 0 ){
			session.setAttribute("message", "쇼핑 내역이 존재하지 않습니다.");
			response.sendRedirect("./../product/Plist.jsp") ;
		}
		
		Map<Integer, Integer> maplists =  mycart.GetAllOrderLists() ; 
		Set<Integer> keylist = maplists.keySet() ;
		
		List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>() ; 
		
		int totalAmount = 0 ; //총 금액
		int totalPoint = 0 ; //총 포인트
		
		for(Integer pnum : keylist){
			Integer qty = maplists.get(pnum) ; //구매 수량
			
			ProductDao dao = new ProductDao();
			Product product = dao.SelectByPk(pnum) ;
			ShoppingInfo shopInfo = new ShoppingInfo();
			
			totalAmount += qty * product.getPrice() ;
			totalPoint += qty * product.getPoint() ;
			
			shopInfo.setImage( product.getImage()) ;
			shopInfo.setName( product.getName()) ;
			shopInfo.setPnum(  pnum ) ;
			shopInfo.setPoint( product.getPoint()) ;
			shopInfo.setPrice( product.getPrice()) ;
			shopInfo.setQty( qty ) ;
			
			shoplists.add(shopInfo) ;			
		}// end for
		
		session.setAttribute("shoplists", shoplists) ;
		session.setAttribute("totalAmount", totalAmount) ;
		session.setAttribute("totalPoint", totalPoint) ;
	}
%>
<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">장바구니 보기</h2>
		</div>
		<div class="panel-body col-sm-12">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품</th>
							<th>수량</th>
							<th>단가</th>
							<th>포인트</th>
							<th>금액</th>
							<th>누적 포인트</th>
							<th>삭제</th>
						</tr>					
					</thead>
					<c:forEach var="shopinfo" items="${sessionScope.shoplists}" varStatus="status">
					<tr>
						<td align="center" valign="middle">${status.count}</td> 						
						<td align="center" valign="middle">
							<img alt="" src="<%=realPath%>${shopinfo.image}"
								class="img-rounded" width="36" height="36"> 
							<br>
							${shopinfo.name}
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty}" pattern="###,###" /> 개
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.price}" pattern="###,###" /> 원
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.point}" pattern="###,###" /> 원
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty*shopinfo.price}" pattern="###,###" /> 원
						</td>
						<td align="center" valign="middle">
							<fmt:formatNumber value="${shopinfo.qty*shopinfo.point}" pattern="###,###" /> 원
						</td>
						<td align="center" valign="middle">
							<a href="delete.jsp?pnum=${shopinfo.pnum}">삭제</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="4" align="center"> 
							<a href="calculate.jsp">결재하기</a>
							&nbsp;&nbsp;
							<a href="./../product/list.jsp">추가 주문</a>
						</td>
						<td colspan="4" align="center">
							총 금액 : <fmt:formatNumber value="${sessionScope.totalAmount}" pattern="##,###,###"/> 
							&nbsp;&nbsp;
							총 누적 포인트 : <fmt:formatNumber value="${sessionScope.totalPoint}" pattern="##,###,###"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
        
	</div>
</div>
</body>
</html>
