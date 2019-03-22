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
<style>

div#map{height:1px;weight:1px;visibility: hidden;}

div.newsletter div.search1{text-align:center; margin-top:0.25%;}   
btn:active{color:blue;}
div.newsletter div.search1 .btn{background-color:#F6F6F6; }
div.newsletter div.search1 .btn:hover{background-color:#8C8C8C; color:white;}
div.group{text-align:center; box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.4);background-color:#F6F6F6; margin-top:1%; padding:0; display:none;}
div.group1{text-align:center;box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.4);padding:0;background-color:#F6F6F6;} 
div.newsletter,div.group{display:inline-block;}
 @media (max-width:843px){
	div.group{
	 display:none; 
	}
	
}
@media (min-width:843px){
	div.group1{
	
	display:none;
	}
	
} 
</style>
</head>
<body>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c&libraries=services"></script> 




   
   <script>
    $(document).ready(function () {
      $("#positionBtn").click(function(){
    	  
    	  if(${sessionScope.logined==null}){
    		  alert("로그인후 이용해주세요");
    	  }else{
            function getLocation() {
                if (navigator.geolocation) { // GPS를 지원하면
                    navigator.geolocation.getCurrentPosition(function(position) {
                     var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;
                    
                    var coords = new daum.maps.LatLng(latitude);
                    var coords1 = new daum.maps.LatLng(longitude);
                    
                    $('#lat').val(coords); // 위도
                    $('#lng').val(coords1)// 경도
                    
                    console.log(coords1);
                    console.log(coords);
                     
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                     mapOption = {
                        center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };   
                        function resizeMap() {
                            var mapContainer = document.getElementById('map');
                            mapContainer.style.width = '1px';
                            mapContainer.style.height = '1px'; 
                        }
                        function relayout() {    
                            map.relayout();
                        }

                      //주소-좌표 변환 객체를 생성합니다
                      var geocoder = new daum.maps.services.Geocoder();
                      
                    
                      //지도를 생성합니다    
                     var map = new daum.maps.Map(mapContainer, mapOption);  

                      searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                 
              function searchAddrFromCoords(coords, callback) {
          	    // 좌표로 행정동 주소 정보를 요청합니
          	   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                }
                      
               function displayCenterInfo(result, status) {
            	    if (status === daum.maps.services.Status.OK) {

            	        for(var i = 0; i < result.length; i++) {
            	            // 행정동의 region_type 값은 'H' 이므로
            	            if (result[i].region_type === 'H') {
            	            	$('#location1').val(result[i].address_name); 
            	          
            	                break;
            	            }
            	        }
            	    }    
            	}
                    
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
    	  }
      }); 
      
}); 
     
   
   
   
   
   
   //위치 검색 구현
   
       var geocoder = new daum.maps.services.Geocoder();
  
 
    function execDaumPostcode() {
    	/* var info=$('#location1').val();
    	if(info.trim().length==0){
    		alert("클릭해주세요");
    	} */
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
              $('#location1').val(fullAddr);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
 
                        var result = results[0]; //첫번째 결과의 값을 활용
 
                        // 해당 주소에 대한 좌표를 받아서
                        
                        
                        var coords = new daum.maps.LatLng(latitude);
                        var coords1 = new daum.maps.LatLng(longitude);
                        
                        $('#lat').val(coords); // 위도
                        $('#lng').val(coords1)// 경도
                        
                        console.log(coords1);
                        console.log(coords);
                       
                     
                    }
                });
            }
         }).open(); 
    } 
  



  //배달의민족 클릭시 메인으로
    function mainpage(){
       location.href="${path}/member/main.do";
    }
  
   function locationSearchStore(){
		 if(${sessionScope.logined==null}){
			 alert("로그인 후 이용해주세요");
			 location.href="${path }/customer/login.do";
		 }else{
			 
			 var firstPage=$('#firstPage').val();
			var myAddr=$('#location1').val();
			console.log(myAddr);
			 location.href="${path}/customer/selectallstore.do?myAddr="+myAddr+"&lat="+lat+"&lng="+lng;
			 

			
		 }
	 }
	 
   

   
   </script>




       
        <div class="newsletter">
                <div id="hd container">             
                <div class="row" style="margin:0;">           
                <div class="col-sm-12 headerDiv2">
              <div class="headerDiv1">
               <c:if test="${sessionScope.logined==null }">
               <a href="${path }/owner/ownerMain.do">사장님 페이지</a>
                 <a href="${path }/customer/login.do">로그인</a>
                    <a href="${path }/member/memberEnroll.do">회원가입</a>
                   
              </c:if> 
               <c:if test="${sessionScope.logined!=null}">
               <a href="${path }/customer/logout.do">로그아웃</a>
               <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}">마이페이지</a>
               
             
              </c:if> 
              </div>
                    <div class="content1">
                       <h2 onclick="mainpage();"> <span style="color:white; font-weight:bold;">간</span><span style="font-size:16px;">단하고</span> <span style="color:white; font-weight:bold;">신</span><span style="font-size:16px;">속한</span> <span style="color:white; font-weight:bold;">배</span><span style="font-size:16px;">달</span></h2>
                    </div>
                </div>
             <div class="col-sm-12">
                  <div class="content">
                  <div class="input-group">
                       <button id="positionBtn"><img id="locationImg" src="${path }/resources/images/place.png"></button>
                       <input type="hidden" value="" name="lat" id="lat"/>
 						<input type="hidden" value="" name="lng" id="lng"/>   
                    <input type="text" id="location1" onclick="execDaumPostcode();" name="myAddr" value="${sessionScope.myAddr }" class="form-control" placeholder="주소찾기를 원하시면 클릭해주세요"  readonly/>
                       <span class="input-group-btn">
                       
                       <button class="btn" onclick="locationSearchStore();" type="submit">검색</button>

                       </span>
                  </div>
                  </div>
              </div>
                
                </div> 
                </div>
                <div class="group1  col-md-12 col-lg-12">
                	 <select class="form-control" name="menuSearch" id="menuSearch" onchange="window.open(value,'_self');">
					            <option  disabled selected>메뉴검색</option>
					            <option value="${path}/customer/selectallstore.do?myAddr=${sessionScope.myAddr}">전체보기</option>
					            <option value="${path}/customer/searchmenuView?category=돈까스&myAddr=${sessionScope.myAddr}">돈까스</option> 
					            <option value="${path}/customer/searchmenuView?category=프랜차이즈&myAddr=${sessionScope.myAddr}">프랜차이즈</option>
					            <option value="${path}/customer/searchmenuView?category=치킨&myAddr=${sessionScope.myAddr}">치킨</option>
					            <option value="${path}/customer/searchmenuView?category=피자&myAddr=${sessionScope.myAddr}">피자</option>
					            <option value="${path}/customer/searchmenuView?category=중국집&myAddr=${sessionScope.myAddr}">중국집</option>
					            <option value="${path}/customer/searchmenuView?category=한식&myAddr=${sessionScope.myAddr}">한식</option>
					            <option value="${path}/customer/searchmenuView?category=족발/보쌈&myAddr=${sessionScope.myAddr}">족발/보쌈</option>
					            <option value="${path}/customer/searchmenuView?category=분식&myAddr=${sessionScope.myAddr}">분식</option>
					            <option value="${path}/customer/searchmenuView?category=디저트&myAddr=${sessionScope.myAddr}">디저트</option>
					            </select>
                
                </div>
                   <div class="group col-md-12 col-lg-12">
                <div class="btn-group btn-group-lg search1">
               <button type="button" class="btn btn-default active" onclick="allview();">전체보기</button> 
              <button type="button" class="btn btn-default" onclick="don();">돈까스</button>
              <button type="button" class="btn btn-default" onclick="fre();">프랜차이즈</button>
              <button type="button" class="btn btn-default" onclick="chi();">치킨</button>
              <button type="button" class="btn btn-default" onclick="piz();">피자</button>
              <button type="button" class="btn btn-default" onclick="jun();">중국집</button>
              <button type="button" class="btn btn-default" onclick="kor();">한식</button>
              <button type="button" class="btn btn-default" onclick="jok();">족발/보쌈</button>
              <button type="button" class="btn btn-default" onclick="base();">분식</button>
              <button type="button" class="btn btn-default" onclick="des();">디저트</button>
                
       </div>     
               </div>          
                 <div id="map" style="width:300px;height:300px;"></div> 
       </div>
       <div style="width:300px;height:100px;"></div>


