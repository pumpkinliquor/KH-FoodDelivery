<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/Astyle.css" />
<script>
	$(function(){
		$("#allCheck").click(function(){
			if ( $("#allCheck").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);﻿
			}
			else{
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	});
</script>

<section>
<div class="container">
	<div id="memberList-title">
		<h4 id="memberListTitle">회원 리스트</h4>
		<div class="btn-group" id="btn-category">
			<button class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				목록<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${path }/admin/memberList.do">회원</a></li>
				<li><a href="${path}/admin/ownerList.do">사장님</a></li>
				<li class="divider"></li>
			</ul>
		</div>
	</div>

	<div id="memberList">
	
		<form action="${path }/admin/memDel.do" id="memDel" method="post">
			<table class="table table-hover" id="memberListTable">
				<thead id="tableHead">
					<tr>
						<th><input type="checkbox" id="allCheck"
							 /></th>
						<th>회원 번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>주소</th>
					</tr>
				</thead>

				<c:forEach items="${list }" var="m">

					<tbody>
						<tr>
							<td><input type="checkbox" name="rowCheck"
								value="${m.MEMBERNUM }" /></td>
							<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')"
								name="memberNum">${m.MEMBERNUM}</td>
							<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')">${m.MEMBERID}</td>
							<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')">${m.MEMBERNAME}</td>
							<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')">${m.MEMBEREMAIL}</td>
							<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')">${m.MEMBERADDRESS}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<button type="submit" id="memListDelBtn">
				<img src="${path}/resources/images/admin/deleteBtn.png"
					class="memberListDelImg">
			</button>
				
		</form>
	</div>
	<div class="paging">
	${pageBar}
	</div>
</div>
</section>


<script>
	function fn_memListmodal(memberNum) {

		

				$.ajax({
					url : "${path}/admin/memberOne.do", //요청보낼 서버 url주소
					dataType : "json",
					data : {
						"memberNum" : memberNum
					}, //요청과 함께 보낼 데이터
					success : function(data) {
						$('#memProfile').empty().append('<img src="${path}/resources/upload/member/profile/'
								+ data.PROFILEIMAGE
								+ '" style="margin-left: auto; margin-right: auto; display: block; width:70px; height:70px; border-radius:100%;"/>');
						
						$('#memNickName').val(data.NICKNAME);
						$('#memAddress').val(data.MEMBERADDRESS);
						$('#memBirth').val(data.MEMBERBIRTH);
						$('#memPhone').val(data.MEMBERPHONE);
						$('#memEnrolldate').val(data.MEMBERENROLLDATE);
						$('#memGender').val(data.MEMBERGENDER);
						

						//성공했을때 모달띄워줌
						$('#memListModal').modal();
					}

				});
	}
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"></jsp:include>




<!------------- 모달------------->

<style>
#memListModal {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;;
}

#memAddress {
	resize: none;
}

.form-control {
	background-color: #e9ecef;
}
</style>


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
						<td id="memProfile"></td>


					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" id="memNickName" class="form-control"
							readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>생년월일</th>
						<td><input type="text" id="memBirth" class="form-control"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="memPhone" class="form-control"
							readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>성별</th>
						<td><input type="text" id="memGender" class="form-control"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td><input type="text" id="memEnrolldate"
							class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><textarea rows="3" cols="10" id="memAddress"
								class="form-control" readonly="readonly"></textarea></td>
					</tr>

				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
