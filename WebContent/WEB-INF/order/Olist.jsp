<%@page import="model.Order"%>
<%@page import="model.OrderDao"%>
<%@page import="utility.Paging"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<%
	OrderDao dao = new OrderDao() ;

	String pageNumber = request.getParameter("pageNumber") ;
	String pageSize = request.getParameter("pageSize") ;
	int totalCount = dao.GetCount() ;
	String url = "Olist.jsp" ;
	
	Paging pageInfo 
		= new Paging(pageNumber, pageSize, totalCount, url);
	
	int beginRow = pageInfo.getBeginRow() ; 
	int endRow = pageInfo.getEndRow() ;
	List<Order> lists = dao.SelectAll(beginRow, endRow);
%>

<div class="container col-sm-offset-1 col-sm-10">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2 class="panel-title">
				이전 주문 내역 보기
				&nbsp;&nbsp;&nbsp; 
				<%=pageInfo.getPagingStatus()%>
			</h2>
		</div>
		<div class="panel-body col-sm-12">
			<div class="container">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>주문 번호(상세보기)</th>
							<th>주문 일자</th>
							<th>주문 고객명</th>
						</tr>					
					</thead>
					<% if(lists.size() == 0){ %>
			<tr>
				<td colspan="3">
				이전 주문 기록이 없습니다.
				</td>
			</tr>
	<% }else{%>
		<% for( Order order : lists){ %>
			<tr>
			<!-- 관리자는 상세보기 가능 -->
			<%if (whologin==2) {%>
				<td>
					<a href="<%=contextPath%>/mall/detailView.jsp?oid=<%=order.getOid()%>"><%=order.getOid()%></a>
				</td>
				<td><%=order.getOrderdate()%></td>
				<td><%=order.getMid()%></td>
			<!-- 로그인 한 사람 중 글쓴 사람만 상세보기 가능 -->
			<% } else if (whologin==1) {%>
				<% if( bean.getMid().equals(order.getMid())){%>
				<td>
					<a href="<%=contextPath%>/mall/detailView.jsp?oid=<%=order.getOid()%>"><%=order.getOid()%></a>
				</td>
				<td><%=order.getOrderdate()%></td>
				<td><%=order.getMid()%></td>
				
				<!-- 로그인 한 사람 중 글쓴 사람이 아닌 사람은 그냥 목록 보기만 가능 -->
				<% } else { %>	
				<td><%=order.getOid()%></td>
				<td><%=order.getOrderdate()%></td>
				<td><%=order.getMid()%></td>
				<% }%>
			
			<!-- 미로그인 사람은 그냥 목록 보기만 가능 -->
			<% } else { %>
				<td><%=order.getOid()%></td>
				<td><%=order.getOrderdate()%></td>
				<td><%=order.getMid()%></td>
			<% }%>	
			</tr>
		<% }%>			
		<% }%>
				</table>
			</div>
		</div>
		<div class="panel-footer" align="center">
			<%=pageInfo.getPagingHtml()%>
		</div>
	</div>
</div>
</body>
</html>
