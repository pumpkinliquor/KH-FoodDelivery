<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>메시지창</title>
	<script>
		alert('${msg}');
		location.href="${pageContext.request.contextPath}${loc}";
	</script>
</head>
<body>
</body>
</html>