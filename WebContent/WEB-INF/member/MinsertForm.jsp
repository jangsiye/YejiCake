<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function formcheck() {
			var mid = document.myform.mid.value ;
			if(mid.length>=4&&mid.length<=12){
			}else{
				alert('아이디는 4글자 이상 8글자 이하여야 합니다.') ;
				return false ;
			}	
			
			if(document.myform.MDCheck.value != "check"){
				alert('아이디 중복체크를 해주세요.') ;
				return false ;
			}
			
			var name = document.myform.name.value ;
			var reg = /^[가-힣a-z]{2,}/ ;
			var result = reg.test(name) ;
			if(result == false){
				alert('이름은 2글자 이상이어야 합니다.') ;
				return false ;
			}
			var password = document.myform.password.value ;
			reg = /^[a-zA-Z0-9]{4,8}/ ;
			result = reg.test(password) ;
			if(result == false){
				alert('비밀번호는 4글자 이상 8글자 이하여야 합니다.') ;
				return false ;
			}
		}
		function midCheck(){
			if(document.myform.mid.value == ""){
				alert('아이디를 입력하세요.') ;
			} else{
				document.myform.MDCheck.value = "check"
				var url = "MidCheckForm.jsp?mid=" + document.myform.mid.value ;
				window.open(url, "midwin", "width=400, height=350");}
			return ;
			}
	</script>
	
	<!-- 다음 주소 팝업 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function execDaumAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.address; // 도로명 주소 변수
	                document.getElementById("address").value = roadAddr;
	                
	            }
	        }).open();
	    }
	</script>
	<!-- 핸드폰 번호 하이픈 자동입력 -->
	<script type="text/javascript">
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "")
				.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });
	</script>
</head>
<body>
<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">회원가입</h2>
		</div>
		<div class="panel-body">
			<form action="MinsertTo.jsp" method="post"  name = "myform" class="form-horizontal" role="form" >
				<input type = "hidden" name = "mpoint" value = "0">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">아이디</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" name="mid" id="mid" class="form-control"  onkeydown="inputMidChk()">
                    </div>
                    <div class="col-sm-3">
                        <input type="button" name="midcheck" id="midcheck" class="form-control"  value="중복확인" onclick="return midCheck()">
                    	<input type="hidden" name="MDCheck" value="uncheck">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">이름</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="name" id="name" class="form-control"  value="admin">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">비밀번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="password" name="password" id="password" class="form-control" value = "1234">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">핸드폰 번호</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="text" name="phone" id="phone" class="form-control phoneNumber">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <label class="control-label form-control-static">도로명 주소</label>
                    </div>
                    <div class="col-sm-9">
                   		<input type="button" class = "btn btn-primary" onclick="execDaumAddress()" value="주소 찾기"><br>
                        <input type="text" name="address" id="address" class="form-control" value = "서울시 서초구">
                    </div>
                </div>
				<input type="hidden" name="mpoint" id="mpoint" value = "0">
                
                <div class="form-group">
                    <div class="col-sm-12" align = "center">
                    	<button type = "submit" class = "btn btn-default" onclick = "return formcheck();">
                    		<b>
                    			회원가입
                    		</b>
                    	</button>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<button type = "reset" class = "btn btn-default">
                    		<b>
                    			초기화
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
