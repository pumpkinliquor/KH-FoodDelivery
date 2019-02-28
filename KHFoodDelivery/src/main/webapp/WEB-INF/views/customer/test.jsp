<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>



<body>

<!-- 	 <div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c"></script> -->

 <script>
 
 
/*  $(document).ready(function () {
		$("#Btn").click(function(){
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
}); */
 
	</script>
	
	 






</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>