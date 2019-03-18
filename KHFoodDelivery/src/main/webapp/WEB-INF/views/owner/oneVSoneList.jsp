<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*, java.text.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
.search{
	float:right;
	padding-bottom:1em;
}
#keywordBtn{
	margin-top:10px;
   	width:4em;
}
#keyword{
	margin-top:10px;
	width:13em;
}
</style>
<section>
<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">사장님 1:1 문의게시판</h2>
	</div>
	<div style="text-align:center;">
		<span>총 <span style="color:red; font-weight:bold; font-size:20px;">${qnaCount }</span>건의 게시물이 있습니다.</span>
	</div>
	<div class="btn btn-success allQnaBtn" onclick="location.href='${path}/owner/oneVSoneList.do'">전체보기</div>
	<div class="btn btn-primary writeQnaBtn" onclick="location.href='${path}/owner/oneVSoneForm.do'">문의하기</div>
	<div class="search">
   		<div class="row">
   			<div class="col-md-12">
   				<form class="form-inline" action="${path }/owner/qnaSearch.do" method="post">
   				<div class="form-group" style="padding-left: 0px;">
   				<select name="qnaCategory" style="margin-right:5px;">
   					<option value="결제"<c:if test="${'결제' eq param.qnaCategory }"> selected</c:if>>결제</option>
   					<option value="회원"<c:if test="${'회원' eq param.qnaCategory }"> selected</c:if>>회원</option>
   					<option value="주문"<c:if test="${'주문' eq param.qnaCategory }"> selected</c:if>>주문</option>
   					<option value="포인트"<c:if test="${'포인트' eq param.qnaCategory }"> selected</c:if>>포인트</option>
   					<option value="리뷰"<c:if test="${'리뷰' eq param.qnaCategory }"> selected</c:if>>리뷰</option>
   				</select>
				<input type="search" style="margin-right: 5px;" placeholder="제목을 입력하세요." class="form-control" id="keyword" name="keyword" value="${param.keyword!=null?param.keyword:''}"/>
				<input type="submit" class="btn btn-outline-primary" id="keywordBtn" value="검색"/>
				</div>
				</form>
   			</div>
   		</div>
   	</div>
	<div class="row" style="clear:both;">
		<div class="col-md-12">
			<c:if test="${not empty oneVSoneList }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width=10%>번호</th>
							<th width=10%>작성자</th>
							<th width=50%>제목</th>
							<th width=15%>날짜</th>
							<th width=10%>분류</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="one" items="${oneVSoneList }" varStatus="vs">
							<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneView.do?qnaCode=${one.QNACODE}'">
								<td>${vs.count }</td>
								<td>${one.OWNERID }</td>
								<td><a href="${path }/owner/oneVSoneView.do?qnaCode=${one.QNACODE}">${one.QNATITLE }</a></td>
								<td>${one.WRITEDATE }</td>
								<td>${one.QNACATEGORY }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					${pageBar}
				</div>
			</c:if>
			<c:if test="${empty oneVSoneList }">
				<h3 style="text-align:center; margin-top:5em;">목록 결과가 없습니다.</h3>
			</c:if>
		</div>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>