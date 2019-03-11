<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>
<style>
div.store{border:1px solid black;}
div.store a{text-decoration:none; color:black;}
</style>
   

<section>

<div class="container">

	 <div class="store row">
	
	<c:forEach items="${list}" var="i" >
	<div><a href="#">이름: ${i.storeName}</a><br/>
	<a href="#">가게 번호: ${i.storePhone}</a><br/>
	<a href="#">가게 주소: ${i.storeAddress}</a><br/>
	<a href="#">이미지: ${i.storeImage}</a><br/>
	<a href="#">프로필:  ${i.storeProfile}</a><br/>
	<a href="#">사장번호: ${i.businessPhone}</a><br/>
	
	</div>
	</c:forEach>
	

 


</div>
</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>