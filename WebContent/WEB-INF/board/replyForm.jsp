<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

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

<h3>답글 작성 페이지입니다</h3>

<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">답글 작성</h2>
		</div>
		<form action="replyTo.jsp" method="post"  class="form-horizontal" role="form" name="boardform">
			
			<!-- 답글 관련 파라미터만 넘겨주기 -->
			<input type="hidden" name="groupno" value="<%=request.getParameter("groupno") %>">
			<input type="hidden" name="orderno" value="<%=request.getParameter("orderno") %>">
			<input type="hidden" name="depth" value="<%=request.getParameter("depth") %>">
			
			<input type="hidden" name="password" id="password" value="<%=bean.getPassword()%>" class="form-control">
			
			<div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">제목</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="subject" id="subject" value="제목" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">글쓴이</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="writer" id="writer" value="<%=bean.getMid()%>" class="form-control">
                    </div>
                </div>               
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">내용</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="content" id="content" value="답변입니다." class="form-control">
                    </div>
                </div>
			</div>
			<div class="panel-footer" align="center">
				<button class="btn btn-default" type="submit"><b>답글달기</b></button>&nbsp;&nbsp;&nbsp;
	    	 	<button class="btn btn-default" type="reset"><b>취소</b></button>
			</div>
		</form>
	</div>
</div>

</body>
</html>
