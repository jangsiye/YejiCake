<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.Member" %>
<%@ page import = "model.MemberDao" %>
<%
	request.setCharacterEncoding("UTF-8") ;
	
	String mid = request.getParameter("mid") ;
	String name = request.getParameter("name") ;
	String password = request.getParameter("password") ;
	String phone = request.getParameter("phone") ;
	String address = request.getParameter("address") ;
	int mpoint = Integer.parseInt(request.getParameter("mpoint")) ;
%>
<%
	Member bean = new Member();
	bean.setMid(mid) ;
	bean.setName(name);
	bean.setPassword(password);
	bean.setPhone(phone) ;
	bean.setAddress(address);
	bean.setMpoint(mpoint);
	
	MemberDao dao = new MemberDao();
	
	int cnt = -1 ;
	cnt = dao.UpdateData(bean) ;

	if(cnt == -1){
		response.sendRedirect("MinsertForm.jsp");
	} else {
		response.sendRedirect("./../common/main.jsp");	
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
