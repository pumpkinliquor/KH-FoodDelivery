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
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
	 	<jsp:param value="사장님 아이디찾기" name="pageTitle"/>
</jsp:include>

<section>
    <div class="container">
                <div class="col-md-6 mx-auto text-center">
                   <div class="header-title">
                      <h1 class="wv-heading--title">
                        	아이디 찾기
                      </h1>
                   </div>
                </div>
                <div class="row">
                   <div class="col-md-4 mx-auto">
                      <div class="myform form ">
                         <form action="${path }/owner/ownerSearchIdEnd.do" method="post" name="login">
                            <div class="form-group">
                               <input type="text" name="ownerName"  class="form-control my-input" id="ownerName" placeholder="이름">
                            </div>
                            <div class="form-group">
                               <input type="email" name="ownerEmail"  class="form-control my-input" id="email" placeholder="email">
                            </div>
                            <div class="text-center loginDiv_1">
                               <button type="submit" class=" btn btn-block send-button tx-tfm">찾기</button>
                            </div>
                             <p class="small mt-3">비밀번호가 기억이 안나세요?<a href="${path }/owner/ownerSearchPw.do" class="ps-hero__content__link"> 비밀번호 찾기</a>
                            </p>
                         </form>
                      </div>
                   </div>
                </div>
             </div>


</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>