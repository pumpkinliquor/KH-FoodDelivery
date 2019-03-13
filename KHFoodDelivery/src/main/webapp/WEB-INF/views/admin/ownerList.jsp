<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Astyle.css" />
<script>
	$(function(){
		$("#ownAllCheck").click(function(){
			if($("#ownAllCheck").prop("checked")){
				$("input[type]=checkbox").prop("checked",true);
			
		}
		else{
			$("input[type=checkbox]").prop("checked",false);
		}
		})
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
		<form action="${path }/admin/ownDel.do" id="ownDel" method="post">
		<table class="table table-hover" id="ownerListTable">
			<thead id="tableHead">
				<tr>
					<th><input type="checkbox" id="ownAllCheck" /></th>
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
					<td><input type="checkbox" class="checkthis" name="rowCheck" value="${o.OWNERNUM }"/></td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.BUSINESSCODE}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.OWNERID}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.STORENAME}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.STORECATEGORY}</td>
					<td class="pnt" onclick="fn_ownListmodal('${o.BUSINESSCODE}')">${o.BUSINESSNAME}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<button type="submit" id="ownerDelBtn">
			<img src="${path}/resources/images/admin/deleteBtn.png"
				class="ownerListDelImg">
		</button>
	</form>
	</div>
	<div class="paging">
	${pageBar}
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
				$("#ownStoreProfile").attr("src","resources/owner"+data.STOREPROFILE);
				$('#ownBusinessName').val(data.BUSINESSNAME); 
				$('#ownBusinessPhone').val(data.BUSINESSPHONE);
				$('#ownStorePhone').val(data.STOREPHONE);
				$('#ownStoreAddress').val(data.STOREADDRESS); 
				$('#ownBusinessNum').val(data.BUSINESSNUM);
				$('#ownListModal').modal();
			}
		});
		
		

	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>







<style>
 #ownListModal{
 border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
 #ownStoreAddress{
 resize:none;
 }

.form-control{
 background-color:#e9ecef;
 }
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
						<td><img src=""	id="ownStoreProfile"></td>

					</tr>
					<tr>
						<th>사업주명</th>
						<td><input type="text" id="ownBusinessName" class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>사업자연락처</th>
						<td><input type="text" id="ownBusinessPhone" class="form-control" readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>가게연락처</th>
						<td><input type="text" id="ownStorePhone" class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>가게주소</th>
						<td><textarea rows="3" cols="10" id="ownStoreAddress" class="form-control" readonly="readonly"></textarea></td>
					</tr>
					 <tr>
						<th>사업자번호</th>
						<td><input type="text" id="ownBusinessNum" class="form-control" readonly="readonly"></td>
					</tr>
					

				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
