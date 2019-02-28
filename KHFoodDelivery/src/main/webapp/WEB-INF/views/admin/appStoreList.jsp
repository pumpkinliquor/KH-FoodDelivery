<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	thead#tableHead {
		background-color: #4D4D4D;
		color: rgba(255, 255, 255, .5);
	}
</style>

<script>
	function fn_modal(){
		$('#storeModal').modal();
	}
	function fn_appConfirm(no){
		location.href="${path}/admin/confirmApp.do?no="+no;
	}
</script>

<section>
	<div class="container">	
		<div>
			<h4>입점 신청 현황</h4>
		</div>
		<div>
			<table class="table table-hover">
				<thead id="tableHead">
					<tr>			
						<th>업종</th>
						<th>점포명</th>
						<th>점주명</th>
						<th>주소</th>
						<th>입점 신청일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="5">
						<tr>
							<td onclick="fn_modal()">치킨</td>
							<td onclick="fn_modal()">배민</td>
							<td onclick="fn_modal()">주홍범</td>
							<td onclick="fn_modal()">서울특별시 강남구 역삼동</td>
							<td onclick="fn_modal()">2019-02-26</td> 
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





<!-- 모달 구현 -->
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
						<th>점포명</th>
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
					<tr>
						<td colspan='2' align="center">
							<button type="button" class="btn btn-outline-success" onclick="fn_appConfirm()">승인</button>
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal">거절</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>  
	</div>
</div>
