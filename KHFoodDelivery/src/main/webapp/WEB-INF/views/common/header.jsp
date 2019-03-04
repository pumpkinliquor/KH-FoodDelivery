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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c"></script>
   <script>
   $(document).ready(function () {
		$("#positionBtn").click(function(){
  			 function getLocation() {
			       if (navigator.geolocation) { // GPS를 지원하면
			           navigator.geolocation.getCurrentPosition(function(position) {
			           alert("현재위치:   위도 : "+position.coords.latitude + " 경도: " + position.coords.longitude);
			
					   		var container = document.getElementById('map');
					   		var options = {
					   			center: new daum.maps.LatLng(position.coords.latitude, position.coords.longitude),
					   			level: 2
					   		};
			
			   					var map = new daum.maps.Map(container, options);
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
                         <input type="text" class="form-control" placeholder="주소를 입력해주세요">
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