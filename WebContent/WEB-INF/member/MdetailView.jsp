<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./../common/common.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("mid");
	MemberDao dao = new MemberDao();
	Member member = dao.SelectByPk(mid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-offset-3 col-sm-6">
	<div class="panel panel-default panel-primary">
		<div class="panel-heading">
			<h1 class="panel-title" align="left">회원 정보 상세 보기</h1>
		</div>
		<div class="panel-body">
			<div class="col-sm-12 col-sm-12">
				<table class="table table-hover table-condensed">
					<tr>
						<td width="25%" align="center">아이디</td>
						<td width="75%" align="left"><%=member.getMid()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">연락처</td>
						<td width="75%" align="left"><%=member.getPhone()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">주소</td>
						<td width="75%" align="left"><%=member.getAddress()%></td>
					</tr>
					<tr>
						<td width="25%" align="center">적립 포인트</td>
						<td width="75%" align="left"><%=member.getMpoint()%></td>
					</tr>
					<tr>
						<td align="center">
							<a href="MupdateForm.jsp?mid=<%=member.getMid()%>">
								<button type = "submit" class = "btn btn-default" >
									회원 정보 수정
								</button>
							</a>
						</td>
                    	<td align="center">
							<a onclick="return confirm('정말로 탈퇴하시겠습니까?')" 
								href="Mdelete.jsp?mid=<%=member.getMid()%>" 
								class="btn btn-default">삭제
							</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- end panel-body -->
	</div>
</div>
</body>
</html>
