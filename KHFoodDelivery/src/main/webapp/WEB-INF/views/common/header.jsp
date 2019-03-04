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
			        	
						 	//필요없음
			        	
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
	
	
	</script>
		 <div id='centerAddr1'></div>


        <div class="newsletter">
              <div class="headerDiv1">
                    <a href="${path }/customer/login.do/">로그인</a>        
                    <a href="#">회원가입</a>
              		<a href="#">로그아웃</a>
              </div>
                <div id="container">             
                <div class="row" style="margin:0;">           
                <div class="col-sm-12 headerDiv2">
                    <div class="content">
  							<h2>배달의 민족</h2>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="content">
                    <div class="input-group">
                         <button id="positionBtn"><img id="locationImg" src="${path }/resources/images/place.png"></button>
                       <input type="text" id="location" class="form-control" value="" placeholder="주소를 입력해주세요">
                         <span class="input-group-btn">
                         <button class="btn" type="submit">검색</button>

                         </span>
                    </div>
                    </div>
                </div>
                
                </div>
                </div>
       </div>
                 <div id="map" style="width:300px;height:300px;"></div>
                         	
 
</header>