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
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">나(사장님)의 문의내역</h2>
	</div>
	<div class="QnaWriteBtn" style="text-align:right; padding-bottom:5px;">
		<button onclick="location.href='${path}/owner/oneVSoneList.do'" id="QnaListBtn" class="btn btn-outline-success">문의게시판</button>
		<button onclick="location.href='${path}/owner/oneVSoneForm.do'" id="QnaWriteBtn" class="btn btn-outline-success">1:1문의하기</button>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width=10%>번호</th>
						<th width=65%>제목</th>
						<th width=15%>날짜</th>
						<th width=10%>분류</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="my" items="${myQnaList}" varStatus="vs">
						<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneView.do?qnaCode=${my.QNACODE }'">
							<td>${vs.count }</td>
							<td><a href="${path }/owner/oneVSoneView.do?qnaCode=${my.QNACODE}">${my.QNATITLE }</a></td>
							<td>${my.WRITEDATE }</td>
							<td>${my.QNACATEGORY }
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				${pageBar}
			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>