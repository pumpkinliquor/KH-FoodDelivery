<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<style>
.pnt {
	cursor: pointer;
}

img#memListProfile {
	border-radius: 150px;
	width: 50px;
	height: 50px;
}

button#memListDelBtn {
	background-color: transparent;
	border-color: transparent;
}

img.memberListDelImg {
	width: 25px;
	height: 25px;
}

h4#memberListTitle {
	display: inline;
}

div#btn-category {
	float: right;
}

div#memberList {
	margin-top: 15px;
}

thead#tableHead {
	background-color: #4D4D4D;
	color: rgba(255, 255, 255, .5);
}
</style>

<script>
	$(document).ready(function() {
		$("#memberListTable #checkall").click(function() {
			if ($("#memberListTable #checkall").is(':checked')) {
				$("#memberListTable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#memberListTable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
</script>


<div class="container">
	<div id="memberList-title">
		<h4 id="memberListTitle">리스트</h4>
		<div class="btn-group" id="btn-category">
			<button class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				목록<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">회원</a></li>
				<li><a href="#">사장님</a></li>
				<li class="divider"></li>
			</ul>
		</div>
	</div>
	<div id="memberList">
		<table class="table table-hover" id="memberListTable">
			<thead id="tableHead">
				<tr>
					<th><input type="checkbox" id="checkall" /></th>
					<th>회원 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			
				 <c:forEach items="${list }"  var="m" >
				 <tbody>
				<tr>
					<td><input type="checkbox" class="checkthis" /></td>
					<td class="pnt" onclick="fn_memListmodal()">${m.MEMBERNUM}</td>
					<td class="pnt" onclick="fn_memListmodal()">${m.MEMBERID}</td>
					<td class="pnt" onclick="fn_memListmodal()">${m.MEMBERNAME}</td>
					<td class="pnt" onclick="fn_memListmodal()">${m.MEMBEREMAIL}</td>
					<td class="pnt" onclick="fn_memListmodal()">${m.MEMBERENROLLDATE}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<button id="memListDelBtn" onclick="fn_memListDel();">
			<img src="${path}/resources/images/admin/deleteBtn.png"
				class="memberListDelImg">
		</button>

	</div>
</div>



<script>
	function fn_memListmodal() {
		$('#memListModal').modal();

	};

	function fn_memListDel() {
		$('#memListDel').modal();
	};
</script>

<div class="modal" id="memListDel" role="dialog">
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
								onclick="fn_memListDelCan()">삭제</button>
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