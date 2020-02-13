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
					<tr>
						<% if(whologin==2) {	//관리자면 모든 회원 문의사항 수정삭제조회가능%>
							<td>
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getNo()%>
								</a>
							</td>
							<td>
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getSubject()%>
								</a>
							</td>
							<td>
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getWriter()%>
								</a>
							</td>			
							<td>								
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getPassword()%>
								</a>
							</td>
							<td>								
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getContent()%>
								</a>
							</td>
							<td>								
								<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
								<%=board.getRegdate()%>
								</a>
							</td>
							<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=contextPath%>/board/Bdelete.jsp?no=<%=board.getNo()%>" class="btn btn-default">삭제</a></td>
						<% } else if (whologin==1){ %>
								<% if(bean.getMid().equals(board.getWriter())) {	//순서 그대로 가려면 if else로 세 번 분기처리 해줘야 함%>
								<td>
									<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
									<%=board.getNo()%>
									</a>
								</td>
								<td>
									<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
									<%=board.getSubject()%>
									</a>
								</td>
								<td>
									<a href="<%=contextPath%>/board/BdetailView.jsp?no=<%=board.getNo()%>">
									<%=board.getWriter()%>
									</a>
								</td>
								<%} else {%>
									<td><%=board.getNo()%></td>
									<td><%=board.getSubject()%></td>
									<td><%=board.getWriter()%></td>
								<%} %>
							<td><%=board.getContent()%></td>
							<td><%=board.getRegdate()%></td>
						<% } else {%>
							<td><%=board.getNo()%></td>
							<td><%=board.getSubject()%></td>
							<td><%=board.getWriter()%></td>
							<td><%=board.getContent()%></td>
							<td><%=board.getRegdate()%></td>
						<% }%>
						</tr>
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
