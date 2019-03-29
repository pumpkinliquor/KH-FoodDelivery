<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }	
	div#storeList{ margin-top: 15px; }
	thead#tableHead{color: rgba(255, 255, 255, .5); background-color: #4D4D4D;}
	.pnt{ cursor: pointer; }
	table#storeTable{ table-layout: fixed; word-wrap: break-word; }
	table#storeTable th, table#storeTable td{ text-align: center; vertical-align: middle; }
	div#store-category{display: inline;}
	select{display: inline;}
	div#store-search{display: inline; float: right;}	
	input[type=checkbox], input[type=radio] {display: none; }	
</style>

<script> 
	function fn_modal(num){		
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
</script>

<section>
	<div class="container">			
		
		<form class="form-controll navbar-right" role="search" action="${path }/admin/searchStore.do" method="post">
			<div class="row">
				<div class="col-sm-7">
					<h4 id="titleText">입점 리스트</h4>
				</div>
				<div class="col-sm-1">
					<div id="store-category" class="form-group">
						<select class="form-control" name="category" style="width: auto">
							<option value="전체">전체</option>
							<option value="돈까스/일식">돈까스/일식</option>
							<option value="프랜차이즈">프랜차이즈</option>
							<option value="치킨">치킨</option>
							<option value="피자">피자</option>
							<option value="중국집">중국집</option>
							<option value="한식">한식</option>
							<option value="족발/보쌈">족발/보쌈</option>
							<option value="분식">분식</option>
							<option value="디저트">디저트</option>
						</select>	
					</div>	 
				</div>
				<div class="col-sm-4">
					<div class="input-group" id="store-search" style="width: 89%">			
						<div class="form-group">						
							<div class="input-group">														
								<input type="text" class="form-control" name="keyword" id="keyword" autocomplete="off" placeholder="점포명 혹은 주소 입력"/>
								<input type="hidden" name="isFirst" value="1"/>
								<span class="input-group-btn">
									<input type="submit" class="btn btn-outline-dark" id="searchBar" value="검색"/>
								</span>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</form>

		<!-- 입점 리스트 -->		
		<div id="storeList">
			<table class="table table-hover" id="storeTable">
				<thead id="tableHead">
					<tr>	
						<th>업종</th>	
						<th>점포명</th>
						<th>점주명</th>
						<th style="width: 50%">주소</th>	
						<th>입점 신청일</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr class="pnt" onclick="fn_modal(${list.businessCode})">
							<td><c:out value="${list.storeCategory }"/></td>
							<td><c:out value="${list.storeName }"/></td>
							<td><c:out value="${list.businessName }"/></td>
							<td><c:out value="${list.storeAddress }"/></td>
							<td><c:out value="${list.formatAppDate }"/></td>							
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">
			${pageBar}
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
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>  
	</div>
</div>