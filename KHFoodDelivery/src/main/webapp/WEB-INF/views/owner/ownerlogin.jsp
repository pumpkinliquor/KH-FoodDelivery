<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>
    <div class="container">
                <div class="col-md-6 mx-auto text-center">
                   <div class="header-title">
                      <h1 class="wv-heading--title">
                        KH Delivery 사장님 로그인 해주세요!
                      </h1>
                   </div>
                </div>
                <div class="row">
                   <div class="col-md-4 mx-auto">
                      <div class="myform form ">
                         <form action="" method="post" name="login">
                            <div class="form-group">
                               <input type="text" name="id"  class="form-control my-input" id="name" placeholder="id">
                            </div>
                            <div class="form-group">
                               <input type="password" name="password"  class="form-control my-input" id="password" placeholder="password">
                            </div>
                            <div class="text-center loginDiv_1">
                               <button type="submit" class=" btn btn-block send-button tx-tfm">로그인</button>
                            </div>
                            <div class="col-md-12 ">
                               <div class="login-or">
                                  <hr class="hr-or">
                                  <span class="span-or">or</span>
                               </div>
                            </div>
                            <div class="form-group">
                               <a class="btn btn-block g-button" href="${path }/owner/insertOwner.do">
                               <i class="fa fa-google"></i>회원가입
                               </a>
                            </div>
                         </form>
                      </div>
                      <p class="small mt-3">아이디 또는 비밀번호가 기억이 안나시나요? 옆에 버튼을 눌러 찾을 수 있습니다.<a href="${path }/owner/ownerIdSearch.do" class="ps-hero__content__link">아이디찾기</a> or <a href="#">비밀번호 찾기</a>.
                      </p>
                   </div>
                </div>
             </div>


</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>