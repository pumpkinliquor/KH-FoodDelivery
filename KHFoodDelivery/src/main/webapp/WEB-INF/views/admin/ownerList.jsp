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
					<td class="pnt" onclick="fn_ownListmodal()">${o.OWNERNUM}</td>
					<td class="pnt" onclick="fn_ownListmodal()">${o.OWNERID}</td>
					<td class="pnt" onclick="fn_ownListmodal()">${o.STORENAME}</td>
					<td class="pnt" onclick="fn_ownListmodal()">${o.STORECATEGORY}</td>
					<td class="pnt" onclick="fn_ownListmodal()">${o.OWNERENROLLDATE}</td>
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
	function fn_memListmodal() {
		$('#ownListModal').modal();

	};

	function fn_memListDel() {
		$('#ownListDel').modal();
	};
</script>

<div class="modal" id="ownListDel" role="dialog">
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
</div>





<div class="modal" id="memListModal" role="dialog">
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
						<th>주소</th>
						<td>강남</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>951114</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>01011111111</td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td>2019.02.27</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>여</td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>1114점</td>
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