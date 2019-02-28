<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


 <jsp:include page="/WEB-INF/views/common/header.jsp"> 
 	<jsp:param value="" name="pageTitle"/>
</jsp:include> 
<style>
div.menu1,div.menu2,div.menu3{position: relative; display:inline-block; border :1px solid #BDBDBD;margin:7px;   text-align:center; overflow: hidden;width: 100%;box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, 0.5); }
div.menu4,div.menu5,div.menu6{position: relative; display:inline-block;  border :1px solid #BDBDBD;margin:7px;  text-align:center; overflow: hidden;width: 100%;box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, 0.5); }
div.menu7,div.menu8,div.menu9{position: relative; display:inline-block;  border :1px solid #BDBDBD; margin:7px; text-align:center; overflow: hidden;width: 100%;box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, 0.5); }
div.main a{text-decoration:none; color:black;}
img.i{max-width:100%; max-height: 100%; margin-bottom:-9.9305px;margin-left:14%;vertical-align: middle;}
div.main{text-align:center;}

  div.container{margin-bottom:8%;/* box-shadow: 0px 0px 0px 3px rgba(0, 0, 0, 0.8); */}







</style>



<section>
<div class="container">

	 <div class="mainrow row">
	 
	<div class="main col-sm-12">
	
	
	<div class="menu1 col-xs-6 col-sm-4 col-md-3 col-lg-3 "><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">돈까스/일식</div> <img class="i" src="${path}/resources/images/customer/main/돈까스.png"></a></div>
	
	<div class="menu2 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">프랜차이즈</div><img class="i" src="${path}/resources/images/customer/main/핫도그.png"></a></div>
	
	<div class="menu3 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">치킨</div><img class="i" src="${path}/resources/images/customer/main/치킨.png"></a></div>
	

	
	<div class="menu4 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">피자</div><img class="i" src="${path}/resources/images/customer/main/피자.png"></a></div>
	
	<div class="menu5 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">중국집</div><img class="i" src="${path}/resources/images/customer/main/자장면.png"></a></div>
	
	<div class="menu6 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">한식</div><img class="i" src="${path}/resources/images/customer/main/한식.png"></a></div>
	
	

	<div class="menu7 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">족발/보쌈</div><img class="i" src="${path}/resources/images/customer/main/보쌈.png"></a></div>
	
	<div class="menu8 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">분식</div><img class="i" src="${path}/resources/images/customer/main/분식.png"></a></div>
	
	<div class="menu9 col-xs-6 col-sm-4 col-md-3 col-lg-3"><a href="" class="thumbnail" ng-click="select_home_category('1인분주문')">
	<div class="category-title">디저트</div><img class="i" src="${path}/resources/images/customer/main/디저트.png"></a></div>
	
	

		</div>
	</div>

</section>
</div>







<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>