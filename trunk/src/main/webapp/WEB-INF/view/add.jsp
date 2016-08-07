<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String serverPath = "http://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
<link rel="stylesheet"
	href="<%=serverPath%>/js/themes/default/default.css" />
<link rel="stylesheet"
	href="<%=serverPath%>/js/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=serverPath%>/js/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<%=serverPath%>/js/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=serverPath%>/js/jquery.js"></script>
<script charset="utf-8" src="<%=serverPath%>/js/plugins/code/prettify.js"></script>
<script type="text/javascript">
	KindEditor.ready(function(K) {
		var editor1 = K.create('#topicDesc', {
			uploadJson : '<%=serverPath%>/uploadimage'
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		
		$("#firstCategory").change(function() {
			var options= '';
			var data;
			$.ajax({
				url: '<%=serverPath%>/category/load?parentId='
								+ $("#firstCategory").val(),
						async : false,
						success : function(dataa) {
							data = dataa;
						},
						error : function() {
							alert("ajax fail!");
						}
					});

					$.each(eval(data), function(i, category) {
						options = options
								+ '<option value="'+ category.id +'">'
								+ category.cateName + '</option>';
					});
					$("#childrenCategory option:gt(0)").remove();
					$("#childrenCategory").append(options);
				});
	});
</script>
</head>
<body>
	<form action="addnewtopic" method="POST">
		类别：<select id="firstCategory" name="categoryId">
			<option>请选择一级分类</option>
			<c:forEach items="${categoryList}" var="category">
				<option value="${category.id}" id="${category.id}">${category.cateName}</option>
			</c:forEach>
		</select> <select id="childrenCategory" name="childCateid">
			<option>请选择二级分类</option>
		</select> 标题：<input type="text" name="name" value="" />
		<textarea id="topicDesc" name="descs"></textarea>
		<p>
			<input type="submit">
		</p>
	</form>

</body>
</html>