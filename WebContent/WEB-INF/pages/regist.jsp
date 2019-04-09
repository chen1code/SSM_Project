<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet">
<link href="./resources/css/main.css" rel="stylesheet" type="text/css" />
<body>
	<div class="wrap">
		<div class="content-center">
			<div class="content-center-title">注册</div>
				<div class="input-block">
					<input type="text" name="account" id="account" placeholder="账号" autocomplete="off"/>
					<input type="password" name="password" id="password" placeholder="密码"/>
					&nbsp;<i class="fa fa-exclamation wrong-tip">&nbsp;&nbsp;该账号已被注册</i>
				</div>
			<div class="btn btn-block btn-danger btn-login" id="regist">注册</div>
			<p class="hint-text">已有账号？点击<a href="login">登录</a></p>
		</div>
	</div>
</body>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/login.js"></script> 
</html>