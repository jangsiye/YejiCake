<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>

<body>
	<div class="col-sm-offset-3 col-sm-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="panel-title">로그인 페이지</h2>
	</div>
			<div class="panel-body">
				<form action = "loginTo.jsp" method="post"  class="form-horizontal" role="form">
	                <div class="form-group">
	                    <div class="col-sm-3">
	                        <label class="control-label form-control-static">아이디</label>
	                    </div>
	                    <div class="col-sm-9">
	                        <input type="text" name="mid" id="mid" 
	                        	placeholder = "아이디를 입력해주세요" class="form-control">
	                    </div>
	                </div>
	                	<div class="form-group">
	                    <div class="col-sm-3">
	                        <label class="control-label form-control-static">비밀번호</label>
	                    </div>
	                    <div class="col-sm-9">
	                        <input type="password" name="password" id="password" 
	                        	placeholder = "비밀번호를 입력해주세요" class="form-control">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <div class="col-sm-offset-3 col-sm-6">
	                        <button class="btn btn-default" type = "submit">
	                        	로그인
	                        </button>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                       	<button class="btn btn-default" type = "reset">
	                        	취소
	                        </button>
	                    </div>
	                </div>
	            </form>
			</div>
		</div>
	</div>
</body>
</html>
