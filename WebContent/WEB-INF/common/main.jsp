<%@page import="model.Product"%>
<%@page import="model.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 메인 사진 슬라이드 -->
<div class="container">
  <h2>Carousel Example</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="<%=contextPath%>/upload/cake1.JPG" alt="cake1" style="width:100%;">
      </div>

      <div class="item">
        <img src="<%=contextPath%>/upload/cake2.JPG" alt="cake2" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="<%=contextPath%>/upload/cake3.JPG" alt="cake3" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br><br><br>

<%
	ProductDao dao = new ProductDao();
	Product product = new Product() ;

	List<Product> lists = dao.SelectAll_Hit();
	request.setAttribute("lists", lists) ;
%>

<!-- 인기 상품 목록 -->
<div class="col-sm-offset-1 col-sm-10">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title" align = "left">★이 달의 베스트 케이크★</h2>
		</div>
		<div class="panel-body col-sm-12">
		<!-- 베스트 케익 3개만 보여주기 -->
		<c:forEach var="i" begin="0" end="2">
			<p><img src="<%=contextPath%>/upload/${requestScope.lists[i].image}" width="30%"/></p>
			<p>
				<a href="PdetailView.jsp?pnum=${requestScope.lists[i].pnum}">
					${requestScope.pname}
				</a>
			</p>
			<p>${requestScope.lists[i].price}</p>
		</c:forEach>
		<a href="<%=contextPath%>/product/Plist.jsp">▶더 많은 케이크 보기 Go~</a>
		</div>
	</div>
</div>



</body>
</html>
