<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp에서 import하는 법!  -->
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
   
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String regdate = request.getParameter("regdate");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");

%>

<%
	//빈 객체를 만들어서
	Board bean = new Board();
	//빈 객체에 setter로 입력된 파라미터들을 집어넣는다
	bean.setNo(no);
	bean.setRegdate(regdate);
	bean.setSubject(subject);
	bean.setWriter(writer);
	bean.setPassword(password);
	bean.setContent(content);
	
	//dao로 빈 객체를 넘겨서 db에 저장한다 
	BoardDao dao = new BoardDao();
	int cnt = -1;
	cnt = dao.UpdateData(bean);
%>
<% 

if(cnt==-1) {
	response.sendRedirect("BupdateForm.jsp");
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