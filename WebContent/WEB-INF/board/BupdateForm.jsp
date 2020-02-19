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

<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">게시글 수정</h2>
		</div>
		<form action="BupdateTo.jsp" method="post"  class="form-horizontal" role="form">
			<input type="hidden" name="password" id="password" value="<%=board.getPassword() %>" class="form-control">
			<input type="hidden" name="no" id="no" value="<%=board.getNo()%>">
			<div class="panel-body">
                <div class="form-group">
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
                        <input type="text" name="fakewriter" id="fakewriter" 
                        disabled="disabled"
                        class="form-control" value = "<%=bean.getMid()%>">
                        <input type="hidden" name="writer" id="writer" value ="<%=bean.getMid()%>">
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
				<a class="btn btn-default" type="reset" 
	    	 		onclick="return confirm('수정을 취소하시겠습니까? 문의 목록으로 돌아갑니다.')" 
	    	 		href="<%=contextPath%>/board/Blist.jsp"><b>취소</b></a>
			</div>
		</form>
	</div>
</div>

</body>
</html>
