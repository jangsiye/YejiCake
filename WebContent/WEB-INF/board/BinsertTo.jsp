<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");

%>
<!-- jsp에서 import하는 법!  -->
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%
	//빈 객체를 만들어서
	Board bean = new Board();
	//빈 객체에 setter로 입력된 파라미터들을 집어넣는다
	bean.setSubject(subject);
	bean.setWriter(writer);
	bean.setPassword(password);
	bean.setContent(content);
	
	//dao로 빈 객체를 넘겨서 db에 저장한다 
	BoardDao dao = new BoardDao();
	int cnt = -1;
	cnt = dao.InsertData(bean);
%>
<% 
//실패시 insetForm.jsp로 돌아가고, 성공시 list.jsp로 이동한다.
if(cnt==-1) {
	//내장객체 response
	//request에서 getParameter하듯이, response에서 sendRedirect한다.
	//괄호 안에는 가고자 하는 주소를 적어주면 된다
	response.sendRedirect("BinsertForm.jsp");
} else {
	response.sendRedirect("Blist.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>