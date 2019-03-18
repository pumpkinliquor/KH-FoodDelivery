<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Astyle.css" />

<c:if test="${sessionScope.logined!='admin' }">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</c:if>
<c:if test="${sessionScope.logined=='admin' }">
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
</c:if>

<section>
	<div class="container" id="memberNoticeDiv">
		<c:if test="${sessionScope.logined=='admin' }">
		<div>
			<h4>회원 공지사항</h4>
		</div>
		</c:if>
		<c:if test="${sessionScope.logined!='admin' }">
			<div style="text-align: center; margin-bottom: 5em;">
				<h2 style="font-weight: bold;">회원 공지사항</h2>
			</div>
		</c:if>
		
		<div class="col-md-12">
			<table class="table table-hover notice">

				<thead id="noticeThead">
					<tr id="topTable">
						<th width="20%">번호</th>
						<th width="60%">제목</th>
						<th width="20%">날짜</th>

					</tr>
				</thead>
				<c:forEach items="${list }" var="mn">
					<tbody>
						<tr>
							<td>${mn.NOTICENUM }</td>
							<td id="noticeTitleTd"><a
								href="${path}/admin/memberNoticeView.do?noticeNum=${mn.NOTICENUM}">${mn.NOTICETITLE}</a></td>
							<td>${mn.WRITEDATE}</td>
						</tr>

					</tbody>
				</c:forEach>
			</table>

				<c:if test="${sessionScope.logined=='admin' }">
					<button type="button" class="btn btn-light float-right"
						onclick="location.href='${path}/admin/memberNoticeForm.do'">글쓰기</button>
				</c:if>

			

		</div>
	</div>
		<div class="paging">${pageBar}</div>
	</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>