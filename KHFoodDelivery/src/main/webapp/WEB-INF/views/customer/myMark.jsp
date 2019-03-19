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
    div.up{position:relative; padding:0px;}
    div.up span.guide1 {display:none;font-size: 12px;position:absolute; top:5px; right:10px;}
     div.up span.guide2 {display:none;font-size: 12px;position:absolute; top:5px; right:10px;}
    div.upr span.ok,span.ok1,span.ok2{color:blue;}
    div.up span.error,span.error2{color:red;}
.btn{background-color:skyblue; color:white; margin-top:5%;}
#drop{float:right;}
.btn-ser1{margin-top:0;float:right;}           
</style>
<script>
$(function(){
	$("#nickName").keyup(function(){
		nickName=$("#nickName").val().trim();

		$.ajax({
			url:"${path}/member/checkNick.do",
			data:{"nickName":nickName},
			success:function(data){          
				console.log(data.isNick);
				nick=data.isNick;
				console.log(nick);       					
				if(data.isNick==false){
					$(".guide2.ok2").show();
					$(".guide2.error2").hide();
				
				}else{
					
					$(".guide2.error2").show();
					$(".guide2.ok2").hide();
					
				}
				
				
			}
		});
	});
});


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
           $('#adr2').val(data.zonecode);
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

<div class="container up">
 			
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group">
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}"  class="list-group-item list-group-item-action">회원정보변경</a>
              <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="${path }/member/markList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action active">즐겨찾는매장</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9">
			<table class="table table-hover">
				<tr>
					<th colspan='2'>찜한 가게(${count })</th>				
				</tr>
				<c:forEach items="${list}" var="s">
					<tr onclick="location.href='${path}/customer/menuInfo.do?businessCode=${s.businessCode }'">
						<td>
							<img alt="${s.storeName}" src="${path}/resources/upload/owner/storeMainImage/${s.storeImage}" style="width:50px; height:50px;"/>
						</td>
						<td>
							${s.storeName }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
	
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>