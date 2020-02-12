<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function formCheck(){
			var id = document.myform.id.value;
			if(id.length >=4 && id.length <= 12 ){
				
			} else {
				alert( '4 <= id <= 12' );
				return false;
			}
			var name = document.myform.name.value;
			var reg =/^[가-힣a-z]{2,}/;
			var result = reg.test(name);
			if(result == false){
				alert('이름은 2글자 이상이어야 합니다.');
				return false;				
			}
			/* 특수 문자는 @!만 가능하다. */
			var password = document.myform.password.value;
			reg=/^[a-z][a-zA-Z0-9@!]{3,11}/;
			result = reg.test(password);
			if(result == false){
				alert('비밀번호는 4글자 이상, 12글자 이하여야합니다.');
				return false;				
			}
			var zipcode = document.myform.zipcode.value;
			reg=/^\d{5}/;
			result = reg.test(zipcode);
			if(result == false){
				alert('우편번호는 5글자여야합니다.');
				return false;				
			}
			//alert( id );			
			//alert( id.length );
			return false;
		}
	</script>
</head>
<body>
<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-primary">
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
                        <label class="control-label form-control-static">이미지</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="image" id="image" class="form-control">
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
                    <div class="col-sm-12" align="center">
                        <button  type ="submit" class="btn btn-default">
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
</body>
</html>
