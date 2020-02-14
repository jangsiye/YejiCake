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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

<style type="text/css">

<!--인기 상품 css -->
.box {
	float:left;
	margin: 30px;
	width: 300%;
}

<!--캘린더 css -->

.calender {
   box-sizing: border-box;
   font-family: Verdana, sans-serif;
}

.calender ul {list-style-type: none;}

.month {
  display: inline-block;
  padding: 10px;
  width: 30%;
  /* background: #1abc9c;  */
  background: #ffcac9;
  text-align: center;
}

.month ul {
  margin: 0;
  padding: 0;
  
}

.month ul li {
  color: black;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 3px;
}

.weekdays {
  margin: 0;
  padding: 1px 0;
  width: 30%;
  background: rgba(42,46,65,0.7);
  color:white;
}

.weekdays li {
  display: inline-block;
  width: 13.4%;
  color: white;
  text-align: center;
}

.days {
 width: 30%;
  padding: 10px 0;
  color:blue;
  margin: 0;
  background:#ffcac9;
}

.days li {
  list-style-type: none;
  display: inline-block;
  width: 13.2%;
  text-align: center;
  margin-bottom: 5px;
  font-size:12px;
  color: black;
  
}

.days li .active {
  padding: 5px;
  background: rgba(42,46,65,0.7);
  color:yellow;
}

/* Add media queries for smaller screens */
@media screen and (max-width:720px) {
  .weekdays li, .days li {width: 13.1%;}
}

@media screen and (max-width: 420px) {
  .weekdays li, .days li {width: 12.5%;}
  .days li .active {padding: 2px;}
}

@media screen and (max-width: 290px) {
  .weekdays li, .days li {width: 12.2%;}
}

</style>
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
	      <div class="box">
	         <p><img src="<%=contextPath%>/upload/${requestScope.lists[i].image}" width="100%"/></p>
	         <p>
	            <a href="PdetailView.jsp?pnum=${requestScope.lists[i].pnum}">
	               ${requestScope.lists[i].pname}
	            </a>
	         </p>
	         <p>${requestScope.lists[i].price}</p>
	         <p><i class="far fa-eye"></i> ${requestScope.lists[i].hit}</p>
	       </div>
      </c:forEach>
      <a href="<%=contextPath%>/product/Plist.jsp">▶더 많은 케이크 보기 Go~</a>
      </div>
   </div>
</div>

<!-- 달력 -->
<div class="calender">
   <div class="month">      
     <ul>
       <li>
         <span style="font-size:18px">2020</span><br>
          February<br>
       </li>
     </ul>
   </div>
   
   <ul class="weekdays">
      <span style="font-size:12px">
         <li>Sun</li><li>Mon</li><li>Tue</li>
         <li>Wed</li><li>Thu</li><li>Fri</li><li>Sat</li>
        </span>
   </ul>
   
   <ul class="days">  
     <li></li><li></li><li></li><li></li><li></li><li></li>
     <li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li><li>7</li>
     <li>8</li><li>9</li><li>10</li><li>11</li><li>12</li><li>13</li><li><span class="active">14</span></li>
     <li>15</li><li>16</li><li>17</li><li>18</li><li>19</li><li>20</li><li>21</li>
     <li>22</li><li>23</li><li>24</li><li>25</li><li>26</li><li>27</li><li>28</li><li>29</li>
   </ul>
</div>


<div>

</div>


</body>
</html>
