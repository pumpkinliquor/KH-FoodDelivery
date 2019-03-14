<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ page import="java.util.List, com.kh.food.owner.store.model.vo.Store" %> --%>
<%-- <%
	List<Store> appStoreList = (List)request.getAttribute("appStoreList");  
%> --%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	thead#tableHead {
		background-color: #4D4D4D;
		color: rgba(255, 255, 255, .5);
	}
	.pnt { cursor: pointer; }
	tr#btnGroup td{
		margin-top: 15px;
	}
	
</style>

<script> 
	function fn_modal(num){		
		console.log(num);
		$.ajax({
			type: "POST",
			url: "${path}/admin/selectAppStore.do?no=" + num,
			data: JSON,
			success: function(data){
				$('#storeModal').modal();
				$('#mdCategory').val(data.storeCategory);
				$('#mdName').val(data.storeName)
				$('#mdOwner').val(data.businessName);
				$('#mdPhone').val(data.storePhone);
				$('#mdAddress').val(data.storeAddress);
				$('#mdAppDate').val(data.formatAppDate);
				$('#mdProfile').val(data.storeProfile);
				$('#mdBsCode').val(data.businessCode);
				$('#mdImage').empty().append('<img src="${path}/resources/upload/owner/storeMainImage/'+data.storeImage+'" style="width:330px;"/>');
			}
		});
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
					<c:forEach items="${appStoreList}" var="store">
						<c:if test="${store.isConfirm eq 0}">
							<tr class="pnt" onclick="fn_modal(${store.businessCode})">
								<td>${store.storeCategory }</td>
								<td>${store.storeName }</td>
								<td>${store.businessName }</td>
								<td>${store.storeAddress }</td>
								<td>${store.formatAppDate }</td>
							</tr>
						</c:if>						
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
			<div class="modal-body" style="height: 1000px;">
				<table class="table">
					<tr>
						<th>업종</th>
						<td><input class="form-control" type="text" id="mdCategory" readonly/></td>						
					</tr>
					<tr>
						<th>점포명</th>
						<td><input class="form-control" type="text" id="mdName" readonly/></td>
					</tr>
					<tr>
						<th>점주명</th>
						<td><input class="form-control" type="text" id="mdOwner" readonly/></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input class="form-control" type="text" id="mdPhone" readonly/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input class="form-control" type="text" id="mdAddress" readonly/></td>
					</tr>
					<tr>
						<th>입점 신청일</th>
						<td><input class="form-control" type="text" id="mdAppDate" readonly/></td>
					</tr>	
					<tr>
						<th>가게 소개</th>					
						<td><textarea cols="10" rows="4" class="form-control" id="mdProfile" style="resize: none" readonly></textarea></td> 
					</tr>
					<tr>
						<th>업소이미지</th>
						<td id="mdImage"></td> 
					</tr>
					<tr id="btnGroup">
						<td colspan='2' align="center">
							<form action="${path}/admin/confirmApp.do" method="post">
								<input type="hidden" name="no" id="mdBsCode"/>
								<input type="submit" class="btn btn-outline-success" value="승인"/>
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">거절</button>
							</form>
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