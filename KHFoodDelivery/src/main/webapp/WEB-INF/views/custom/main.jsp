<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<script src="http://code.jquery.com/jquery-3.3.1.min.js" ></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp"> 
 	<jsp:param value="" name="pageTitle"/>
</jsp:include> 
<style>
div.menu1,div.menu2{float:left;}

</style>


<div class="container">
	<div class="col=sm-12">
	<div class="menu1 col-xs-4 col-sm-2 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	<div class="menu2 col-xs-4 col-sm-2 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="http://www.cheogajip.co.kr/data/file/menu/thumb-32732614_YWU1n3tP_8a7f0411cdb17502e7a15a8c561440fd9fc4c61a_290x297.png"></a></div>
	
	
	
	
	
	
	
	
	</div>








</div>







<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>