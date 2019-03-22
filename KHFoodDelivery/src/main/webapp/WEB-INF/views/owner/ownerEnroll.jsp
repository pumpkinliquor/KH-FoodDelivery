<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
	<jsp:param value="사장님 회원가입" name="pageTitle" />
</jsp:include>
<style>
#ownerJoinBtn {
	width: 100%;
}

span.guide {
	display: none;
	font-size: 12px;
	position: absolute;
	top: 12px;
	right: 10px;
}

span.ok,span.ok1 {
	color: green;
	margin-right: 20px;
}

span.error,span.error1 {
	color: red;
	margin-right: 20px;
}
</style>
<script>
	var tr = "";
	var ownerPw = "";
	var reownerPw = "";
	// 아이디 중복검사 ajax
	$(function() {
		$("#ownerId").keyup(function() {
			
			var a = $('#ownerId').val().replace(/ /gi, '');
	        $('#ownerId').val(a);
			
			var ownerId = $("#ownerId").val().trim();
			if (ownerId.length < 4) {
				$(".guide").hide();
				return;
			}
			$.ajax({
				url : "${path}/owner/ownerCheckId.do",
				data : {
					"ownerId" : ownerId
				},
				success : function(data) {
					console.log(data);
					tr = data;
					console.log("tr" + tr);
					if (data == 'true') {
						$(".guide.ok").hide();
						$(".guide.error").show();

					} else {
						$(".guide.ok").show();
						$(".guide.error").hide();
					}
				}
			});
		});
		
		
		$("#ownerPw").keyup(function(){
			
			var a = $('#ownerPw').val().replace(/ /gi, '');
	        $('#ownerPw').val(a);
			
			ownerPw = $("#ownerPw").val();
			var ownewPw1 = $("#ownerPw").val().trim();
			reownerPw = $("#reownerPw").val();
			console.log(ownerPw);
				if (ownerPw == reownerPw) {
					$(".guide.ok1").show();
					$(".guide.error1").hide();

				} else {
					$(".guide.ok1").hide();
					$(".guide.error1").show();
				}
			
				if($("#ownerPw").val().trim().length==0 || $("#reownerPw").val().trim().length==0)
					{
					$(".guide.ok1").hide();
					$(".guide.error1").hide();
					}
			
		});
		
		//비밀번호 중복확인
		$("#reownerPw").keyup(function() {
			
			var a = $('#reownerPw').val().replace(/ /gi, '');
	        $('#reownerPw').val(a);
			
			
			ownerPw = $("#ownerPw").val();
			var ownewPw1 = $("#ownerPw").val().trim();
			reownerPw = $("#reownerPw").val();
			console.log(ownerPw);
			if (ownerPw < 1) {
				/* $("#reownerPw").attr("readonly",true); */
				alert("비밀번호 먼저 입력해주세요");
				$("#reownerPw").val('');
			} else {
				if (ownerPw == reownerPw) {
					$(".guide.ok1").show();
					$(".guide.error1").hide();

				} else {
					$(".guide.ok1").hide();
					$(".guide.error1").show();
				}
			}
			
			if($("#reownerPw").val().trim().length==0 || $("#ownerPw").val().trim().length==0)
			{
			$(".guide.ok1").hide();
			$(".guide.error1").hide();
			}
		});

	});
	
	// submit 가기전 검사
	function fn_enroll_validate() {
		console.log("여부" + tr);
		console.log("들어왔니?");
		if ($("#ownerId").val().length < 4) {
			alert("최소 4자리 이상 입력하세요!");
			$("#ownerId").focus();
			return false;
		}
		if (tr == 'true') {
			console.log("아이디에들어왔니?");
			alert("아이디를 다시 확인해주세요");
			$("#ownerId").val('');
			$("#ownerId").focus();
			return false;
		}
		if (ownerPw != reownerPw) {
			alert("비밀번호를 다시 확인 해주세요");
			$("#reownerPw").val('');
			$("#reownerPw").focus();
			return false;
		}
		
		var passwordRules = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		console.log("패스워드룰"+passwordRules.test(ownerPw));
		if(passwordRules.test(ownerPw) == false)
			{
				alert(" 6~20 영문 대소문자 , 최소 1개의 숫자 혹은 특수 문자를 포함 하세요!");
				$("#ownerPw").val('');
				$("#ownerPw").focus();
			return false;
			}
		return true;
	}
</script>
<section>

	<div class="container">
		<div class="row">
			<div class="col-md-3 "></div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>사장님 회원 가입</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<form action="${path }/owner/ownerEnrollEnd.do" method="post"
									onsubmit="return fn_enroll_validate();">
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">아이디</label>
										<div class="col-8">
											<input type="text" id="ownerId" name="ownerId"
												placeholder="아이디" class="form-control here"
												required="required"> <span class="guide ok">이
												아이디는 사용할 수 있음 </span> <span class="guide error">이 아이디는 사용할 수
												없음 </span> <input type="hidden" name="checkId" value="0" />
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-4 col-form-label">비밀번호</label>
										<div class="col-8">
											<input type="password" id="ownerPw" name="ownerPw"
												placeholder="6~20 영문 대소문자," class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="lastname" class="col-4 col-form-label">비밀번호
											확인</label>
										<div class="col-8">
											<input type="password" id="reownerPw" name="reownerPw"
												placeholder="최소 1개의 숫자 혹은 특수 문자를 포함" class="form-control here"> <span
												class="guide ok1">비밀 번호가 일치함</span> <span
												class="guide error1">비밀번호가 일치하지 않음 </span>
										</div>
									</div>
									<div class="form-group row">
										<label for="text" class="col-4 col-form-label">이름</label>
										<div class="col-8">
											<input id="ownerName" name="ownerName" placeholder="이름"
												class="form-control here" required="required" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="ownerPhone" class="col-4 col-form-label">연락처</label>
										<div class="col-8">
											<input type="text" id="ownerPhone" name="ownerPhone"
												class="form-control here" required="required"
												placeholder="예)01091634624" maxlength="11">
										</div>
									</div>
									<div class="form-group row">
										<label for="email" class="col-4 col-form-label">Email</label>
										<div class="col-8">
											<input id="ownerEmail" name="ownerEmail" placeholder="Email"
												class="form-control here" required="required" type="email">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-4"></div>
										<div class="col-8">
											<button id="ownerJoinBtn" name="submit" type="submit"
												class="btn btn-primary">회원가입</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

</section>


<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>