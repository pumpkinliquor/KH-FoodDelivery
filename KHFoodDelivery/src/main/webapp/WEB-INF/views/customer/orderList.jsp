<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
 			<a>${member.memberName }</a> <a>${member.memberId }</a> <a>${member.nickName }</a>
 			<input type="file" class="btn btn-primary" id="file" name="file" style="display: none ;">
 			</div>
 			<hr>
 			</div>
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="${path }/member/orderList.do" class="list-group-item list-group-item-action active" style="z-index:0;">나의 주문내역</a>
              <a href="#" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action">회원정보변경</a>
              <a href="#" class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9 ">
			
 			 
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>