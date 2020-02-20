<%@page import="model.Product"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp" %>
<jsp:useBean id="dao" class="model.ProductDao" /> 
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	Product product = dao.SelectByPk(pnum);
	
	request.setAttribute("product", product);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[name="content"] {
	height: 300px;
}

.footer {
	clear:both;
}
</style>

<script type="text/javascript">
		function formcheck() {	
			var tag1 = document.myform.tag1.value ;
			var reg = /^[#]/ ;
			var result = reg.test(tag1) ;

			if(tag1 != "" && result == false){
				alert('태그는 반드시 #으로 시작해야 합니다!') ;
				return false ;
			}
			
			var tag2 = document.myform.tag2.value ;
			reg = /^[#]/ ;
			result = reg.test(tag2) ;

				if(tag2 != "" && result == false){
					alert('태그는 반드시 #으로 시작해야 합니다!') ;
					return false ;
				}
	
			
			var tag3 = document.myform.tag3.value ;
			reg = /^[#]/ ;
			result = reg.test(tag3) ;

				if(tag3 != "" && result == false){
					alert('태그는 반드시 #으로 시작해야 합니다!') ;
					return false ;
				}

		}

</script>
	
</head>
<body>
<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">상품 정보 수정</h2>
		</div>
		<div class="panel-body">
			<form action="PupdateTo.jsp" name="myform" method="post" class="form-horizontal" role="form">
                <input type="hidden" name="pnum" value="<%=product.getPnum()%>">
                
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">상품명</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="pname" id="pname" class="form-control" value="<%=product.getPname()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">가격</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="price" id="price" class="form-control" value="<%=product.getPrice()%>">
                    </div>
                </div>
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">재고</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="stock" id="stock" class="form-control" value="<%=product.getStock()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">소개</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="content" id="content" class="form-control" value="<%=product.getContent()%>">
                    </div>
				</div>
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">태그</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="tag1" id="tag1" class="form-control" value="<%=product.getTag1()%>">
                        <input type="text" name="tag2" id="tag2" class="form-control" value="<%=product.getTag2()%>">
                        <input type="text" name="tag3" id="tag3" class="form-control" value="<%=product.getTag3()%>">
                    </div>
				</div>
				   <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">적립 포인트</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="point" id="point" class="form-control" value="<%=product.getPoint()%>">
                    </div>
				</div>
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">조회수</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="fakehit" id="fakehit" 
                        	disabled="disabled"
                        	class="form-control" value="${product.hit}">
                        <input type="hidden" name="hit" id="hit" value="${product.hit}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12" align="center">
                        <button  type ="submit" class="btn btn-default" onclick = "return formcheck();">
                        	<b> 수정
                        	</b>
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button  type ="reset" class="btn btn-default">
                        	<b> 초기화
                        	</b>
                        </button>
                        <a href="<%=contextPath%>/product/PdetailView.jsp?pnum=<%=product.getPnum() %>" onclick="return confirm('수정을 취소하시겠습니까? 상품 상세보기로 돌아갑니다.')" class="btn btn-default">돌아가기</a>
                    </div>
                </div>
             
            </form>
		</div>
		</div>
</div>

<!-- footer  -->
<div class="footer">
<%@include file="./../common/footer.jsp" %>
</div>
</body>
</html>
