<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Member" %>
<%@ page import = "model.MemberDao" %>
<%
	request.setCharacterEncoding("UTF-8") ;
	
	String mid = request.getParameter("mid") ;
	String name = request.getParameter("name") ;
	String password = request.getParameter("password") ;
	String address = request.getParameter("address") ;
	String phone = request.getParameter("phone") ;
	int mpoint = Integer.parseInt(request.getParameter("mpoint")) ;
	
	Member bean = new Member();
	bean.setMid(mid) ;
	bean.setName(name);
	bean.setPassword(password);
	bean.setAddress(address);
	bean.setPhone(phone) ;
	bean.setMpoint(mpoint);
	
	MemberDao dao = new MemberDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 		int cnt = -1 ;
 		cnt = dao.InsertData(bean) ;

 		if(cnt == -1){
 			response.sendRedirect("MinsertForm.jsp");
 		} else {
 			response.sendRedirect("./../common/main.jsp");	
 		}
%>
</body>
</html>
