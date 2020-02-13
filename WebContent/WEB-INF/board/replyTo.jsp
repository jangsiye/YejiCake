<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
 
<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	int groupno = Integer.parseInt(request.getParameter("groupno"));
	int orderno = Integer.parseInt(request.getParameter("orderno"));
	int depth = Integer.parseInt(request.getParameter("depth"));
%>
<%

	Board bean = new Board();

	bean.setSubject(subject);
	bean.setWriter(writer);
	bean.setPassword(password);
	bean.setContent(content);
	bean.setGroupno(groupno);
	bean.setOrderno(orderno);
	bean.setDepth(depth);

	BoardDao dao = new BoardDao();
	int cnt = -1;
	cnt = dao.ReplyData(bean);
%>
<% 

if(cnt==-1) {
	response.sendRedirect("replyForm.jsp");
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