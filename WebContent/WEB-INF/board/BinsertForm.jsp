<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//폼 유효성 검사
	function formCheck() {		
		//password 유효성 검사
		var password = document.boardform.password.value;
		//첫글자는 무조건 소문자로, 나머지는 대소문자+숫자+특수문자 중 3글자 이상, 특수문자는!@#^*만 가능하다
		var p_reg = /^[a-z][a-zA-Z0-9!@#^*]{3,}/;
		var p_result = p_reg.test(password);
		
		if(p_result == false) {
			alert('비밀번호는 첫 글자는 소문자로, 총 4글자 이상이어야 합니다.');
			return false;
		}
		
	}
</script>

<style type="text/css">
#content {
	height : 300px;
}
</style>
</head>
<body>

<h4>문의글 작성 페이지입니다</h4>

<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">문의하기</h2>
		</div>
		<form action="BinsertTo.jsp" method="post"  class="form-horizontal" role="form" name="boardform">
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
                        <input type="text" name="fakewriter" id="fakewriter" 
                        disabled="disabled"
                        class="form-control" value = "<%=bean.getMid()%>">
                        <input type="hidden" name="writer" id="writer" value ="<%=bean.getMid()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">비밀번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="password" name="password" id="password" value="a123" class="form-control">
                    </div>
                </div>               
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">내용</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="content" id="content" value="문의합니다." class="form-control">
                    </div>
                </div>
			</div>
			<div class="panel-footer" align="center">
				<button class="btn btn-default" type="submit" onclick="return formCheck();"><b>글쓰기</b></button>&nbsp;&nbsp;&nbsp;
	    	 	<button class="btn btn-default" type="reset"><b>취소</b></button>
			</div>
		</form>
	</div>
<%@include file="./../common/footer.jsp" %>
</div>

</body>
</html>
