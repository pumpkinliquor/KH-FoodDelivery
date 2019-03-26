<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
/*  로그인 */ 

.send-button{
background: rgb(250, 163, 148);
width:100%;
font-weight: 600;
color:white;
padding: 8px 25px;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}
.g-button{
color: #fff !important;
border: 1px solid #EA4335;
background: #ea4335 !important;
width:100%;
font-weight: 600;
color:#fff;
padding: 8px 25px;
}
.my-input{
box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
cursor: text;
padding: 8px 10px;
transition: border .1s linear;
}
.header-title{
margin: 5rem 0;
}

.login-or {
position: relative;
color: #aaa;
margin-top: 10px;
margin-bottom: 10px;
padding-top: 10px;
padding-bottom: 10px;
}
.span-or {
display: block;
position: absolute;
left: 50%;
top: -2px;
margin-left: -25px;
background-color: #fff;
width: 50px;
text-align: center;
}
.hr-or {
height: 1px;
margin-top: 0px !important;
margin-bottom: 0px !important;
}
@media screen and (max-width:480px){
/* h1{
font-size: 26px;
}
h2{
font-size: 20px;
} */
}

.loginDiv_1{
	margin-bottom : 10px;
}
#kakao-login-btn{
	width:100%;
	height:42px;
}

.search{
background-color: transparent;
	border-color: transparent;
	color:gray;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-80size {
  width: 100%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
</style>
 <script>
 		$('#myModal').modal('show').css({
 			'margin-left': function(){
 				return -($(this).width() / 2);
 			}
 		})
 
		function login(){
			
			var id = $('#id').val().trim().length;
    		var pw = $('#pw').val().trim().length;  
    		
			if(id==0 || pw==0 ){
				
				alert("아이디와 비밀번호를 입력해주세요.");
				
				return false;
		
			}
				
			return true;

		}

 		
 		 function address() {
             new daum.Postcode({ 
                oncomplete: function(data) {
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = data.address; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수
     
                    // 기본 주소가 도로명 타입일때 조합한다.
                    if(data.addressType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                         fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
                    }
     
                    // 주소 정보를 해당 필드에 넣는다.
                    $('#memberAddress').val(fullAddr); 
                     /* document.getElementById("location").value = fullAddr;  */
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
     
                            var result = results[0]; //첫번째 결과의 값을 활용
     
                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                           
                         
                        }
                    });
                }
             }).open(); 
        }
</script> 

<section>
    <div class="container">
                <div class="col-md-6 mx-auto text-center">
                   <div class="header-title">
                      <h1 class="wv-heading--title">
                        	환영합니다.로그인 해주세요!
                      </h1>
                   </div>
                </div>
                <div class="row">
                   <div class="col-md-4 mx-auto">
                      <div class="myform form ">
                      
                         <form  method="post"  onsubmit="return login();" action="${pageContext.request.contextPath}/member/login.do">
                         
                            <div class="form-group">
                               <input type="text" name="id"  class="form-control my-input" id="id" placeholder="id">
                            </div>
                            <div class="form-group">
                               <input type="password" name="pw"  class="form-control my-input" id="pw" placeholder="password">
                            </div>
                            
                            <div class="text-center loginDiv_1">
                               <input type="submit" value="로그인" class="btn btn-block send-button "/>
                            </div>
                       		
                         </form>
                         <form id="kakaoLoginForm" method="post" action="${path }/member/kakaoLogin.do">
                         		<input type="hidden" id="memberId" name="memberId" value="">
                         		<input type="hidden" id="nickName" name="nickName" value="">                   		
                         </form>
                            <div class="text-center">
							<a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a>
                            </div>
                            <div class="col-md-12 ">
                               <div class="login-or">
                                  <hr class="hr-or">
                                  <span class="span-or">or</span>
                               </div>
                            </div>
                            <div class="form-group">
                               <a class="btn btn-block g-button" href="${path}/member/memberEnroll.do">
                               <i class="fa fa-google"></i>회원가입
                               </a>
                            </div>
                           <p class="small mt-3">아이디 또는 비밀번호가 기억이 안나시나요? 옆에 버튼을 눌러 찾을 수 있습니다.<a href="${path }/customer/idSearch.do" class="ps-hero__content__link">아이디찾기</a> or <a href="${path }/customer/pwSearch.do">비밀번호 찾기</a>
                            </p>
                      </div>
                   </div>
                </div>
             </div>

							<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    /* Kakao.init('011c109c7507b9fbacd344180992f049'); */
							    Kakao.init('c09f7e7ab198332b78f59b0c8d0815d0');
							    // 카카오 로그인 버튼을 생성합니다.
							    Kakao.Auth.createLoginButton({
							      container: '#kakao-login-btn',
							      success: function(authObj) {
							    	  
							    	  Kakao.API.request({
							    		  url: '/v1/user/me',
							              success: function(res) {
											
							                    /* console.log(authObj.access_token); */
							                    $('#kakaoId').val(res.id);
							                    $('#kakaoNick').val(res.properties['nickname']);
							                    $('#nickName').val(res.properties['nickname'])
							                    $('#memberId').val(res.id);
							                    /* $('#myModal').modal(); */
												$('#kakaoLoginForm').submit();
							                  }

							                })
							      },
							      fail: function(err) {
							         alert(JSON.stringify(err));
							      }
							    });
							  //]]>
							</script>
							
							
	<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
      	<h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        	
        	
        	<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>추가 정보 입력</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<form action="${path }/member/kakaoMemberEnrollEnd.do" method="post"
									onsubmit="return fn_enroll_validate();">
									<div class="form-group row">
										<label for="username" class="col-3 col-form-label">이름</label>
										<div class="col-9">
											<input type="text" id="memberName" name="memberName"
												placeholder="아이디" class="form-control here"
												required="required"> 
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-3 col-form-label">이메일</label>
										<div class="col-9">
											<input type="email" id="memberEmail" name="memberEmail"
												placeholder="" class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-3 col-form-label">핸드폰번호</label>
										<div class="col-9">
											<input type="text" id="memberPhone" name="memberPhone"
												placeholder="" class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-3 col-form-label">주소</label>
										<div class="col-9">
											<input type="button" class="btn-ser btn btn-default" onclick="address();" value="주소검색"/>
											<input type="text" id="memberAddress" name="memberAddress"
												placeholder="" class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-3 col-form-label">상세주소</label>
										<div class="col-9">
											<input type="text" id="memberAddress1" name="memberAddress1"
												placeholder="" class="form-control here">
										</div>
										
									</div>     
									<input type="hidden" id="kakaoId" name="memberId" value="">
									<input type="hidden" id="kakaoNick" name="nickName" value="">
									<input type="hidden" name="profileImage" value="user.jpg"/>
									<div class="form-group row">
										<div class="col-3"></div>
										<div class="col-9">
											<button id="ownerJoinBtn" name="submit" type="submit"
												class="btn btn-primary">가입</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
        	
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>