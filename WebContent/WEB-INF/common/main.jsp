
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
<!--sns-->
<style>
.sns {
    padding: 10px;
    margin: 30px 0;
}
.sns a {
    margin: 10px;
    color:rgb(50, 61, 77);
    line-height: 50px;
    font-size: 50px;
}
/*미술관 홍보동영상*/
.player {
    margin: 20px 100px;
    padding: 30px 10px;
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
	      	 <p class="crown"><i class="fas fa-crown"></i></p>
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
      <br>
      <br>
      </div>
   </div>
</div>

    <style type="text/css">
        td{
            width: 40px;
            height: 40px;
            text-align: center;
            font-size: 12px;
            font-family: sans-serif;
            border:2px ; 
        }
    </style>
<script type="text/javascript">
        var today = new Date();
        var date = new Date();
        function prevCalendar() {
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); 
        }
 
        function nextCalendar() {
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();
        }
        
        function buildCalendar(){
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            var tbCalendar = document.getElementById("calendar");
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
            while (tbCalendar.rows.length > 2) {
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
             }
            
             var row = null;
             row = tbCalendar.insertRow();
             
             var cnt = 0;
           
             for (i=0; i<doMonth.getDay(); i++) {
                  cell = row.insertCell();
                  cnt = cnt + 1;
             }
            
             for (i=1; i<=lastDate.getDate(); i++) { 
                  cell = row.insertCell();
                  cell.innerHTML = i;
                  cnt = cnt + 1;
                  
              if (cnt % 7 == 1) {
                cell.innerHTML = "<font color=red>" + i;
           	 }    
              
              if (cnt%7 == 0){
                  cell.innerHTML = "<font color=blue>" + i;
                   row = calendar.insertRow();
              }
              
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                cell.bgColor = "#FEEDEB";
               }
             }
        }
    </script>
</head>
<body>
    <p></p>
    <h3 align="center"></h3>
<table id="calendar" align="center" >
    <tr>
        <td><label onclick="prevCalendar()"><</label></td>
        <td align="center" id="tbCalendarYM" colspan="5">
        yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
            
        </label></td>
    </tr>
    <tr>
        <td align="center"><font color ="red">Sun</td>
        <td align="center">Mon</td>
        <td align="center">Tue</td>
        <td align="center">Wed</td>
        <td align="center">Thu</td>
        <td align="center">Fri</td>
        <td align="center"><font color ="blue">Sat</td>
    </tr> 
</table>
<script language="javascript" type="text/javascript">
    buildCalendar();//
</script>
</body>
</html>
<br>
<br>
<style>
	html {
    margin-top: 25px;
    font-size: 21px;
    text-align: center;
    -webkit-animation: fadein 2s; // Page Transition Effect
    -moz-animation: fadein 2s; // Safari, Chrome and Opera > 12.1 
    -ms-animation: fadein 2s; // Firefox < 16
    -o-animation: fadein 2s; // Internet Explorer
    animation: fadein 2s; // Opera < 12.1
    -webkit-animation: fadeout 2s; // Page Transition Effect
    -moz-animation: fadeout 2s; // Safari, Chrome and Opera > 12.1 
    -ms-animation: fadeout 2s; // Firefox < 16
    -o-animation: fadeout 2s; // Internet Explorer
    animation: fadeout 2s; // Opera < 12.1
}

body {
    width: 700px;
    padding-top: 100px;
    margin: 0 auto;
    font-size: 12px;
    color: #272727;
    font-family: sans-serif;
    font-size: 20px;
}

date {
    width: 700px;
    padding-top: 200px;
    padding-left: 10px;
    margin: 0 auto;
    font-size: 12px;
    color: #272727;
    font-family: sans-serif;
    font-size: 20px;
}

#txt {
    font-family: sans-serif;
    font-size: 60px;
    color: #272727;
}

weather {
    width: 300px;
    height: 50px;
    padding-top: 200px;
    padding-left: 60px;
    margin: -300px auto;
    font-size: 12px;
    color: #272727;
    font-family: sans-serif;
    font-size: 20px;
}
	</style>
    


    <script>
        function startTime() {
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById('txt').innerHTML =
                h + ":" + m + ":" + s;
            var t = setTimeout(startTime, 500);
            span.style.fontSize = "25px";
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i
            }; // add zero in front of numbers < 10
            return i;
        }
    </script>
    <script>
	    function date_time(id) {
	        date = new Date;
	        year = date.getFullYear();
	        month = date.getMonth();
	        months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
	        d = date.getDate();
	        day = date.getDay();
	        days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
	        h = date.getHours();
	        if (h < 10) {
	            h = "0" + h;
	        }
	        m = date.getMinutes();
	        if (m < 10) {
	            m = "0" + m;
	        }
	        s = date.getSeconds();
	        if (s < 10) {
	            s = "0" + s;
	        }
	        result = '' + days[day] + ' ' + months[month] + ' ' + d + ', ' + year;
	        document.getElementById(id).innerHTML = result;
	        setTimeout('date_time("' + id + '");', '1000');
	        return true;
	    }
    </script>
</head>

<body>
        <body>
            <span id="date_time"></span>
            <script type="text/javascript">
                window.onload = date_time('date_time');
            </script>
        </body>

        <body onload="startTime()">
            <div id="txt">
            </div>
            <br>
        </body>
        <br>
</body>


<!-- sns link view -->
<div class="sns">
  <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square"></i></a>
  <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter-square"></i></a>
  <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
</div>


</body>
</html>