<script>

function allview(){
	location.href="${path}/customer/selectallstore.do?myAddr=${sessionScope.myAddr}";
}
function don(){
	location.href="${path}/customer/searchmenuView?category=돈까스&myAddr=${sessionScope.myAddr}"; 
}

function fre(){
	location.href="${path}/customer/searchmenuView?category=프랜차이즈&myAddr=${sessionScope.myAddr}"; 
}

function chi(){
	location.href="${path}/customer/searchmenuView?category=치킨&myAddr=${sessionScope.myAddr}"; 
}

function piz(){
	location.href="${path}/customer/searchmenuView?category=피자&myAddr=${sessionScope.myAddr}"; 
}

function jun(){
	location.href="${path}/customer/searchmenuView?category=중국집&myAddr=${sessionScope.myAddr}"; 
}

function kor(){
	location.href="${path}/customer/searchmenuView?category=한식&myAddr=${sessionScope.myAddr}"; 
}

function jok(){
	location.href="${path}/customer/searchmenuView?category=족발/보쌈&myAddr=${sessionScope.myAddr}"; 
}

function base(){
	location.href="${path}/customer/searchmenuView?category=분식&myAddr=${sessionScope.myAddr}"; 
}

function des(){
	location.href="${path}/customer/searchmenuView?category=디저트&myAddr=${sessionScope.myAddr}";
	
}


</script>
        
             
                 
                 
            

 

                            