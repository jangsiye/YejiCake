<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao dao = new BoardDao();
	Board board = dao.SelectByPk(no);
	//out.print(board);	//toString
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-offset-3 col-sm-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1 class="panel-title" align="left">게시물 상세 보기</h1>
		</div>
		<div class="panel-body">
			<div class="col-sm-12 col-sm-12">
				<table class="table table-hover table-condensed">
					<tr>
						<td width="25%" align="center">글 번호</td>
						<td width="75%" align="left"><%= board.getNo() %></td>
					</tr>
					<tr>
						<td width="25%" align="center">제목</td>
						<td width="75%" align="left"><%= board.getSubject()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">작성자</td>
						<td width="75%" align="left"><%= board.getWriter()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">비밀번호</td>
						<td width="75%" align="left"><%= board.getPassword()%></td>
					</tr>
					<tr>
						<td width="25%" height="300px" align="center">글내용</td>
						<td width="75%" align="left"><%= board.getContent()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">작성일자</td>
						<td width="75%" align="left"><%= board.getRegdate()%></td>
					</tr>
					<tr>
						<td>
							
							<a href="<%=contextPath%>/board/replyForm.jsp?no=<%=board.getNo()%>&groupno=<%=board.getGroupno()%>
								&orderno=<%=board.getOrderno()%>&depth=<%=board.getDepth()%>" class="btn btn-default">답글 달기</a>
							<a href="<%=contextPath%>/board/Blist.jsp" class="btn btn-default">돌아가기</a>
						</td>
						<% if(whologin==2 || bean.getMid().equals(board.getWriter())) {	//관리자, 글쓴이만 수정, 삭제 가능. %>
						<td align="right">
							<a href="<%=contextPath%>/board/BupdateForm.jsp?no=<%=board.getNo()%>" class="btn btn-default">수정</a>
							&nbsp;
							
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=contextPath%>/board/Bdelete.jsp?no=<%=board.getNo()%>" 
								class="btn btn-default">삭제</a>
						</td>
						<% } %>
					</tr>
				</table>
			</div>
		</div>
		<!-- end panel-body -->
	</div>
	<%@include file="./../common/footer.jsp" %>
</div>

</body>
</html>
