<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Astyle.css" />
<script>
	$(document).ready(function() {
		$("#ownerListTable #owncheckall").click(function() {
			if ($("#ownerListTable #owncheckall").is(':checked')) {
				$("#ownerListTable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#ownerListTable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
</script>

<div class="container">
	<div id="ownerList-title">
		<h4 id="onwerListTitle">리스트</h4>
		<div class="btn-group" id="btn-category">
			<button class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				목록<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${path }/admin/memberList.do">회원</a></li>
				<li><a href="#">사장님</a></li>
				<li class="divider"></li>
			</ul>
		</div>
	</div>
	<div id="ownerList">
		<table class="table table-hover" id="ownerListTable">
			<thead id="tableHead">
				<tr>
					<th><input type="checkbox" id="owncheckall" /></th>
					<th>사장님 번호</th>
					<th>아이디</th>
					<th>가게 이름</th>
					<th>가게 카테고리</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			
				 <c:forEach items="${list }"  var="o" >
				 <tbody>
				<tr>
					<td><input type="checkbox" class="checkthis" /></td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.BUSINESSCODE}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.OWNERID}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.STORENAME}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.STORECATEGORY}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.BUSINESSNAME}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<button id="ownerDelBtn" onclick="fn_ownListDel();">
			<img src="${path}/resources/images/admin/deleteBtn.png"
				class="ownerListDelImg">
		</button>

	</div>
</div>



<script>
	function fn_ownListmodal(businessCode) {
		console.log(businessCode);
		$.ajax({
			url:"${path}/admin/ownerOne.do",			
			dataType:"json",
			data:{"businessCode":businessCode},
			success:function(data)
			{
				console.log(data+"gg");
				
				$('#ownBusinessName').val(data.BUSINESSNAME); 
	/* 			$('#ownEmail').val(data.OWNEREMAIL);
				$('#ownPhone').val(data.OWNERPHONE); */
				$('#ownBusinessPhone').val(data.BUSINESSPHONE);
				$('#ownStorePhone').val(data.STOREPHONE);
				$('#ownStoreAddress').val(data.STOREADDRESS); 
				$('#ownBusinessNum').val(data.BUSINESSNUM);
				$('#ownListModal').modal();
			}
		});
		
		

	}

	/* function fn_memListDel() {
		$('#ownListDel').modal();
	}; */
</script>

<!-- <div class="modal" id="ownListDel" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<table class="table">
					<tr>

						<td>정말 삭제하시겠습니까?</td>
					</tr>
					<tr>
						<td colspan='2' align="center">
							<button type="button" class="btn btn-outline-success"
								onclick="fn_ownListDelCan()">삭제</button>
							<button type="button" class="btn btn-outline-danger"
								data-dismiss="modal">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div> -->

<style>
 .ownModal{
 border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; width:350px;}
 
</style>



<div class="modal" id="ownListModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원 정보</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<th>프로필</th>
						<td><img src="${path }/resources/images/place.png"
							id="memListProfile"></td>

					</tr>
					<tr>
						<th>사업주명</th>
						<td><input type="text" id="ownBusinessName" class="ownModal" readonly="readonly"></td>
					</tr>
					<tr>
						<th>사업자연락처</th>
						<td><input type="text" id="ownBusinessPhone" class="ownModal" readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>가게연락처</th>
						<td><input type="text" id="ownStorePhone" class="ownModal" readonly="readonly"></td>
					</tr>
					<tr>
						<th>가게주소</th>
						<td><textarea rows="3" cols="10" id="ownStoreAddress" class="ownModal" readonly="readonly"></textarea></td>
					</tr>
					 <tr>
						<th>사업자번호</th>
						<td><input type="text" id="ownBusinessNum" class="ownModal" readonly="readonly"></td>
					</tr>
					

				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>