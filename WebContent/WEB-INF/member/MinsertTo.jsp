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
	int mpoint = Integer.parseInt(request.getParameter("mpoint")) ;
%>
<%
	Member bean = new Member();
	bean.setMid(mid) ;
	bean.setName(name);
	bean.setPassword(password);
	bean.setAddress(address);
	bean.setMpoint(mpoint);
	
	MemberDao dao = new MemberDao();
	
	if(dao.IdDuplicationCheck(mid) == false ){
		out.printIn("<script type='text/javascript'>") ;
		out.printIn("alert('중복된 아이디가 있습니다. 다른 아이디를 입력해주세요.') ;") ;
		out.printIn("location.href='MinsertForm.jsp'") ;
		out.printIn("<script/>") ;
	}
	
	int cnt = -1 ;
	cnt = dao.InsertData(bean) ;

	if(cnt == -1){
		response.sendRedirect("MinsertForm.jsp");
	} else {
		response.sendRedirect("Mlist.jsp");	
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
