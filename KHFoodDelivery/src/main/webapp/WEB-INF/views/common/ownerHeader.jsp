<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${param.pageTitle }</title>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
 --%> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Ostyle.css" />
<style>
  .headerDiv2{
  	width:100%;
  	z-index: 9;
 
  }
  .headerDiv1{
   	background-color: #4D4D4D;
  }
  .headerDiv1 a{
  	color:white;
  }
   .headerDiv1 a:hover { text-decoration: none;}
</style>
<script>

/* 	$(function(){aa
		$(window).scroll(function(){
			var num = $(this).scrollTop();
		
			if(num > 107){
				$(".headerDiv2").css("position","fixed");
			}else{
			 	$(".headerDiv2").css("position","absolute"); 
			}
		});
	}); 
	
 	function fn_order(){
		 location.href="${path}/demo/udateDev.do?no="+devNo; 
		 href="${path }/owner/storeChoice.do?ownerId="${sessionScope.ownerId}
	} */
	
</script>

</head>
 <body>
	<header>
<div class="headerDiv2">
    <div class="headerDiv1">
    	<c:if test="${sessionScope.ownerId == null}">
          <a href="${path }/owner/login.do">로그인</a>
          <a href="${path }/owner/insertOwner.do">회원가입</a>
        </c:if> 
        <c:if test="${sessionScope.ownerId != null }"> 
          <a href="${path }/owner/logout.do">로그아웃</a>
          <a href="${path }/owner/myPage.do">마이페이지</a>
         </c:if>
    </div>
  
  
  
      <nav class="navbar navbar-expand-sm  navbar-dark ownerNav">
  
    <!-- Links -->
    <ul class="navbar-nav container ">
      <li class="nav-item" style="margin-left:-20px;font-size:40px">
      <a class="nav-link" href="${path }/owner/ownerMain.do" style="cursor:pointer;"><span style="color:white; font-weight:bold;">간</span><span style="font-size:16px;">단하고</span> <span style="color:white; font-weight:bold;">신</span><span style="font-size:16px;">속한</span> <span style="color:white; font-weight:bold;">배</span><span style="font-size:16px;">달</span></a>
    </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/owner/menuStoreChoice.do?ownerId=${sessionScope.ownerId}">메뉴관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/owner/storeForm.do">업체등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }">업소통계</a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="${path }/owner/customService.do">고객센터</a>
      </li>
  	  <li class="nav-item">
       <a class="nav-link"  href="${path }/owner/storeChoice.do?ownerId=${sessionScope.ownerId}">주문관리</a>
      </li>
       <li class="nav-item">
       <a class="nav-link"  href="${path }/owner/ownerReview.do?ownerId=${sessionScope.ownerId}">리뷰관리</a>
      </li>

    </ul>
  </nav>
 </div>
</header>