<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="css/style.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
<script></script>

</head>

<body>
	<form action = "register" method = "post">
		<span class="margin">用户名： <input id="loginId"  type="text"
			name="loginId" value="" placeholder="请输入用户名" /></span></br>
		<span class="margin">密码： <input id="loginPasswd"  type="password"
			name="loginPasswd" value="" placeholder="请输入密码" /></span></br>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>