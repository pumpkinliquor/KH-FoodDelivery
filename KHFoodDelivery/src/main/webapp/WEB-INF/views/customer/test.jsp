<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>

<div id="content"></div>
<script>
    var lon = 37.4923615;
    var lat = 127.02928809999999;
    function test(){
		$.ajax({
    url: 'https://apis.daum.net/local/geo/coord2addr?apikey=feed05c2d7c3c51d07205126e0f9d71b=' + lon + '&latitude=' + lat + '&inputCoordSystem=WGS84&output=json',
    type: 'GET',
    cache: false,
    context: {},
    crossOrigin: true,
    success: function(data) {
        var jsonObj = $.parseJSON(data);
        var contentText = document.getElementById('content');
            contentText.innerHTML += "<br>동네 이름 : " + jsonObj.name + " / 전체 주소 : " + jsonObj.fullName + " / 나라 : " + jsonObj.name0;
    },error:function(request,status,error){
        alert("다시 시도해주세요.\n" + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
});
    }

</script>
</section>
 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>