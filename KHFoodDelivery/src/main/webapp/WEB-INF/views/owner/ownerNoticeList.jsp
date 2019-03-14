<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:if test="${sessionScope.ownerId!='admin' }">
	<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
</c:if>
<c:if test="${sessionScope.ownerId=='admin' }">
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
</c:if>

<style>
 #topTable {
	background-color: #4D4D4D;
	color: rgba(255, 255, 255, .5);
}

#noticeListCount {
	float: left;
}

#noticeListCount2 {
	color: red;
	float: left;
}

.th_noticeTitle {
	width: 700px;
}

.pageBar_div1 {
	text-align: center;
}

#ownerNoticeDiv {
	padding-bottom: 5%;
} 
</style>

<section>


	<div class="container" id="ownerNoticeDiv">

		<c:if test="${sessionScope.ownerId=='admin' }">
			<div>
				<h4>사장님 공지사항</h4>
			</div>
		</c:if>

		<c:if test="${sessionScope.ownerId!='admin' }">
			<div style="text-align: center; margin-bottom: 5em;">
				<h2 style="font-weight: bold;">사장님 공지사항</h2>
			</div>
		</c:if>




		<table class="table table-hover board">

			<thead id="noticeThead">
				<tr id="topTable">
					<th>번호</th>
					<th class="th_noticeTitle">제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="on" items="${list }">
					<tr style="cursor: pointer;"
						onclick="location.href='${path}/owner/ownerNoticeList.do'">
						<td>${on.OWNERNOTICENUM }</td>
						<td id="noticeTitleId"><a
							href="${path }/owner/ownerNoticeView.do?ownerNoticeNum=${on.OWNERNOTICENUM}">${on.OWNERNOTICETITLE }</a></td>
						<td>${on.OWNERWRITEDATE }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${sessionScope.ownerId=='admin' }">
			<button type="button" class="btn btn-light float-right"
				onclick="location.href='${path}/owner/ownerNoticeForm.do'">글쓰기</button>
		</c:if>

	</div>
	<div class="paging">${pageBar}</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>