<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>

<div id="map1"></div>
 <script>
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
 mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();



//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    if (status === daum.maps.services.Status.OK) {
    	
    	 var infoDiv = document.getElementById('centerAddr');
    	 
    	 
    	 infoDiv.innerHTML = '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
     
    }   
});
});

function searchDetailAddrFromCoords(coords, callback) {
// 좌표로 법정동 상세 주소 정보를 요청합니다
geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}




</script>
<div id="centerAddr"></div>



 



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>