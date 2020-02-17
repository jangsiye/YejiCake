<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  	<!-- 이미지 모서리 둥글게 하기. 안 됨^^ 왜 안 될까요-->
	p img {
		border-radius: 30%;
	}
	
	.morecake {
		text-align: right;
	}

</style>
</head>
<body>
<div class="container">
	<div class="row">		
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked" data-spy="fix"
				data-offset-top="205">
				<!-- 누르면 해당 소개로 이동 -->
				<li><a href="#section1">소개</a></li>
				<li><a href="#section2">창업 연혁</a></li>
				<li><a href="#section3">케이크 종류</a></li>
				<li><a href="#section4">로고</a></li>
				
				<hr>
				<!-- 여기는 그냥 링크 -->
				<li><a href="<%=contextPath%>/common/storemap.jsp">찾아오시는 길</a></li>
				<li><a href="<%=contextPath%>/board/Blist.jsp">Q&A</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">MyPage <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<!-- 로그인 안 했으면 회원가입/로그인 띄워주기 -->
						<c:if test="${whologin == 0}">
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
						
						<!-- 로그인 했으면 내 정보 띄워주기 -->
						<c:if test="${whologin != 0}">
							<li>								
								<a href="<%=contextPath%>/member/MdetailView.jsp?id=<%=loginfo.getMid()%>">내 정보 보기</a>
							</li>
							<li>								
								<a href="<%=contextPath%>/mall/order.jsp">나의 쇼핑 내역</a>
							</li>
							<li>
								<a href="<%=contextPath%>/mall/list.jsp">장바구니 보기</a>
							</li>
						</c:if>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="col-sm-9">
			<div id="section1">
				<h1>예지케잌을 소개합니다</h1>
				<p><img src="<%=contextPath%>/upload/storeinfo.JPG" width="80%" alt="사진을 불러올 수 없어요"></p>
				<!-- <p><img src="/upload/storeinfo.JPG" alt="사진을 불러올 수 없어요"></p>
				<p><img src="storeinfo.JPG" width="80%" alt="사진을 불러올 수 없어요"></p> -->
				<p>케이크를 사랑하는 사람들이 모여 만든 가게 입니다.</p>
				<p>맛있는 수제 케이크를 만들어드려요!</p>
				<p>원하시면 레터링도 가능하답니다.</p>
				<br>
				<p>'Yeji Cake'는 창업자 안지혜, 안지혜, 이예은, 장시예의 이름을 합쳐 만든 상호입니다!</p>
			</div>
			<br>
			<div id="section2">
				<h1>창업 연혁</h1>
				2019.12.26 AI 응용소프트웨어 개발자 양성과정 교육 시작<br>
				2020.01.28 조모임 시작<br>
				2020.02.07 SQL 테이블 설계 및 생성<br>
				2020.02.11 코딩 시작<br>
				2020.02.13 1차 프로젝트 개요 제출<br>
				......<br>
				2020.02.21 프로젝트 종료 및 발표 <br>
			</div>
			<br>
			<div id="section3">
				<h1>어떤 수제케이크가 있나요?</h1>
				<p>예지케잌의 대표 메뉴는 초코, 딸기, 생크림입니다.</p>
				<p><img src="<%=contextPath%>/upload/orange2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>오렌지 자몽 케이크</p><br>
				<p><img src="<%=contextPath%>/upload/mixberry2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>믹스 베리 케이크</p><br>
				<p><img src="<%=contextPath%>/upload/white2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>화이트 초콜릿 케이크</p><br>
				<p class="morecake"><a href="<%=contextPath%>/product/Plist.jsp">▶더 많은 케이크 보기 Go~</a></p>
			</div>
			<br>
			<div id="section4">
				<h1>예지케잌의 로고</h1>
				로고 사진을 넣어주기
			</div>
		</div>
	</div>
</div>
</body>
</html>
