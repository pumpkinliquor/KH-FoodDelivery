<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<!-- 부트스트랩관련 라이브러리 -->
	<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<!-- 사용자작성 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<meta charset="UTF-8">
<title>홈페이지</title>
</head>
<body>
	<a href="${path }/owner/customService.do">고객센터</a>
	<a href="${path }/owner/storeForm.do">업체등록</a>
	<a href="${path }/admin/noticeList.do">공지사항</a>
	<a href="${path }/admin/noticeForm.do">공지사항등록</a>
	<a href="${path }/admin/memberList.do">멤버리스트</a>
	
</body>
</html>
