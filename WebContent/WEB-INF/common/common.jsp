<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="mall.MyCartList"%>
<%@page import="model.Member"%>
<%@page import="java.util.*"%> 

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

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
		mem = loginfo.getName() + "(" + loginfo.getMid() + ")님" ;
		if (loginfo.getMid().equals("admin")) {
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #FFFFFF;
    color: #191919;
    padding: 60px 25px;
    font-family: Forte, sans-serif;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #E8CEC2; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
    border: 1px solid #E8CEC2;
    background-color: #fff !important;
    color: #E8CEC2;
  }
  .panel-heading {
    color: #fff !important;
    background-color: #E8CEC2 !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
  }
  .panel-footer {
    background-color: white !important;
  }
  .panel-footer h3 {
    font-size: 32px;
  }
  .panel-footer h4 {
    color: #aaa;
    font-size: 14px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: #E8CEC2;
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: #FAE0D4;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #191919 !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #E8D9FF !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #E8D9FF;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
  }
	  
<!-- 이미지 모서리 둥글게 하기-->
p > img {
	border-radius : 5px;
}
 a:link { color: none; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: none; text-decoration:none;}

  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>                        
		</button>
		<a class="navbar-brand" href="./../common/main.jsp">예지케잌<i class="fas fa-birthday-cake"></i></a>
	</div>
 	<div class="container">
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				
				<!-- 회사 소개 -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Our Store<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<a href="<%=contextPath%>/common/storeinfo.jsp">가게 소개</a>
						</li>
						<li>
							<a href="<%=contextPath%>/common/storemap.jsp">찾아오시는 길</a>
						</li>
					</ul>
				</li>
				
				<!-- 회원 관리 탭 : 관리자한테만 보임 -->
				<c:if test="${whologin == 2}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Admin Tap<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="<%=contextPath%>/member/Mlist.jsp">회원 목록 보기</a>
							</li>
							<li>
								<a href="<%=contextPath%>/order/Olist.jsp">주문 목록 보기</a>
							</li>
							<li>
								<c:if test="${whologin == 2}">
									<a href="<%=contextPath%>/product/PinsertForm.jsp">상품 등록</a>
								</c:if>
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
							<c:if test="${whologin != 0}">	<!-- 로그인 한 사람만 할인 상품 볼 수 있음 -->
								<a href="<%=contextPath%>/product/PsaleForm.jsp">패키지 할인 상품 보기</a>
							</c:if>
						</li>
						<li>
							<a href="<%=contextPath%>/product/Plist.jsp">상품 목록 보기</a>
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
								<a href="<%=contextPath%>/member/MdetailView.jsp?mid=<%=loginfo.getMid()%>">내 정보 보기</a>
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
 <a href="./../common/main.jsp" >
<div class="jumbotron text-center" >
  <h1>YejiCake</h1> 
  <p>We are making a special cake just for you</p> 
</div></a>
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
