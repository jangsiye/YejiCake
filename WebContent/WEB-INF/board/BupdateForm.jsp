<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao dao = new BoardDao();
	Board board = dao.SelectByPk(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content {
	height : 300px;
}
</style>
</head>
<body>

<h3>게시글 수정 페이지입니다</h3>

<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">게시글 수정</h2>
		</div>
		<form action="BupdateTo.jsp" method="post"  class="form-horizontal" role="form">
			<div class="panel-body">
                <div class="form-group">
                	<input type="hidden" name="no" id="no" value="<%=board.getNo()%>">
                	<input type="hidden" name="regdate" id="regdate" value="<%=board.getRegdate()%>">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">제목</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="subject" id="subject" value="<%=board.getSubject() %>" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">글쓴이</label>
                    </div>
                    <div class="col-sm-9">
                    	<input type="text" disabled="disabled" name="fakewriter" id="fakewriter" value="<%=board.getWriter() %>" class="form-control">
                        <input type="hidden" name="writer" id="writer" value="<%=board.getWriter() %>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">비밀번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="password" name="password" id="password" value="<%=board.getPassword() %>" class="form-control">
                    </div>
                </div>               
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">내용</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="content" id="content" value="<%=board.getContent() %>" class="form-control">
                    </div>
                </div>
			</div>
			<div class="panel-footer" align="center">
				<button class="btn btn-default" type="submit"><b>수정하기</b></button>&nbsp;&nbsp;&nbsp;
	    	 	<button class="btn btn-default" type="reset"><b>취소</b></button>
			</div>
		</form>
	</div>
</div>

</body>
</html>
