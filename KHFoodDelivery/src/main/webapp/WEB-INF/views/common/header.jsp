<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<header>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c&libraries=services"></script>


   
	<script>
    $(document).ready(function () {
		$("#positionBtn").click(function(){
  			 function getLocation() {
			       if (navigator.geolocation) { // GPS를 지원하면
			           navigator.geolocation.getCurrentPosition(function(position) {
			            var latitude = position.coords.latitude;
			        	var longitude = position.coords.longitude;
			        	  
			        	
			          
			        	 alert("아직 구현안됨 지도 클릭!"); 
			        	 
			      
			        	
						 	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			        	 mapOption = {
			        	    center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			        	    level: 3 // 지도의 확대 레벨
			        	};   

			        	
						 	//지도를 생성합니다    
			        	var map = new daum.maps.Map(mapContainer, mapOption); 

			        	
						 	//주소-좌표 변환 객체를 생성합니다
		        	var geocoder = new daum.maps.services.Geocoder();

			        	//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			         	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			        	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        	    if (status === daum.maps.services.Status.OK) {
			        	    	
			        	    	 var infoDiv = document.getElementById('centerAddr1');
			        	    	 
			        	    	 $('#location').val(result[0].address.address_name);
			        	    	 infoDiv.innerHTML = '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			        	     
			        	    }   
			        	});
			        	});
  

				
					function searchDetailAddrFromCoords(coords, callback) {
					    // 좌표로 법정동 상세 주소 정보를 요청합니다
					    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
					  
					}
	   					

				         }, function(error) {
				           console.error(error);
				         }, {
				           enableHighAccuracy: true,
				           maximumAge: 0,
				           timeout: Infinity
				         });
			       } else {
			         alert('GPS를 지원하지 않습니다');
			       }
			     }
			     getLocation();	
		}); 
}); 
     
   
   
   
   
   
   
   
   //위치 검색 구현
   
       var geocoder = new daum.maps.services.Geocoder();
  
 
    function sample5_execDaumPostcode() {
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
                document.getElementById("location").value = fullAddr;
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
  


	//헤더 고정 
	$(function(){
		$(window).scroll(function(){
			var num = $(this).scrollTop();
		
			if(num > 36){
				$(".newsletter").css("position","fixed");
			}else{
				$(".newsletter").css("position","absolute");
			}
		});
	});
	//배달의민족 클릭시 메인으로
	function mainpage(){
		location.href="${path }";
	}
	
	
	</script>


		 <div id='centerAddr1'></div>
        <div class="newsletter">
              <div class="headerDiv1">
               <c:if test="${sessionScope.logined==null }">
                   <button class="btn btn-default my-2 my-sm-0" onclick="location.href='${path}/customer/login.do'">로그인</button>        
                   <button class="btn btn-default my-2 my-sm-0" onclick="location.href='${path}/member/memberEnroll.do'">회원가입</button>   
              </c:if> 
               <c:if test="${sessionScope.logined!=null}">
                <button class="btn btn-default my-2 my-sm-0" onclick="location.href='${path}/customer/logout.do'">로그아웃</button>  
                <button class="btn btn-default my-2 my-sm-0" onclick="location.href='#'">마이페이지</button>  
          
              </c:if> 
              </div>
                <div id="container">             
                <div class="row" style="margin:0;">           
                <div class="col-sm-12 headerDiv2">
                    <div class="content">
  							<h2 onclick="mainpage();">배달의 민족</h2>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="content">
                    <div class="input-group">
                         <button id="positionBtn" onclick="getLocation4()" ><img id="locationImg" src="${path }/resources/images/place.png"></button>
                      <input type="text" id="location" onclick="sample5_execDaumPostcode();"  class="form-control" value="" placeholder="주소 찾기를 원하시면 클릭해주세요">
                         <span class="input-group-btn">
                         <button class="btn" onclick="" type="submit">검색</button>

                         </span>
                    </div>
                    </div>
                </div>
                
                </div>
                </div>
       </div>
                 <div id="map" style="width:300px;height:300px;"></div>
                         	
 
</header>