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
	
	.calendar td{
            width: 80px;
            height: 80px;
            text-align: center;
            font-size: 30px;
            font-family: sans-serif;
            border:2px ;
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
				<li><a href="#section2">신상품 및 추가 입고 일정</a>
				<li><a href="#section3">창업 연혁</a></li>
				<li><a href="#section4">케이크 종류</a></li>
				<li><a href="#section5">로고</a></li>
				
				<hr>
				<!-- 여기는 그냥 링크 -->
				<li><a href="<%=contextPath%>/common/storemap/jsp">찾아오시는 길</a></li>
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
				<h1> 예지케잌을 소개합니다. </h1>
				<p><img src="<%=contextPath%>/upload/storeinfo.JPG" alt="사진을 불러올 수 없어요"></p>
				<p><img src="/upload/storeinfo.JPG" alt="사진을 불러올 수 없어요"></p>
				<p><img src="storeinfo.JPG" width="80%" alt="사진을 불러올 수 없어요"></p>
				<p>케이크를 사랑하는 사람들이 모여 만든 가게 입니다.</p>
				<p>맛있는 수제 케이크를 만들어드려요!</p>
				<p>원하시면 레터링도 가능하답니다.</p>
				<br>
				<p>'Yeji Cake'는 창업자 안지혜, 안지혜, 이예은, 장시예의 이름을 합쳐 만든 상호입니다!</p>
			</div>
			<br>
			
			<div id="section2">
				<h1> 신상품 , 추가 입고 일정</h1>
				<br>
				<!-- 캘린더 -->
				<div class="calendar" align="left">
				<table id="calendar" border="2">
				    <tr>
				        <td align="left" colspan="7">⊙ 2020년 2월 ⊙</td>
				    </tr>
				    <tr>
				        <td align="center"><font color ="red">Sun </td>
				        <td align="center">Mon </td>
				        <td align="center">Tue </td>
				        <td align="center">Wed </td>
				        <td align="center">Thu </td>
				        <td align="center">Fri </td>
				        <td align="center"><font color ="blue">Sat </td>
				    </tr>
				    <tr>
				    	<td align="center"> </td>
				    	<td align="center"> </td>
				    	<td align="center"> </td>
				    	<td align="center"> </td>
				    	<td align="center"> </td>
				    	<td align="center"> </td>
				    	<td align="center"><font color ="blue">1 </td>
				    </tr>
				    <tr>
				    	<td align="center"><font color ="red">2 </td>
				    	<td align="center">3 </td>
				    	<td align="center">4 </td>
				    	<td align="center">5 </td>
				    	<td align="center">6 </td>
				    	<td align="center"><font color="6ED746">7<br><font size ="4">★NEW★</font>
				    	</td>
				    	<td align="center"><font color ="blue">8 </td>
				    </tr>
				    <tr>
				    	<td align="center"><font color ="red">9</td>
				    	<td align="center"><font color="9900E0">3<br><font size ="3">★REORDER★</font>
				    	</td>
				    	<td align="center">11 </td>
				    	<td align="center">12 </td>
				    	<td align="center">13 </td>
				    	<td align="center">14 </td>
				    	<td align="center"><font color ="blue">15 </td>
				    </tr>
				    <tr>
				    	<td align="center"><font color ="red">16 </td>
				    	<td align="center"><font color="6ED746">17<br><font size ="4">★NEW★</font>
						</td>
				    	<td align="center">18 </td>
				    	<td align="center">19 </td>
				    	<td align="center">20 </td>
				    	<td align="center"><font color="9900E0">21<br><font size ="3">★REORDER★</font>
				    	<td align="center"><font color ="blue">22 </td>
				    </tr>
				    <tr>
				    	<td align="center"><font color ="red">23 </td>
				    	<td align="center"><font color="9900E0">24<br><font size ="3">★REORDER★</font>
				    	</td>
				    	<td align="center"><font color="6ED746">25<br><font size ="4">★NEW★</font>
				    	</td>
				    	<td align="center">26 </td>
				    	<td align="center">27 </td>
				    	<td align="center">28 </td>
				    	<td align="center"><font color ="blue">29 </td>
				    </tr>
				</table>
				<div id="new">
					<h3>신상품 출시</h3>
						★★★ 7th : 민트크림 레드벨벳 케잌 출시 예정 <br><br>
						★★★ 17th : 흑당 생크림 케잌 출시 예정 <br><br>
						★★★ 25th : 초코/바닐라/딸기 미니 컵케잌 출시 예정 <br><br>
				</div>
				<div id="reorder">
					<h3>추가 입고</h3>
						★★★ 3rd : 마카롱 전 재고 입고<br><br>
						★★★ 21th : 트리플 초콜릿 무스 10수량 재입고<br><br>
						★★★ 24th : 요거 생크림 8수량 재입고 <br><br>
				</div>
			</div>
			<br>
			
			<div id="section3">
				<h1> 창업 연혁 </h1>
				2019.12.26 AI 응용소프트웨어 개발자 양성과정 교육 시작<br>
				2020.01.28 조모임 시작<br>
				2020.02.07 SQL 테이블 설계 및 생성<br>
				2020.02.11 코딩 시작<br>
				2020.02.13 1차 프로젝트 개요 제출<br>
				......<br>
				2020.02.21 프로젝트 종료 및 발표 <br>
			</div>
			<br>
			<div id="section4">
				<h1> 대표 상품 </h1>
				<p>예지케잌의 대표 메뉴는 초코, 딸기, 생크림입니다.</p>
				<p><img src="orange2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>오렌지 자몽 케이크</p><br>
				<p><img src="mixberry2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>믹스 베리 케이크</p><br>
				<p><img src="white2.JPG" width="60%" alt="사진을 불러올 수 없어요"></p>
				<p>화이트 초콜릿 케이크</p><br>
				<p class="morecake"><a href="<%=contextPath%>/product/Plist.jsp">▶더 많은 케이크 보기 Go~</a></p>
			</div>
			<br>
			<div id="section5">
				<h1> 로고 </h1>
				로고 사진을 넣어주기
			</div>
		</div>
	</div>
</div>
</body>
</html>
