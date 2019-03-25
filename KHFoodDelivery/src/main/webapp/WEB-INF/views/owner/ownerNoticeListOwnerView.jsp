<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

	<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>


<style>
 #topTable {
	background-color: rgba(61, 58, 129, 0.986);
	color: white;
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

	
			<div style="text-align: center; margin-bottom: 5em;">
				<h2 style="font-weight: bold;">사장님 공지사항</h2>
			</div>
	




		<table class="table table-hover board">

			<thead id="noticeThead">
				<tr id="topTable">
					<th width="20%">번호</th>
					<th width="60%" class="th_noticeTitle">제목</th>
					<th width="20%">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="on" items="${list }">
					<tr style="cursor: pointer;"
						onclick="location.href='${path}/owner/ownerNoticeViewOwnerView.do?ownerNoticeNum=${on.OWNERNOTICENUM}'">
						<td>${on.OWNERNOTICENUM }</td>
						<td id="noticeTitleId"><a
							href="${path }/owner/ownerNoticeViewOwnerView.do?ownerNoticeNum=${on.OWNERNOTICENUM}">${on.OWNERNOTICETITLE }</a></td>
						<td>${on.OWNERWRITEDATE }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	

	</div>
	<div class="paging">${pageBar}</div>
</section>

<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>