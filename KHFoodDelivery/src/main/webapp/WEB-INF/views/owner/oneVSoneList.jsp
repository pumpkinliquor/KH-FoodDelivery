<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<section>
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
<div class="container">
	<div class="search">
   		<div class="row">
   			<div class="col-md-12">
   				<form class="form-inline">
   				<div class="form-group" style="padding-left: 0px;">
   				<select name="qnaCategory" style="margin-right:5px;">
   					<option value="결제">결제</option>
   					<option value="회원">회원</option>
   					<option value="주문">주문</option>
   					<option value="포인트">포인트</option>
   					<option value="리뷰">리뷰</option>
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
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="20" varStatus="vs">
						<tr style="cursor:pointer;" onclick="location.href='${path}/owner/oneVSoneList.do'">
							<td>${vs.count }</td>
							<td>hwang3324</td>
							<td><a href="#">어떻게 수정 요청하나요?</a></td>
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