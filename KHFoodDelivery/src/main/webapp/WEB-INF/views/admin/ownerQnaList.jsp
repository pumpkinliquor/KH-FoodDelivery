<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	h4#titleText{
		display: inline;
	}
	div#btn-category{
		float: right;
	}
	div#qnaList{
		margin-top: 15px;
	}	
</style>

<div class="container">	
	<div id="qna-title">
		<h4 id="titleText">사장님 문의 내역</h4>
		<div class="btn-group" id="btn-category">
			<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				카테고리<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
			    <li><a href="#">Action</a></li>
			    <li><a href="#">Another action</a></li>
			    <li><a href="#">Something else here</a></li>
			    <li class="divider"></li>
			    <li><a href="#">Separated link</a></li>
  			</ul>
		</div>
	</div>
	<div id="qnaList">
		<table class="table">
			<tr>	
				<th>번호</th>	
				<th>제목</th>
				<th>아이디</th>
				<th>날짜</th>		
			</tr>
			<c:forEach begin="1" end="5">
				<tr>
					<td>1</td>
					<td>안녕</td>
					<td>주홍범</td>
					<td>2019-02-26</td> 
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>