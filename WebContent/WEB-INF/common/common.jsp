<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="mall.MyCartList"%>
<%@page import="model.Member"%>
<%@page import="java.util.*"%> 

<%
	String contextPath = request.getContextPath()  ;
	//out.print( contextPath + "<br>") ;
	
	Member loginfo = (Member)session.getAttribute("loginfo") ;
	Member bean = loginfo ;
	String mem = "" ; //로그인한 사람의 정보
	int whologin = 0; // 0 : 미로그인,  1 : 회원 로그인, 2 : 관리자 로그인
	
	//out.print( "로그인 상태 : " + mem + "<br>") ;
	
	if (loginfo == null) {
		whologin = 0;
		mem = "미로그인" ;

	} else { //관리자는 아이디가 admin이라고 가정한다.
		mem = loginfo.getName() + "(" + loginfo.getId() + ")님" ;
		if (loginfo.getId().equals("admin")) {
			whologin = 2;
		} else {
			whologin = 1; //일반 사용자 로그인 
		}
	}
	//out.println("whologin : " + whologin);
	session.setAttribute("whologin", whologin);	
	
	String MyCtrlCommand = "" ;
%>  

<%
  	String myurl = request.getRequestURL().toString() ;
  	String uri = request.getRequestURI() ;
  	int idx = myurl.indexOf(uri) ;
  	
  	String uploadPath = "/upload" ; //개발자가 지정한 업로드 폴더 이름
  	
  	String uploadFolder = myurl.substring(0, idx) + contextPath + uploadPath ;
  	
  	String realPath = application.getRealPath(uploadPath) ;
  	
  	//out.print("myurl : " + myurl + "<br>") ;		
  	//out.print("uri : " + uri + "<br>") ;
  	//out.print("idx : " + idx + "<br>") ;
  	//out.print("contextPath : " + contextPath + "<br>") ;
  	//out.print("uploadFolder : " + uploadFolder + "<br>") ;
  	//out.print("realPath : " + realPath + "<br>") ;
  %>

<%
	//카트 관련 코딩
	MyCartList mycart =  (MyCartList)session.getAttribute("mycart");
	if( mycart == null ){
		mycart = new MyCartList();
	}
	//out.print("카트 물건 수 : " + mycart.GetAllOrderLists().size()) ;
%>
  
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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					
					<!-- 회사 소개 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Our Store<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/common/#.jsp">가게 소개</a>
							</li>
							<li>
								<a href="<%=contextPath%>/common/#.jsp">찾아오시는 길</a>
							</li>
						</ul>
					</li>
					
					<!-- 회원 관리 탭 : 관리자한테만 보임 -->
					<c:if test="${whologin == 2}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Member Info<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<a href="<%=contextPath%>/member/Mlist.jsp">회원 목록 보기</a>
								</li>						
							</ul>
						</li>
					</c:if>
					
					<!-- product 탭 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Product<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<c:if test="${whologin == 2}">
									<a href="<%=contextPath%>/product/PinsertForm.jsp">상품 등록</a>
								</c:if>
							</li>
							<li>
								<a href="<%=contextPath%>/product/Plist.jsp">상품 목록 보기</a>
							</li>						
						</ul>
					</li>
					
					<!-- order 탭 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Order<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/order/Olist.jsp">주문 목록 보기</a>
							</li>						
						</ul>
					</li>
					
					<!-- 문의사항 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Q&A<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/board/Blist.jsp">문의 목록</a>
							</li>
							<c:if test="${whologin != 0}">
								<li>
									<a href="<%=contextPath%>/board/BinsertForm.jsp">문의하기</a>
								</li>
							</c:if>
						</ul>
					</li>
					
					<!-- mypage 탭 : 로그인 한 사람에게만 보임 -->
					<c:if test="${whologin != 0}">		
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">MyPage<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>								
									<a href="<%=contextPath%>/member/MdetailView.jsp?id=<%=loginfo.getId()%>">내 정보 보기</a>
								</li>
								<li>								
									<a href="<%=contextPath%>/mall/order.jsp">나의 쇼핑 내역</a>
								</li>
								<li>
									<a href="<%=contextPath%>/mall/list.jsp">장바구니 보기</a>
								</li>
							</ul>
						</li>
					</c:if>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					
						<c:if test="${empty sessionScope.loginfo}">
							<li>
								<a href="<%=contextPath%>/member/MinsertForm.jsp">
									<span class="glyphicon glyphicon-plus"> 회원가입</span>
								</a>
							</li>
							<li>
								<a href="<%=contextPath%>/member/loginForm.jsp">
									<span class="glyphicon glyphicon-log-in"> 로그인</span>
								</a>
							</li>
						</c:if> 
						<c:if test="${not empty sessionScope.loginfo}">
							<li>
								<a href="<%=contextPath%>/member/logout.jsp">
									<span class="glyphicon glyphicon-log-out"> 로그 아웃</span>
								</a>
							</li>
						</c:if>
					
				</ul>
			</div>

		</div>
	</nav>
	<c:if test="${not empty requestScope.errmsg}">
		<script type="text/javascript">
			alert('${requestScope.errmsg}');
		</script>
	</c:if>
	<c:if test="${not empty sessionScope.message}">
		<script type="text/javascript">
			alert('${sessionScope.message}') ;	 
		</script>
		<% session.removeAttribute("message") ; %>
	</c:if>	
</body>
</html>
