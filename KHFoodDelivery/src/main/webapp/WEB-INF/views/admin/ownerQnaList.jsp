<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }
	div#btn-category{ float: right; }
	div#qnaList{ margin-top: 15px; }
	thead#tableHead{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); }
	.pnt{ cursor: pointer; }
	table#qnaTable{ table-layout: fixed; word-wrap: break-word; }
	table#qnaTable th, table#qnaTable td{ text-align: center; vertical-align: middle; }	
</style>

<section>
	<div class="container">	
		<div id="qna-title">
			<h4 id="titleText">사장님 문의 내역</h4>
			<div class="btn-group" id="btn-category">
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					전체<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">결제</a></li>
				    <li><a href="#">손님</a></li>
				    <li><a href="#">주문</a></li>
				    <li><a href="#">포인트</a></li>				    
				    <li><a href="#">리뷰</a></li>
	  			</ul>
			</div>
		</div>
		<div id="qnaList">
			<table class="table table-hover" id="qnaTable">
				<thead id="tableHead">
					<tr>	
						<th>카테고리</th>	
						<th style="width: 60%">제목</th>
						<th>작성자</th>
						<th>날짜</th>	
						<th>답변여부</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="5">
						<tr class="pnt" onclick="fn_qnaView()">
							<td>결제</td>
							<td>안녕</td>
							<td>주홍범</td>
							<td>2019-02-26</td> 
							<td><img src="${path }/resources/images/admin/complete.png" width="30px" height="30px"/></td>
							<%-- <td><img src="${path }/resources/images/admin/incomplete.png" width="30px" height="30px"/></td> --%>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>