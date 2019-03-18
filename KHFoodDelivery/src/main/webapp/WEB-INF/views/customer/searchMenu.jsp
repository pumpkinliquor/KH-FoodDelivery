<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>
<style>
 div.store{border:1px solid #E4E4E4; background-color:#FFFFFF;margin:6px;position: relative; display:inline-block;}
 div.store a{text-decoration:none; color:black; text-align:left;}   
 div.me{margin-top:-3%;}  
body{background-color:#F6F6F6;} 

 div.me div.a .option{text-align:center;}  
</style>
   

<section>

<div class="me container">
	<div class="a">
	
	
	
	<c:forEach items="${list}" var="i" >
	 <div class="store col-lg-5">
	  
	<div class="col-md-8" style="float:left;" >
	<a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><h4 style="margin-top:10%;"> ${i.storeName}</h4></a><br/>
	<a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><b>${i.storeProfile}</b></a><br/>
	<a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><b>가게 번호: ${i.storePhone}</b></a><br/>
	<a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><b>가게 주소: ${i.storeAddress}</b></a><br/>
	</div>
	<div class="col-md-4" style="float:left; margin-top:10%; margin-bottom:10%;">
	<a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><img src="${path }/resources/upload/owner/storeMainImage/${i.storeImage}" style="width:100%; height:100%;"/></a><br/>
	</div>
	
</div>
	</c:forEach>
	</div>

</div>
${pageBar}
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>