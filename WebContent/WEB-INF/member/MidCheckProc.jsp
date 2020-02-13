<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-sm-offset-2 col-sm-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title" align="center">아이디 중복 확인 결과</h2>
			</div>
<%
//1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
	MemberDao dao = new MemberDao();
	String mid = request.getParameter("mid");
	int cnt = dao.MidDuplicationCheck(mid);
	
	out.println("입력 ID : <strong>" + mid + "</stong>");
	if(cnt == 0 ){
		out.println("<p>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + mid + "\")'>"+"<button class='btn-btn-default'>"+"적용</button></a>");
%>
<script>
	function apply(mid){
	opener.document.myform.mid.value=mid;
	window.close();
	}
</script>
<%
	} else {
		out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
	}
%>
<hr>
	<a href="javascript:history.back()">
		<button class="btn btn-default" >다시시도</button>
	</a>
	&nbsp; &nbsp;
	<a href="javascript:window.close()">
		<button class="btn btn-default">창닫기</button>
	</a>
		</div>
	</div>
</body>
</html>