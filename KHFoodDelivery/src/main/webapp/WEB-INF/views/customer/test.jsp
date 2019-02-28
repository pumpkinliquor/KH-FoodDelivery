<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<section>
    <div id="map" style="width:800px;height:600px;"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[자신의 카카오 API 키(Script)]"></script>

    <script>

        var container = document.getElementById('map');

        var options = {

            center: new daum.maps.LatLng(33.450701, 126.570667),

            level: 3

        };

 

        var map = new daum.maps.Map(container, options);

        function setCenter(lat, lng) {

            map.setCenter(new daum.maps.LatLng(lat, lng));

        }

    </script>


</section>
 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>