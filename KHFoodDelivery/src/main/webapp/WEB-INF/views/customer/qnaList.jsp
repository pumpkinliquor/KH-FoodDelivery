<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }	
	div#qnaList{ margin-top: 15px; }
	thead#tableHead{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); }
	.pnt{ cursor: pointer; }
	table#qnaTable{ table-layout: fixed; word-wrap: break-word; }
	table#qnaTable th, table#qnaTable td{ text-align: center; vertical-align: middle; }

	select{display: inline; margin-top: 20px;}
	div#qna-sort{ float: left; margin-top: 20px;}
	table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	
</style>

<script>	
	function fn_qnaView(no){
		location.href="${path}/admin/memberQnaView.do?no="+no;		
	}		
</script>

<section>
<div class="row">
<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}"  class="list-group-item list-group-item-action active">회원정보변경</a>
              <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="#" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}"  class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
	<div class="container">	
		<h4 id="titleText"> 문의 내역 </h4>
		
		<div id="qnaList">
			<table class="table table-hover" id="qnaTable">
				<thead id="tableHead">
					<tr>	
						<th>카테고리</th>	
						<th style="width: 60%">제목</th>
						<th>작성자</th>
						<th>날짜</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qnaList}" var="ql">
						<tr class="pnt" onclick="fn_qnaView(${ql.qnaCode})">
							<td><c:out value="${ql.qnaCategory }"/></td>
							<td><c:out value="${ql.qnaTitle }"/></td>
							<td><c:out value="${ql.memberId }"/></td>
							<td><c:out value="${ql.formatWriteDate}"/></td>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">
			${pageBar}
		</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>