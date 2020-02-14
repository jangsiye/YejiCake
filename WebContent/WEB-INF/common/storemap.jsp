<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#map{
		margin: 20px;
		border-radius: 10px;
	}
	.table {
		text-align: center;
		text-weight: bold;
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
				<li><a href="#section1">찾아오시는 길</a></li>
				<li><a href="#section2">주차 안내</a></li>
				
				<hr>
				<!-- 여기는 그냥 링크 -->
				<li><a href="<%=contextPath%>/common/storeinfo.jsp">예지케잌 소개</a></li>
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
				<h1>찾아 오시는 길</h1>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.263727453389!2d127.02307125091664!3d37.501697579711!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.
				1!3m3!1m2!1s0x357ca15a0c163d41%3A0xfac759224c6bc427!2z642U7KGw7J2A7Lu07ZOo7YSw7JWE7Lm0642w66-4!5e0!3m2!1sko!2skr!4v1581649340844!5m2!1sko!2skr" 
				width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
				<p>신논현역 6번 출구로 나오신 후</p>
				<p>직진하여 300m 가량 오시면 됩니다^^</p>
				<p>00건물 3층, 엘리베이터 바로 오른편에 위치하고 있습니다.</p>
			</div>
			<br>
			<div id="section2">
				<h1>주차 안내</h1>
				<p>※주차요금은 30분 단위로 계산됩니다.</p>
				<p> 케이크 픽업시 1시간짜리 주차권을 드립니다.</p>
				<table class="table">
					<thead>
						<tr>
							<th>시간</th>
							<th>주차요금</th>
							<th>구분</th>
						</tr>					
					</thead>
					<tr class="active">
						<td>30분</td>
						<td>1000원</td>
						<td rowspan="3"><br>대형 자량은 <br>모든 요금의<br> +1000원 입니다.</td>
					</tr>
					<tr class="active">
						<td>1시간</td>
						<td>1500원</td>
					</tr>
					<tr class="active">
						<td>3시간</td>
						<td>4000원</td>
					</tr>
				</table>
			</div>
			<br><br><br><br>
		</div>
	</div>
</div>
</body>
</html>
