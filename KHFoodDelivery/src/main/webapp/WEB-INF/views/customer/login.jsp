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
background: #54C7C3;
width:100%;
font-weight: 600;
color:#fff;
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
</style>
 <script>
		function login(){
			
			var id = $('#id').val().trim().length;
    		var pw = $('#pw').val().trim().length;  
    		
			if(id==0 || pw==0 ){
				
				alert("아이디와 비밀번호를 입력해주세요.");
				
				return false;
		
			}
				
			return true;

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
                         	<input type="hidden" id="kakaoId" name="id" value="">
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
							    Kakao.init('011c109c7507b9fbacd344180992f049');
							    // 카카오 로그인 버튼을 생성합니다.
							    Kakao.Auth.createLoginButton({
							      container: '#kakao-login-btn',
							      success: function(authObj) {
							    	  
							    	  Kakao.API.request({
							    		  url: '/v1/user/me',
							              success: function(res) {
													
							                    alert(JSON.stringify(res));

							                    alert(JSON.stringify(authObj));

							                    console.log(res.id);

							                    console.log(res.kaccount_email);
							                    console.log(res.kgender);

							                    console.log(res.properties['nickname']);

							                    console.log(authObj.access_token);
							                    $('#kakaoId').val(res.id);
							                    $('#kakaoNick').val(res.properties['nickname']);
							                    $('#myModal').modal();
												/* $('#kakaoId').val(res.id);
												$('#kakaoLoginForm').submit(); */
							                  }

							                })
							      },
							      fail: function(err) {
							         alert(JSON.stringify(err));
							      }
							    });
							  //]]>
							</script>
							
							
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
				</div>
				<div class="modal-body">

					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>추가 정보</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<form action="${path }/member/kakaoMemberEnroll.do" method="post" onsubmit="return fn_enroll_validate();">
									<input type="hidden" id="kakaoId" name="id" value="">
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">메뉴이름</label>
										<div class="col-8">
											<input type="text" id="menuName" name="menuName"
												placeholder="아이디" class="form-control here"
												required="required"> <input type="hidden"
												name="checkId" value="0" />
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-4 col-form-label">메뉴가격</label>
										<div class="col-8">
											<input type="text" id="menuPrice" name="menuPrice"
												placeholder="" class="form-control here">
										</div>
									</div>
									<div class="form-group row">
										<label for="lastname" class="col-4 col-form-label">메뉴설명</label>
										<div class="col-8">
											<textarea id="menuContent" name="menuContent" cols="40" rows="4" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group row">
                                        <label for="newpass" class="col-4 col-form-label">메뉴사진</label> 
                                          <div class="col-sm-8 wrap-input-container">
                                            <label id="menuImage1" for="menuImage" class="custom-file-upload form-control">Upload Image</label>
                                                <input id="menuImage" class="file-upload" name="menuImage" type="file" onchange="chk_file_type(this);" accept="image/gif,image/jpeg,image/png">
                                          </div>
                                    </div>      
									<div class="form-group row">
										<div class="col-4"></div>
										<div class="col-8">
											 <input type="hidden" id="menuCode" name="menuCode">
											<button id="ownerJoinBtn" name="submit" type="submit"
												class="btn btn-primary">수정</button>
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