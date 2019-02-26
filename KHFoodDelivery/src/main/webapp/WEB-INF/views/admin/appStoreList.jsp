<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<div class="container">	
	<div>
		<h4>입점 신청 현황</h4>
	</div>
	<div>
		<table class="table">
			<tr>			
				<th>업종</th>
				<th>가게명</th>
				<th>점주명</th>
				<th>주소</th>
				<th>입점 신청일</th>
			</tr>
			<c:forEach begin="1" end="5">
				<tr>
					<td onclick="fn_modal()">치킨</td>
					<td>배민</td>
					<td>주홍범</td>
					<td>서울특별시 강남구 역삼동</td>
					<td>2019-02-26</td> 
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script>
	function fn_modal(){
		$('#storeModal').modal();
	}
</script>

<div class="modal" id="storeModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">가게 정보</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<th>업종</th>
						<td>치킨</td>						
					</tr>
					<tr>
						<th>가게명</th>
						<td>배민</td>
					</tr>
					<tr>
						<th>점주명</th>
						<td>주홍범</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>010-1234-1234</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>서울특별시 강남구 역삼동</td>
					</tr>
					<tr>
						<th>입점 신청일</th>
						<td>2019-02-26</td>
					</tr>	
					<tr>
						<th>가게 소개</th>
						<td>ㅎㅎ</td>
						<!-- <textarea>ㅎㅎ</textarea> -->
					</tr>									
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal">승인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>  
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>