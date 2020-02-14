<%@page import="utility.Paging"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//dao 객체 생성
	BoardDao dao = new BoardDao();

	//페이징 처리
	String pageNumber = request.getParameter("pageNumber");	//null
	String pageSize = request.getParameter("pageSize");	//null
	int totalCount = dao.GetCount();
	String url = "Blist.jsp";
	
	Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url);
	
	//한 페이지에 게시물 출력
	//beginRow와 endRow는 private하니 getter로 접근
	List<Board> lists = dao.SelectAll(pageInfo.getBeginRow(), pageInfo.getEndRow());
%>

<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">문의사항 보기&nbsp;&nbsp;&nbsp;<%=pageInfo.getPagingStatus() %></h2>
		</div>
		<div class="container panel-body col-sm-12">
			<table class="table table-hover">
				<!-- table에도 헤더가 있음. td대신 th를 씀. -->
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
					<%if(whologin==2){%>
						<th>비번</th>
					<%} %>
						<th>글내용</th>
						<th>작성일자</th>
					</tr>				
				</thead>
				<% if(lists.size()==0) { %>
					<tr>
						<td colspan="6">
							찾으시는 데이터가 존재하지 않습니다.
						</td>
					</tr>
				<% } else {%>
					<% for(Board board : lists) {%>
					
						<% if(whologin==2) {	//관리자면 모두 상세보기 가능. 비밀먼호도 볼 수 있음. %>
							<tr onclick="location.href='<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>'">
								<td><%=board.getNo()%></td>
								<td><c:forEach begin="1" end="<%= board.getDepth() %>">-</c:forEach><%=board.getSubject()%></td>
								<td><%=board.getWriter()%></td>
								<td><%=board.getPassword()%></td>
								<td><%=board.getContent()%></td>
								<td><%=board.getRegdate()%></td>
							</tr>
						<% } else if (whologin==1){ %>
								<% if(bean.getMid().equals(board.getWriter())) {	//글작성자는 자기 글 상세보기 가능	%>
								<tr onclick="location.href='<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>'">
									<td><%=board.getNo()%></td>
									<td><c:forEach begin="1" end="<%= board.getDepth() %>">-</c:forEach><%=board.getSubject()%></td>
									<td><%=board.getWriter()%></td>
									<td><%=board.getPassword()%></td>
									<td><%=board.getContent()%></td>
									<td><%=board.getRegdate()%></td>
								</tr>
								<%} else if(board.getWriter().equals("admin")) { 	//자기 글 아니더라도 관리자 답글은 누구나 볼 수 있음	%>
									<tr onclick="location.href='<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>'">
									<td><%=board.getNo()%></td>
									<td><c:forEach begin="1" end="<%= board.getDepth() %>">-</c:forEach><%=board.getSubject()%></td>
									<td><%=board.getWriter()%></td>
									<td><%=board.getPassword()%></td>
									<td><%=board.getContent()%></td>
									<td><%=board.getRegdate()%></td>
								</tr>
								<%} else {	//로그인했지만 글작성자가 아닌 경우 상세보기 불가	%>
								<tr>
									<td><%=board.getNo()%></td>
									<td><c:forEach begin="1" end="<%= board.getDepth() %>">-</c:forEach><%=board.getSubject()%></td>
									<td><%=board.getWriter()%></td>
									<td><%=board.getContent()%></td>
									<td><%=board.getRegdate()%></td>
								</tr>
								<%} %>
						<% } else {		//미로그인	 상세보기 불가	%>
							<tr>
								<td><%=board.getNo()%></td>
								<td><c:forEach begin="1" end="<%= board.getDepth() %>">-</c:forEach><%=board.getSubject()%></td>
								<td><%=board.getWriter()%></td>
								<td><%=board.getContent()%></td>
								<td><%=board.getRegdate()%></td>
							</tr>
						<% }%>
						
					<% }	//for 닫기%>
				<% }%>
			</table>
		</div>
        <div class="panel-footer" align="center">
			<%= pageInfo.getPagingHtml() %>
		</div>
	</div>
</div>

</body>
</html>
