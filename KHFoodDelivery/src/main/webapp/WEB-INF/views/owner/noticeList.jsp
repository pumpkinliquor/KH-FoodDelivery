<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

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

.th_noticeTitle{
	width:700px;
}

.pageBar_div1{
	text-align: center;
}

</style>

<section>


	<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">사장님 공지사항</h2>
	</div>

		<table class="table table-hover board">

			<thead id="noticeThead">
				<tr id="topTable">
					<th>번호</th>
					<th class="th_noticeTitle">제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="owner" items="${ownerNoticeList }" varStatus="vs">
				<tr style="cursor:pointer;" onclick="location.href='${path}/owner/noticeList.do'">
					<td>${vs.count }</td>
					<td><a href="#">${owner.NOTICETITLE }</a></td>
					<td>${owner.WRITEDATE }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 pageBar_div1">페이지바</div>
		<div class="col-sm-3"></div>
		</div>
		
		<button type="button" class="btn btn-light float-right"
			onclick="location.href='${path}/notice/noticeForm.do'">글쓰기</button>


		<!-- </div>

		<div class="col-md-2"></div> -->
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>