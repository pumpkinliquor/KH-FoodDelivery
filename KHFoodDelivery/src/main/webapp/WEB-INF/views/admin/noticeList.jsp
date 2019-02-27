<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
</head>
<style>
#topTable {
	background-color: rgba(253, 190, 138, 0.945);
	color: white;
}

#noticeListCount {
	float: left;
}

#noticeListCount2 {
	color: red;
	float: left;
}
</style>

<body>



	<div class="container">
		<!-- <div class="col-md-2"></div>
		<div class="col-md-8"> -->
			<h5 id="h3board">공지사항</h5>
			<h6 id="h5_board">
				<a href="">메인화면></a> <a href="#">공지사항</a>
			</h6>
			<hr>


			<p id="noticeListCount">글 수</p>
			&nbsp;&nbsp;
			<p id="noticeListCount2">2</p>
			<table class="table table-hover board">

				<thead id="noticeThead">
					<tr id="topTable">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>공지</td>
						<td><a href="#">첫공지사항!</a></td>
						<td>관리자</td>
						<td>19.02.23</td>
						<td>12345</td>
					</tr>

					<tr>
						<td>공지</td>
						<td>첫공지사항!</td>
						<td>관리자</td>
						<td>19.02.23</td>
						<td>12345</td>
					</tr>


				</tbody>
			</table>
			


			<button type="button" class="btn btn-light float-right">글쓰기</button>


		<!-- </div>

		<div class="col-md-2"></div> -->
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>