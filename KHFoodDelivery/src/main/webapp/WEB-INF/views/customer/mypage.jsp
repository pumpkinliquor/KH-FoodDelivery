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
input.memberAddress{display:inline;}
.img-circle {
    border-radius: 50%;
   	width:150px;
   	height:150px; 
} 

.btn{background-color:skyblue; color:white; margin-top:5%;}
#drop{float:right;}
.btn-ser1{margin-top:0;float:right;}           
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

function dropMember(){
	if(!confirm("정말 탈퇴하시겠습니까?")){
		return;
	}
	location.href="${path}/member/drop.do?memberId=${sessionScope.logined}";
	
}


function address1() {
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

<div class="container">
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}"  class="list-group-item list-group-item-action active">회원정보변경</a>
              <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="#" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9 ">
			
 			 <div class="row">
		         <div class="col-md-12">
		              <form name="update" action="${path}/member/update.do" method="post" enctype="multipart/form-data">
						  <div class="text-center">
				  			
				  			<img onclick="fileUpload()" style="cursor: pointer;" name="file" title="profile image" class="avatar img-circle img-thumbnail" alt="avatar" src="${path}/resources/upload/member/profile/${member.profileImage}"/>
				 			<input type="file" class="btn btn-primary" id="file" name="profileImg" style="display: none ;">
				 			 
			 				
			 			<hr>
			 			</div>
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
                                  <input id="text" name="formatBirth" id="formatBirth"value="${member.memberBirth}"class="form-control here" required="required" type="text">
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
                                <div class="addre col-8">
                             	  <input type="button" class="btn-ser1 btn btn-default" onclick="address1();" value="주소검색"/>
                                  <input  name="memberAddress" id="memberAddress"value="${member.memberAddress}" class="form-control here" type="text">
                                </div>
                              </div>
                               <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">성별</label> 
                                <select class="form-control" name="memberGender" id="memberGender" required>
					            <option value="" disabled selected>성별</option>
					            <option value="M" ${member.memberGender=='M'?'selected':''}>남</option>
					            <option value="F" ${member.memberGender=='F'?'selected':'' }>여</option>
					            </select>
										            
                              </div> 
                              
                              <input type="submit" class="btn btn-default" value="수정하기"/>&nbsp;
                              <input type="reset" class="btn btn-default" value="취소"/>
                              
                              
                            <input type="button" onclick="dropMember();" class="btn btn-default" id="drop" value="탈퇴"/>
                            </form>
		                </div>
		            </div>
  		
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>