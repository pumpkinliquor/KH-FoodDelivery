<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>
<style>
div.store{border:1px solid #E4E4E4; background-color:#FFFFFF;margin:6px;position: relative; display:inline-block;}
div.store a{text-decoration:none; color:black;}  
 /* div.me{text-align:center;} */ 
section{background-color:#F6F6F6;}
.option{text-align:center;}
</style>
   

<section>

<div class="me container">
<a class="option">간신배 등록 음식점</a>
<br/><br/>

	<c:forEach items="${list}" var="i" >
	 <div class="store col-lg-5"> 
	 
	<div>
	<a href="${path }/customer/menuInfo.do?storeName=${i.storeName}">이름: ${i.storeName}</a><br/>
	<a href="#">가게 번호: ${i.storePhone}</a><br/>
	<a href="#">가게 주소: ${i.storeAddress}</a><br/>
	<a href="#">이미지: ${i.storeImage}</a><br/>
	<a href="#">프로필:  ${i.storeProfile}</a><br/>
	<a href="#">사장번호: ${i.businessPhone}</a><br/>
	
	</div>
</div>
	</c:forEach>
	

 


</div>
${pageBar}
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>