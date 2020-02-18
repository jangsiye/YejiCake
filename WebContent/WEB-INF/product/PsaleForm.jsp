<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<jsp:useBean id="dao" class="model.ProductDao" />
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url(./backimg.PNG) no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

        .pricing-table {
            max-width: 1200px;
            margin: auto;
            display: flex;      /*div박스를 옆으로 나열*/
            justify-content: center;    /*div박스를 가운데정렬*/
            text-align: center;         /*div박스의 텍스트를 가운데정렬*/
            flex-wrap: wrap;
        }

        .col {      /*각 박스를 전체넓이의 25%씩 할당*/
            flex: 25%;
            padding: 10px;
            max-width: 320px;
            box-sizing: border-box;
            border-radius: 10px;
        }

        .table {
            background: #ffe4e1;
            padding: 10px;
            font-family: "Caslon", sans-serif;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 10px #00000070;
        }

        .table h2 {
            text-transform: uppercase;
        }
                
        .table ul {
            margin: 0;
            padding: 0;
        }

        .table ul li {
            padding: 10px 0;
            list-style: none;
        }

        .price {
            font-size: 40px;
            margin-bottom: 20px;
        }

        .price span {
            display: block;
            font-size: 14px;
        }

        .table button {
            text-decoration: none;
            color: #2c3e50;
            border: 2px solid #2c3e50;
            display: block;
            padding: 10px 30px;
            margin: 10px 0 10px 60px;
            border-radius: 40px;
            text-transform: uppercase;
            font-size: 14px;
            transition: 0.5s linear;
        }

        .table button:hover {
            background: #2c3e50;
            color: #fff;
        }

        .pop {
            background: #2c3e50;
            color: #fff;
            transform: rotate(45deg);
            padding: 10px 40px;
            position: absolute;
            top: 5px;
            right: -34px;
        }

        /*980px이상일 때는 원래대로 한줄에 한 박스가 25%씩 차지.*/
        @media screen and (max-width: 980px) {  /*이하일때는 한 줄에 한 박스가 50%씩 차지*/
            .col {
                flex: 50%;
            }
        }
        
        @media screen and (max-width: 700px) {  /*이하일때는 한 줄에 한 박스가 100%씩 차지*/
            .col {
                flex: 100%;
            }
        }

    </style>
</head>
<body>

<br>
<div align="center">
	<h1>★특별 세일 패키지★</h1>
	<p>패키지 상품을 구매하시면 15~25퍼센트의 할인을 받으실 수 있어요!</p>
</div>

<br>

<div class="pricing-table">

    <div class="col">
        <div class="table">
            <h2>Black Package</h2>
            <div class="pop">Popular</div>
            <div class="price">
                7000원 할인
                <span>할인가 : 37000원 -> 30000원</span>
            </div>

            <ul>
                <li><strong>블랙 벨벳 케이크 </strong>1개</li>
                <li><strong>다크 초코릿 </strong>1개</li>
                <li><strong>초콜릿 마카롱 </strong>1개</li>
                <li><strong>하트 초 </strong>3개</li>
            </ul>
            <form action="./../mall/insertsale.jsp" method="post" role="form" class="form-inline" name="cartform">	
				<%
					request.setCharacterEncoding("UTF-8");
					int pnum1 = 0; int pnum2 = 0; 
					Product product1 = new Product(); Product product2 = new Product(); 
				%>
				<%
					//페키지와 할인쿠폰을 상품으로 넘겨준다
					pnum1 = 22; pnum2 = 25; 
					product1 = dao.SelectByPk(pnum1); product2 = dao.SelectByPk(pnum2); 
					request.setAttribute("product1", product1); request.setAttribute("product2", product2);
					
				%>
				<input type="hidden" name="pnum1" value="<%=product1.getPnum()%>">
				<input type="hidden" name="stock1" value="<%=product1.getStock()%>">
				<input type="hidden" name="qty1" value="1">
				<input type="hidden" name="remark1" value="">
				<input type="hidden" name="pnum2" value="<%=product2.getPnum()%>">
				<input type="hidden" name="stock2" value="<%=product2.getStock()%>">
				<input type="hidden" name="qty2" value="1">
				<input type="hidden" name="remark2" value="">
				
				<button class="btn btn-default" type="submit" onclick="return cartcheck();">장바구니 담기</button></td>
			</form>	
        </div>
    </div>

    <div class="col">
        <div class="table">
            <h2>Fruit Package</h2>
            <div class="price">
                5000원 할인
                <span>할인가 : 34100원 -> 29100원</span>
            </div>

            <ul>
                <li><strong>마스카포네 생크림 </strong>1개</li>
                <li><strong>산딸기 마카롱 </strong>1개</li>
                <li><strong>블루베리 마카롱 </strong>1개</li>
                <li><strong>숫자 초 </strong>3개</li>
            </ul>
            
			<form action="./../mall/insertsale.jsp" method="post" role="form" class="form-inline" name="cartform">	
				<%
					pnum1 = 23; pnum2 = 26;
					product1 = dao.SelectByPk(pnum1); product2 = dao.SelectByPk(pnum2); 
					
					request.setAttribute("product1", product1); request.setAttribute("product2", product2);
					
				%>
				<input type="hidden" name="pnum1" value="<%=product1.getPnum()%>">
				<input type="hidden" name="stock1" value="<%=product1.getStock()%>">
				<input type="hidden" name="qty1" value="1">
				<input type="hidden" name="remark1" value="">
				<input type="hidden" name="pnum2" value="<%=product2.getPnum()%>">
				<input type="hidden" name="stock2" value="<%=product2.getStock()%>">
				<input type="hidden" name="qty2" value="1">
				<input type="hidden" name="remark2" value="">

				<button class="btn btn-default" type="submit" onclick="return cartcheck();">장바구니 담기</button></td>
			</form>	            
        </div>
    </div>
    
	<div class="col">
	    <div class="table">
	        <h2>Macaron Package</h2>
	        <div class="price">
	            3000원 할인
	            <span>할인가 : 20000원 -> 17000원</span>
	        </div>
	
	        <ul>
	            <li><strong>산딸기 마카롱 </strong>2개</li>
	            <li><strong>그린티 마카롱 </strong>2개</li>
	            <li><strong>초콜릿 마카롱 </strong>2개</li>
	            <li><strong>블루베리 마카롱 </strong>2개</li>
	        </ul>
	
			<form action="./../mall/insertsale.jsp" method="post" role="form" class="form-inline" name="cartform">	
				<%
					pnum1 = 24; pnum2 = 27;
					product1 = dao.SelectByPk(pnum1); product2 = dao.SelectByPk(pnum2); 
					
					request.setAttribute("product1", product1); request.setAttribute("product2", product2);
				%>
				<input type="hidden" name="pnum1" value="<%=product1.getPnum()%>">
				<input type="hidden" name="stock1" value="<%=product1.getStock()%>">
				<input type="hidden" name="qty1" value="1">
				<input type="hidden" name="remark1" value="">
				<input type="hidden" name="pnum2" value="<%=product2.getPnum()%>">
				<input type="hidden" name="stock2" value="<%=product2.getStock()%>">
				<input type="hidden" name="qty2" value="1">
				<input type="hidden" name="remark2" value="">
				
				<button class="btn btn-default" type="submit" onclick="return cartcheck();">장바구니 담기</button></td>
			</form>	
	    </div>
	</div>
    
</div>

    
<!-- footer -->
<div>
<%@include file="./../common/footer.jsp" %>
</div>


</body>
</html>
