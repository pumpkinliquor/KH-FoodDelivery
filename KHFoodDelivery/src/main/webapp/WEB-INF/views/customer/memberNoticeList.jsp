<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cstyle.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>

</style>
<section>
	<div class="container" id="memberNoticeDiv">
		<div>
			<h4>회원 공지사항</h4>
		</div>
		<div class="col-md-12">
			<table class="table table-hover notice">

				<thead id="noticeThead">
					<tr id="topTable">
						<th width="20%">번호</th>
						<th width="60%">제목</th>
						<th width="20%">날짜</th>
					</tr>
				</thead>
				<c:forEach items="${mnList }" var="mn">
					<tbody>
						<tr>
							<td>${mn.noticeNum }</td>
							<td id="noticeTitleTd">
								<a href="${path}/admin/memberNoticeView.do?noticeNum=${mn.noticeNum}">${mn.noticeTitle}</a>
							</td>
							<td>${mn.formatWriteDate}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
		<div class="paging">${pageBar}</div>
	</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>