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
.btn{background-color:skyblue; color:white; margin-top:5%;}

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
  			<img onclick="fileUpload()" style="cursor: pointer;" title="profile image" class="avatar img-circle img-thumbnail" alt="avatar" src="${path}/resources/images/customer/mypage/user.jpg"/>
 			<h6></h6>
 			<div class="text">
 		
 			<a>아이디</a> <a>닉네임</a>
 			<input type="file" class="btn btn-primary" id="file" name="file" style="display: none ;">
 			</div>
 			<hr>
 			</div>
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${path}/member/memberInfoChange.do" class="list-group-item list-group-item-action active">회원정보변경</a>
              <a href="${path }/customer/mypage.do" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="#" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="#" class="list-group-item list-group-item-action">나의 문의내역</a>
              <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>     
            </div> 
		</div>
		<div class="col-md-9 ">
			
 			 <div class="row">
		                <div class="col-md-12">
		                    <form name="update" action="${path}/member/update.do" method="post" onsubmit="return update();" >
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">아이디</label> 
                                <div class="col-8">
                                  <input id="username" name="memberId" id="memberId"value="${member.memberId}" class="form-control here" required="required" type="text" readonly >
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">이름</label> 
                                <div class="col-8">
                                  <input id="name" name="memberName" id="memberName"value="${member.memberName}" class="form-control here" type="text" readonly>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">닉네임</label> 
                                <div class="col-8">
                                  <input id="lastname" name="nickName" id="nickName"value="${member.nickName}" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">생년월일</label> 
                                <div class="col-8">
                                  <input id="text" name="formatBirth" id="formatBirth"value="${member.formatBirth}"class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="select" class="col-4 col-form-label">이메일</label> 
                                <div class="col-8">
                                  <input id="email"id="memberEmail" name="memberEmail" value="${member.memberEmail}" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">전화번호</label> 
                                <div class="col-8">
                                  <input id="email" name="memberPhone" id="memberPhone" value="${member.memberPhone}" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">주소</label> 
                                <div class="col-8">
                                  <input id="website" name="memberAddress" id="memberAddress"value="${member.memberAddress}" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">성별</label> 
                                <select class="form-control" name="gender" id="gender" required>
					            <option value="" disabled selected>성별</option>
					            <option value="M" ${member.gender=='M'?'selected':'' }>남</option>
					            <option value="F" ${member.gender=='F'?'selected':'' }>여</option>
					            </select>
										            
                              </div>
                              
                              <input type="submit" class="btn btn-default" value="수정하기"/>&nbsp;
                              <input type="reset" class="btn btn-default" value="취소"/>
                            </form>
		                </div>
		            </div>
  		
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>