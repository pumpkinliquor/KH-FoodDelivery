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
	thead#tableHead{
		background-color: #4D4D4D;
		color: rgba(255, 255, 255, .5);
	}
	.pnt{
		cursor: pointer;
	}
</style>

<section>
	<div class="container">	
		<div id="qna-title">
			<h4 id="titleText">»çÀå´Ô ¹®ÀÇ ³»¿ª</h4>
			<div class="btn-group" id="btn-category">
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					Ä«Å×°í¸®<span class="caret"></span>
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
			<table class="table table-hover">
				<thead id="tableHead">
					<tr>	
						<th>¹øÈ£</th>
						<th>Á¦¸ñ</th>
						<th>¾ÆÀÌµð</th>
						<th>³¯Â¥</th>
						<th>´äº¯ ¿©ºÎ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="5">
						<tr class="pnt" onclick="fn_qnaView()">
							<td>1</td>
							<td>¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç¾È³ç</td>
							<td>ÁÖÈ«¹ü</td>
							<td>2019-02-26</td>
							<td>´äº¯ ¿Ï·á</td> 
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>