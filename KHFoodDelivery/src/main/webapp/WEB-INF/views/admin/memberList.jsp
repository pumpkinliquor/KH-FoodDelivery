<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Astyle.css" />
<script>


	/* $(document).ready(function() {
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
	}); */
	
	/* $(#memListDelBtn).click(function){
		if(confirm("회원을 삭제하시겠습니까?")){
			$("input[name=checkList]:checked").each(function(){
			var 	
			})
			
		}
	}
 */
 
 
 /* 
 function allChk(obj){
	 var chkObj= document.getElementsByName("RowCheck");
	 var rowCnt= chkObj.length-1;
	 var check= obj.checked;
	 if(check){
		 for(var i=0; i<=rowCnt; i++){
			 chkObj[i].checked= true;
	 }
 }else{
	 for(var i=0; i<rowCnt; i++){
		 if(chkObj[i].type =="checkbox"){
			 chkObj[i].checked=false;
		 }
	 }
 }
	 
 };
 function fn_memListDel(){
	 var memberId="";
	 var memberChk= document.getElementsByName("RowCheck");
	 var chked= false;
	 var indexId= false;
	 for(i=0; i<memberChk.length; i++){
		 if(memberChk[i].checked){
			 if(indexId){
				 memberId=memberId+'-';
			 }
			 memberId=memberId+memberChk[i].value;
			 indexId =true;
		 }
		 if(!indexId){
			 alert("삭제할 회원을 체크하세요.");
			 return;
		 }
		 document.memberList.delMemberId.value=meberId;
		 
		 var agree=confirm("삭제하시겠습니까?");
		 	if(agree){
		 		document.memberList.execute.value="memListDel";
		 		document.memberList.submit();
		 	}
	 }
 } */
 
 
 function allChk(obj){
     var chkObj = document.getElementsByName("RowCheck");
     var rowCnt = chkObj.length - 1;
     var check = obj.checked;
     if (check) {﻿
         for (var i=0; i<=rowCnt; i++){
          if(chkObj[i].type == "checkbox")
              chkObj[i].checked = true; 
         }
     } else {
         for (var i=0; i<=rowCnt; i++) {
          if(chkObj[i].type == "checkbox"){
              chkObj[i].checked = false; 
          }
         }
     }
 } 

﻿ ﻿ 

//﻿2. 체크박스 선택된 것 삭제 처리 (N개) 
  function fn_memListDel(){

 var memberId = "";
 var memberChk = document.getElementsByName("RowCheck");
 var chked = false;
 var indexid = false;
 for(i=0; i < memberChk.length; i++){
  if(memberChk[i].checked){
   if(indexid){
     memberId = memberId + '-';
   }
   memberId = memberId + memberChk[i].value;
   indexid = true;
  }
 }
 if(!indexid){
  alert("삭제할 사용자를 체크해 주세요");
  return;
 }
 document.userForm.memListDelBtn.value = memberId;       // 체크된 사용자 아이디를 '-'로 묶은 userid 를     

 
 var agree=confirm("삭제 하시겠습니까?");
    if (agree){
  document.memberList.execute.value = "memberDel";
    document.memberList.submit();
    } 
 }﻿
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
				<li><a href="${path}/admin/ownerList.do">사장님</a></li>
				<li class="divider"></li>
			</ul>
		</div>
	</div>
	
	<div id="memberList">
	<form action="${path }/admin/memberListEnd.do" method="post">
		<table class="table table-hover" id="memberListTable">
			<thead id="tableHead">
				<tr>
					<th><input type="checkbox" id="allCheck" onclick="allChk(this);" /></th>
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
					<td><input type="checkbox" name="RowCheck" value="${m.MEMBERID }" /></td>
					<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')" name="memberNum">${m.MEMBERNUM}</td>
					<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')" >${m.MEMBERID}</td>
					<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')" >${m.MEMBERNAME}</td>
					<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')" >${m.MEMBEREMAIL}</td>
					<td class="pnt" onclick="fn_memListmodal('${m.MEMBERNUM }')" >${m.MEMBERENROLLDATE}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		</form>
		<button type="submit" id="memListDelBtn" onclick="fn_memListDel();">
			<img src="${path}/resources/images/admin/deleteBtn.png"
				class="memberListDelImg">
		</button>

	</div>
</div>



<script>
	function fn_memListmodal(memberNum) {
		
		console.log(memberNum);
		$('#memListModal').modal();
		$.ajax({
			url:"${path}/admin/memberOne.do",	//요청보낼 서버 url주소
			dataType:"Map",
			data:{"memberNum":memberNum},	//요청과 함께 보낼 데이터
			success:function(data)
			{
				console.log(data);
			}
			
		}); 
	}

	/* function fn_memListDel() {
		$('#memListDel').modal();
	}; */
</script>

<!-- <div class="modal" id="memListDel" role="dialog">
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
								onclick="fn_memListDelCan()" id="memlistDel">삭제</button>
							<button type="button" class="btn btn-outline-danger"
								data-dismiss="modal">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div> -->





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
				  <%-- <c:forEach items="${memMo }"  var="Mo" > --%>
					<tr>
						<th>프로필</th>
						<td><img src="${path }/resources/images/place.png"
							id="memListProfile"></td>

					</tr>
					<tr>
						<th>주소</th>
						<td>${MEMBERADDRESS}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${MEMBERBIRTH}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${MEMBERPHONE}</td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td>${MEMBERENROLLDATE}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${MEMBERGENDER}</td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>${MILEAGE}</td>
					</tr>

				<%-- </c:forEach> --%>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>