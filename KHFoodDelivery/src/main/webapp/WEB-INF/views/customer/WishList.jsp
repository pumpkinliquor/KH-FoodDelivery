<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />
<c:forEach var="dd" items="${wishList }">
	<div id="deletedd${dd.MENUCODE }">
		<ul>
			<li style='list-style: none; float: left;'>${dd.MENUNAME}</li>
		</ul>
		<br>
		<ul>
			<li style='list-style: none; float: left;'><a id='deleteMenuCount${dd.MENUCODE}' style='cursor: pointer;'><img	src='${path}/resources/images/owner/icons/deleteIcon.png' width=16px; /></a> ${dd.MENUPRICE}원</li>
			<li	style='list-style: none; margin-right: 1em; text-align: right; padding-top: 5px;'>
				<span id='countUpdate${dd.MENUCODE}'>${dd.MENUCOUNT} 개</span><input type="hidden" id="deleteBtn${dd.MENUCODE }" value="${dd.MENUCODE }"/>
			</li>
		</ul>
		<hr>
	</div>
<script>
$(document).ready(function() {
	$("#deleteMenuCount${dd.MENUCODE}").click(function() {
		var menuCode = $("#deleteBtn${dd.MENUCODE}").val();
		var businessCode = ${maps.businessCode};
		$.ajax({
			type : "POST",
			url : "${path}/customer/deleteMenuCount.do",
			data : {"menuCode" : menuCode},
			dataType : "JSON",
			success : function(data) {
				$('#deletedd'+menuCode).html("");
				$.ajax({
					type : "POST",
					url : "${path}/customer/wishResult.do?businessCode="+businessCode,
					dataType : "html",
					success : function(data) {
					$('#plusMenuPrice_result').html(data);
					}
				});
			}
		});
	 });
});
</script>
</c:forEach>
