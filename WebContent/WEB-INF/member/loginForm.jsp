<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<style>
		body {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
			background: none;
		}

		.box {
			width: 300px;
			padding: 40px;
			position: absolute;
			top: 70%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: none;
			text-align: center;
		}

		.box h1 {
			font-family: Forte;
			color: black;
			font-weight:500;
		}

		.box input[type="text"], .box input[type="password"] {
			border: 0;
			background: none;
			display: block;
			margin: 20px auto;
			text-align: center;
			border: 2px solid #FAE0D4;
			padding: 14px 10px;
			width: 200px;
			outline: none;
			color: gray;
			border-radius: 24px;
			transition: 0.25s;
		}

		.box input[type="text"]:focus, .box input[type="password"]:focus {
			width: 220px;
			border-color: #D6C7ED;
		}

		.box input[type="submit"] {
			border: 0;
			background: none;
			display: block;
			margin: 20px auto;
			text-align: center;
			border: 2px solid #D6C7ED;		/**/
			padding: 14px 40px;				/**/
			outline: none;
			color: gray;
			border-radius: 24px;
			transition: 0.25s;	
			cursor: pointer;				/**/			
		}

		.box input[type="submit"]:hover {
			background: #D6C7ED;

		}
	</style>


</head>

<body>
	<form class="box" action="loginTo.jsp" method="post">
		<h1>Login</h1>
			<input type="text" name="mid" placeholder="아이디">
			<input type="password" name="password" placeholder="비밀번호">
			<input type="submit" value="Login"> 		
	</form>
</body>
</html>
