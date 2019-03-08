<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.* , com.kh.food.customer.member.model.vo.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.img-circle {
    border-radius: 50%;
   	width:150px;
   	height:150px;
  

  
} 

</style>
<script>
$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $("#file").on('change', function(){
        readURL(this);
    });
});

function fileUpload(){
	$("#file").click();
}

</script>
	
	
			
 			
 	
 	
 	
 	
 	
 	
<div class="container">
<div class="text-center">
  			<img onclick="fileUpload()" style="cursor: pointer;" title="profile image" class="avatar img-circle img-thumbnail" alt="avatar" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
 			<h6></h6>
 			<div class="text">
 			<a>황장운님</a> <a>아이디</a> <a>닉네임</a>
 			<input type="file" class="btn btn-primary" id="file" name="file" style="display: none ;">
 			</div>
 			<hr>
 			</div>
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${path }/customer/mypage.do" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="#" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path}/member/memberInfoChange.do" class="list-group-item list-group-item-action active">회원정보변경</a>
              <a href="#" class="list-group-item list-group-item-action">나의 문의내역</a>
              <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>     
            </div> 
		</div>
		<div class="col-md-9 ">
			
 			 <div class="row">
		                <div class="col-md-12">
		                    <form>
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">아이디</label> 
                                <div class="col-8">
                                  <input id="username" name="username" placeholder="Username" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">이름</label> 
                                <div class="col-8">
                                  <input id="name" name="name" placeholder="First Name" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">닉네임</label> 
                                <div class="col-8">
                                  <input id="lastname" name="lastname" placeholder="Last Name" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">생년월일</label> 
                                <div class="col-8">
                                  <input id="text" name="text" placeholder="Nick Name" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="select" class="col-4 col-form-label">이메일</label> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="Email" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">전화번호</label> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="Email" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">주소</label> 
                                <div class="col-8">
                                  <input id="website" name="website" placeholder="website" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">성별</label> 
                                <div class="col-8">
                                    <input id="website" name="website" placeholder="website" class="form-control here" type="text">
                                </div>
                              </div>
                              
                              
                            </form>
		                </div>
		            </div>
  		
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>