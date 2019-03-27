<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }	
	div#reviewList{ margin-top: 15px; }
	thead#tableHead{ background-color: rgb(250, 163, 148); color: white; }
	.pnt{ cursor: pointer; }
	table#reviewTable{ table-layout: fixed; word-wrap: break-word; }
	table#reviewTable th, table#reviewTable td{ text-align: center; vertical-align: middle; }

	#activeOn{background-color: rgb(250, 163, 148); color:white;}
	#activeOff:hover{
		background-color: rgb(250, 163, 148);
		color:white;
	}
</style>

<script>	
	function fn_view(no) {
		location.href="${path}/member/reviewView.do?no="+no
	}
	
</script>

<section>
	<div class="container"> 			
		<div class="row">
		
			<div class="col-md-3 ">
				<div class="list-group ">
					<a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}" id="activeOff" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
					<a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">회원정보변경</a>
					<a href="${path }/member/markList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">즐겨찾는매장</a>
					<a href="${path }/member/myReview.do?memberId=${sessionScope.logined}" id="activeOn" class="list-group-item list-group-item-action">리뷰 관리</a>
					<a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">나의 문의내역</a>              
				</div> 
			</div>
			
			<div class="col-md-9">	
				<h4 id="titleText">${sessionScope.logined}님 리뷰 내역 </h4>		
				<div id="reviewList">
					<table class="table table-hover" id="reviewTable">
						<thead id="tableHead">
							<tr>	
								<th>가게이름</th>	
								<th>내용</th>						
								<th>날짜</th>	
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ review}" var="r">
								<tr style="cursor: pointer;" onclick="fn_view(${r.REVIEWNUM})">
									<td><c:out value="${r.STORENAME }"/></td>
									<td><c:out value="${r.REVIEWCONTEXT }"/></td>
									<td><c:out value="${r.WRITEDATE }"/></td>
								</tr>
							</c:forEach>					
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>