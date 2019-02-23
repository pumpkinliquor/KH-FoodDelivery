<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${path}/resources/css/style.css" />
<meta charset="UTF-8">
<title>업체등록</title>
<style>
    div#update-container{
    	padding-top: 12%;
		padding-bottom: 12%;
		background-color:white;
		width:700px; 
		margin:0 auto; 
		text-align:center;
		}
    div#update-container input, div#update-container select {margin-bottom:10px;}
</style>
</head>
<body>
    <div id="update-container">
        <form action="${path}/board/boardWriteEnd.do" method="post" enctype="multipart/form-data">
        	<div class="col-sm-12">
        	<label for="boardTitle" class="col-sm-2 control-label" style="float:left;">업체명</label>
        	<div class="row">
        	</div>
            <input type="text" id="boardTitle" class="form-control" name="boardTitle" required>
            </div>
            <div class="col-sm-12">
        	<label for="boardTitle" class="col-sm-2 control-label" style="float:left;">업체 연락처</label>
        	<div class="row">
        	</div>
            <input type="tel" id="boardTitle" class="form-control" name="boardTitle" required>
            </div>
            <div class="col-sm-12">
        	<label for="boardTitle" class="col-sm-2 control-label" style="float:left;">업체 주소</label>
        	<div class="row">
        	</div>
            <input type="text" id="boardTitle" class="form-control" name="boardTitle" required>
            </div>
            <div class="col-sm-12">
        	<label for="boardTitle" class="col-sm-2 control-label" style="float:left;">최소 주문 금액</label>
        	<div class="row">
        	</div>
            <input type="text" id="boardTitle" class="form-control" name="boardTitle" required>
            </div>
            <div class="col-sm-12">
            <div class="row"> 
            <label for="boardContent" class="col-sm-2 control-label" style="float:left;">업체소개</label>
            </div>
            <textarea name="boardContent" id="boardContent" class="form-control" rows="10" style="resize:none;"></textarea>
            </div>
            <div class="col-sm-12">
        	<div class="row">
        	<label for="boardOriginalFileName" class="col-sm-2 control-label" style="float:left;">메인사진</label>
        	</div>
            <input type="file" style="float:left;" id="boardOriginalFileName" name="boardOriginalFileName">
            </div>
            <br/>
            <br/>
            <input type="submit" class="btn btn-outline-danger" onclick="return validate();" value="업체등록"/>
        </form>
    </div>
</body>
</html>