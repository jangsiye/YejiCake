<%@page import="utility.Paging"%>
<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@page import="model.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 보기</title>
</head>
<body>
<%
	MemberDao dao = new MemberDao();
	Member member = new Member() ;
	String pageNumber = request.getParameter("pageNumber") ;
	String pageSize = request.getParameter("pageSize");
	int totalCount = dao.GetCount() ;
	String url = "Mlist.jsp" ;
	Paging paging = new Paging(pageNumber, pageSize, totalCount, url);
	int beginRow = paging.getBeginRow() ;
	int endRow = paging.getEndRow() ;
	List<Member> Mlists = dao.SelectAll(beginRow, endRow) ;
	request.setAttribute("Mlists", Mlists) ;
%>
	<div class="col-sm-offset-1 col-sm-10">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title" align = "left">회원 목록 보기</h2>
			</div>
			<div class="panel-body col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th align="center">아이디</th>
							<th align="center">이름</th>
							<th align="center">비밀번호</th>
							<th align="center">주소</th>
							<th align="center">적립 포인트</th>
						</tr>					
					</thead>
						<%if(Mlists.size() == 0){ %>
							<tr>
								<td colspan="6">
									찾으시는 데이터가 존재하지 않아요 :(
								</td>
							</tr>
						<%} else { %>
						<%for(Member a : Mlists) {%>
							<tr>
								<td  align="center">
									<%=a.getMid() %>
								</td>
								<td align="center">
									<%=a.getName() %>
								</td>
								<td align="center">
									<%=a.getPassword() %>
								</td>
								<td align="center">
									<%=a.getAddress() %>
								</td>
								<td align="center">
									<%=a.getMpoint() %>
								</td>
							</tr>
							<%} %>
						<% } %>
				</table>
			</div>
	        <div class="panel-footer" align = "center">
				<%=paging.getPagingHtml() %>
			</div>
		</div>
	</div>
</body>
</html>
