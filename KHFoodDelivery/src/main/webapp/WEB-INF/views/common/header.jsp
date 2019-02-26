<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 <header>
  <nav class="navbar navbar-expand-sm bg-light justify-content-center login">
        <ul class="navbar-nav">
        	<!-- if문 사용해서 나누기 -->
          <li class="nav-item">
            <a class="nav-link" href="#"  style="background-color:#F8F9FA">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="background-color:#F8F9FA">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"  style="background-color:#F8F9FA">마이페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="background-color:#F8F9FA">로그아웃</a>
          </li>
        </ul>
      </nav>
  
  
      <nav class="navbar navbar-expand-sm  navbar-dark ">
  
    <!-- Links -->
    <ul class="navbar-nav container ">
      <li class="nav-item" style="margin-left:-20px;font-size:30px">
      <a class="nav-link" href="${path }/">배달의 민족</a>
    </li>
      <li class="nav-item">
        <a class="nav-link" href="${path }/">HOMEPAGE</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">ABOUT US</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">SERVICES</a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="#">CONTACTS</a>
      </li>
  
      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
          MORE
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Link 1</a>
          <a class="dropdown-item" href="#">Link 2</a>
          <a class="dropdown-item" href="#">Link 3</a>
        </div>
      </li>
    </ul>
  </nav>
 
</header>