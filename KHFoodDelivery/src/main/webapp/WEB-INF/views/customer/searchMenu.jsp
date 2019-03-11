<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>
<style>
section{margin:0;padding:0;}

</style>
   

<section>
	

	<c:forEach var="i" begin="1" end="10" step="1">
	<div class="store">zzz</div>
	</c:forEach>

	
	<div><a href="#">병오형 이걸로 우선 테스트 해보세요....</a></div>
	

 


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>