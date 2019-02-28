<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>
<div class="container">
	<div class="QnaWriteBtn" style="text-align:right; padding-bottom:5px;">
		<button onclick="location.href='${path}/owner/oneVSoneList.do'" id="QnaListBtn" class="btn btn-outline-success">문의게시판</button>
		<button onclick="location.href='${path}/owner/oneVSoneQ.do'" id="QnaWriteBtn" class="btn btn-outline-success">1:1문의하기</button>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="10" varStatus="vs">
						<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneView.do'">
							<td>${vs.count }</td>
							<td><a href="${path }/owner/oneVSoneView.do">어떻게 수정 요청하나요?</a></td>
							<td>2019-02-27</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>