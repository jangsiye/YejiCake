<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style type="text/css">
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
			<h2 class="panel-title">상품 등록</h2>
		</div>
		<div class="panel-body">
			<form action="PinsertTo.jsp" name="myform" method="post" 
			enctype="multipart/form-data" class="form-horizontal" role="form">
			<input type="hidden" name="mpoint" value="0">
                
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">상품명</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="pname" id="pname" class="form-control" value="빈츠">
                    </div>
                </div>
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">상품 분류</label>
                    </div>
                    <div class="col-sm-9">
                    	<select name="category">
                    		<option value="1" selected>케이크</option>
                    		<option value="2">다른 디저트</option>
                    		<option value="3">소품</option>
                    	</select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">이미지</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="image" id="image" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">이미지2</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="image2" id="image2" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">재고</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="stock" id="stock" class="form-control" value="100">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">가격</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="price" id="price" class="form-control" value="2000">
                    </div>
                </div>					
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">설명</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="content" id="content" class="form-control" value="yum">
                    </div>
                </div>					
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">포인트</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="point" id="point" class="form-control" value="20">
                    </div>
                </div>										
				<div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">태그</label>
                    </div>
                    <div class="col-sm-9">
                    	<p>※ 태그는 반드시 #으로 시작해야 합니다.</p>
                        <input type="text" name="tag1" id="tag1" class="form-control" value="#케이크">
                        <input type="text" name="tag2" id="tag2" class="form-control" value="">
                        <input type="text" name="tag3" id="tag3" class="form-control" value="">
                    </div>
                </div>		
                
                      <div class="form-group">
                    <div class="col-sm-12" align="center">
                        <button  type ="submit" class="btn btn-default" onclick = "return formcheck();">
                        	<b> 등록
                        	</b>
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button  type ="reset" class="btn btn-default">
                        	<b> 취소
                        	</b>
                        </button>
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
