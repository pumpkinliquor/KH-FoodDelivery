<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
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
</style>

<section>


	<div class="container">
		<div>
			<h4>공지사항</h4>
		</div>

		<table class="table table-hover board">

			<thead id="noticeThead">
				<tr id="topTable">
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>공지</td>
					<td><a href="#">첫공지사항!</a></td>
					<td>19.02.23</td>
				</tr>

				<tr>
					<td>공지</td>
					<td>첫공지사항!</td>
					<td>19.02.23</td>
				</tr>


			</tbody>
		</table>



		<button type="button" class="btn btn-light float-right"
			onclick="location.href='${path}/notice/noticeForm.do'">글쓰기</button>


		<!-- </div>

		<div class="col-md-2"></div> -->
	</div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>