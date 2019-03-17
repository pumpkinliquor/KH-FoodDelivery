<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
small {
	font-weight: bold;
}
div.container span.guide1 {display:none;font-size: 12px;position:absolute; top:10px; right:20px;}
div.container span.ok1 {color:blue;}
</style>
<section>
	<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">사장님 마이페이지</h2>
	</div>
		<div class="col-sm-12">
			<div class="row" style="border:1px solid black; padding-bottom:2em; padding-top:4em;">
			<div class="col-sm-1"></div>
				<div class="col-sm-5">
					<table class="table">
						<tr>
							<th width=40%><small>연락처</small></th>
							<td>${owner.ownerPhone }</td>
						</tr>
						<tr>
							<th width=40%><small>최종접속일</small></th>
							<td>${owner.lastConnectionDate }</td>
						</tr>
						<tr>
							<th width=40%><small>이름</small></th>
							<td>${owner.ownerName }</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-5">
					<table class="table">
						<tr>
							<th width=40%><small>내가쓴글</small></th>
							<td>(문의글:${qnaCount}개<c:if test="${not empty businessReviewCount }">, 코멘트:${businessReviewCount}개</c:if>)</td>
						</tr>
						<tr>
							<th width=40%><small>E-MAIL</small></th>
							<td>${owner.ownerEmail }</td>
						</tr>
						<tr>
							<th width=40%><small>회원가입일</small></th>
							<td>${owner.ownerEnrollDate }</td>
						</tr>
					</table>
				</div>
			<div class="col-sm-1"></div>
			</div>
			<div class="col-sm-12" style="text-align: right; margin-top: 5em;">
				<button class="btn btn-default" type="button" id="modalBtn">정보수정</button>
			</div>
		</div>
		<script>
		//모달창 띄우기
	    $(function() {
	        $("#modalBtn").click(function(){
	            $('div.modal').modal();
	            $('#ownerId').val("${owner.ownerId}");
	            $('#ownerName').val("${owner.ownerName}");
	            $('#ownerPhone').val("${owner.ownerPhone}");
	            $('#ownerEmail').val("${owner.ownerEmail}");
	        });
	    });
		//모달 안 수정버튼
		function updateMyPage() {
			$('#updateMyPageFrm').submit();
		}
		$(function() {
       	//비밀번호 확인
       		$('#ownerPw2').blur(function(){
       			ownerPw = $("#ownerPw").val();
       			var passwordRules =  /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
       			console.log("패스워드룰"+passwordRules.test(ownerPw));
       		   	if(passwordRules.test(ownerPw) == false){
        		   	if($('#ownerPw2').val()!=''){
        		   		{
        		   			alert("6~20 영문 대소문자 , 최소 1개의 숫자 혹은 특수 문자를 포함 하세요!");
        		   			$('#ownerPw').val('');
        		   			$('#ownerPw2').val('');
        		   			$('#ownerPw').focus();
        		   		}
        		   	}
       		   	}
       		   	else{
	       		   	if($('#ownerPw').val() != $('#ownerPw2').val()){
	       		    	if($('#ownerPw2').val()!=''){
		       			    alert("비밀번호가 일치하지 않습니다.");
							$('#ownerPw2').val('');
							$('#ownerPw2').focus();
							$('.guide1.ok1').hide();
	       		       }
	       		    }
	      		   	else{
	       			   $(".guide1.ok1").show();
	       		   	}
       		   	}
       		});
       	});
    </script>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
						<div class="modal-title"></div>
					</div>
					<!-- body -->
					<div class="modal-body">
						<h3
							style="text-align: center; font-weight: bold; margin-bottom: 2em;">사장정보수정</h3>
						<form action="${path }/owner/myPageUpdate.do" method="post"
							id="updateMyPageFrm">
							<div class="form-group row">
								<label for="ownerId" class="col-4 col-form-label">아이디</label>
								<div class="col-8">
									<input type="text" value="" name="ownerId"
										id="ownerId" class="form-control" required readonly/>
								</div>
							</div>
							<div class="form-group row">
								<label for="ownerName" class="col-4 col-form-label">이름</label>
								<div class="col-8">
									<input type="text" value="" name="ownerName" id="ownerName"
										class="form-control" required />
								</div>
							</div>
							<div class="form-group row">
								<label for="ownerPw" class="col-4 col-form-label">비밀번호변경</label>
								<div class="col-8">
									<input type="password" class="form-control" placeholder="비밀번호변경"
										name="ownerPw" id="ownerPw" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="onwerPw2" class="col-4 col-form-label">비밀번호확인</label>
								<div class="col-8">
									<input type="password" class="form-control"
										placeholder="비밀번호확인" name="ownerPw2" id="ownerPw2" required>
										<span class="guide1 ok1">일치</span>
								</div>
							</div>
							<div class="form-group row">
								<label for="ownerPhone" class="col-4 col-form-label">연락처</label>
								<div class="col-8">
									<input type="tel" name="ownerPhone" id="ownerPhone"
										class="form-control" value="" />
								</div>
							</div>
							<div class="form-group row">
								<label for="ownerEmail" class="col-4 col-form-label">이메일</label>
								<div class="col-8">
									<input type="tel" name="ownerEmail" id="ownerEmail"
										class="form-control" value="" />
								</div>
							</div>
						</form>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							onclick="updateMyPage();">수정</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>