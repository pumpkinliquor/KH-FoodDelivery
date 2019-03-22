<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	a {color: black;}
</style>

<script> 
	function fn_modal(num){		
		$.ajax({
			type: "POST",
			url: "${path}/admin/selectAppStore.do?no=" + num,
			data: JSON,
			success: function(data){
				console.log(data);
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
		<div class="row">
			<div class="col-sm-6">
				<h4 style="display: inline">입점 승인해주세요!</h4>
			</div>
			<div class="col-sm-6">
				<a href="${path }/admin/appStoreList.do" style="float: right">더 보기</a>
			</div>
			<table class="table table-hover" style="margin-top: 10px">
				<tr>
					<th>업종</th>
					<th>점포명</th>
					<th>점주명</th>
					<th>주소</th>					
				</tr>
				<c:forEach begin="0" end="2" items="${storeList }" var="store">
					<tr style="cursor: pointer" onclick="fn_modal(${store.businessCode})">
						<td><c:out value="${store.storeCategory }"/></td>
						<td><c:out value="${store.storeName }"/></td>
						<td><c:out value="${store.businessName }"/></td>
						<td><c:out value="${store.storeAddress }"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		
		<div class="row" style="margin-top: 50px">
			<div class="col-sm-6">
				<h4 style="display: inline">답변해주세요 - 회원</h4>
				<a href="${path }/admin/memberQnaList.do" style="float: right">더 보기</a>
				<table class="table table-hover" style="margin-top: 10px" >
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					<c:forEach begin="0" end="2" items="${mqList }" var="mq">
						<tr style="cursor: pointer" onclick="location.href='${path}/admin/memberQnaView.do?no=${mq.qnaCode }'">
							<c:if test="${mq.isRe eq 0 }">
								<td><c:out value="${mq.qnaCategory }"/></td>
								<td><c:out value="${mq.qnaTitle }"/></td>
								<td><c:out value="${mq.memberId }"/></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-6">
				<h4 style="display: inline">답변해주세요 - 사장님</h4>
				<a href="${path }/admin/ownerQnaList.do" style="float: right">더 보기</a>
				<table class="table table-hover" style="margin-top: 10px">
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					<c:forEach begin="0" end="2" items="${oqList }" var="oq">
						<tr style="cursor: pointer" onclick="location.href='${path}/admin/ownerQnaView.do?no=${oq.qnaCode }'">
							<c:if test="${oq.isRe eq 0 }">
								<td><c:out value="${oq.qnaCategory }"/></td>
								<td><c:out value="${oq.qnaTitle }"/></td>
								<td><c:out value="${oq.ownerId }"/></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>				
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"></jsp:include>



<!-- 모달 구현 -->
<div class="modal" id="storeModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">가게 정보</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body" style="height: auto;">
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