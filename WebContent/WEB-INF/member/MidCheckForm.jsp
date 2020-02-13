<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="col-sm-offset-2 col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title" align="center">아이디 중복 확인</h2>
		</div>
<%
	String inputmid = request.getParameter("mid");
%>
		<div class="panel-body">
			<form method="post" action="MidCheckProc.jsp" onsubmit="return blankCheck(this)" class="form-horizontal" role="form" >
                <div class="form-group">
                    <div class="col-sm-6" align="center">
                        <label class="control-label form-control-static">아이디</label>
                    </div>
                    <div class="col-sm-4" align="center">
                        <input type="text" name="mid" id="mid" 
                        	maxlength="8" autofocus
                        	class="form-control"  value="<%=inputmid %>">
                    </div>
                    <div class="col-sm-6" align="center">
                        <button type="submit" class="btn btn=default">중복확인</button>
                    </div>
                </div>
            </form>
		</div>
	</div>
</div>

	<script>
		function blankCheck(f){
			var mid=f.mid.value;
			mid=mid.trim();
				if(mid.length<4){
				alert("아이디는 4자 이상 입력해주십시오.");
				return false;
				}//if end
			return true;
		}//blankCheck() end
	</script>
</body>
</html>
