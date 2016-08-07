<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title></title>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>

	<form action="login" method="post">
		<div>
			<label>用户名：</label>
			<li><input id="loginId" type="text" name="loginId" 
				placeholder="请输入用户名" /> 
				<c:if test="${error1!=null}"> <span>${error1}</span>
				</c:if></li>

		</div>
		<div>
			<label>密码：</label>
			<li><input id="loginPasswd" type="password" name="loginPasswd"
				 placeholder="请输入密码" /> 
				<c:if test="${error2!=null}"> <span>${error2}</span>
				</c:if></li>
				</li>
		</div>
		<input type="submit" value="提交" />
	</form>
</body>
</html>