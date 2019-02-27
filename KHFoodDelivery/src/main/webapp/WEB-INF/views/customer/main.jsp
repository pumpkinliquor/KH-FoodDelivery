<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<head>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
<script src="http://code.jquery.com/jquery-3.3.1.min.js" ></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp"> 
 	<jsp:param value="" name="pageTitle"/>
</jsp:include> 
<style>
div.menu1,div.menu2,div.menu3{float:left; border :1px solid black;margin-right:20px; margin-bottom:20px;}
div.menu4,div.menu5,div.menu6{float:left; border :1px solid black;margin-right:20px; margin-bottom:20px;}
div.menu7,div.menu8,div.menu9{float:left; border :1px solid black;margin-right:20px; margin-bottom:20px;}
a{text-decoration:none; color:black;}
img{max-width:100%;heigth:auto; margin-bottom:-9.9305px;margin-left:14.8%; top:0;left:0;}

</style>


<div class="container">
	<div class="col=sm-12">
	
	<div class="menu1 col-xs-6 col-sm-4 col-md-3 col-lg-3 "><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">돈까스/일식</div> <img src="${path}/resources/images/customer/main/돈까스.png"></a></div>
	
	<div class="menu2 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">프랜차이즈</div><img src="${path}/resources/images/customer/main/핫도그.png"></a></div>
	
	<div class="menu3 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img src="${path}/resources/images/customer/main/치킨.png"></a></div>
	
	<div class="menu4 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">피자</div><img src="${path}/resources/images/customer/main/피자.png"></a></div>
	
	<div class="menu5 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">중국집</div><img src="${path}/resources/images/customer/main/자장면.png"></a></div>
	
	<div class="menu6 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">한식</div><img src="${path}/resources/images/customer/main/한식.png"></a></div>
	
	<div class="menu7 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">족발/보쌈</div><img src="${path}/resources/images/customer/main/보쌈.png"></a></div>
	
	<div class="menu8 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">분식</div><img src="${path}/resources/images/customer/main/분식.png"></a></div>
	
	<div class="menu9 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">디저트</div><img src="${path}/resources/images/customer/main/디저트.png"></a></div>

	


</div>

</div>





<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>