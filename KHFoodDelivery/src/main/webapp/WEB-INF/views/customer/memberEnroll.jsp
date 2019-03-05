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
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 <style>
      div#enroll-container{width:400px; margin:0 auto; text-align:center;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	
	
    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ok{color:blue;}
    div#enroll-container span.error{color:red;}
	    
         <script>
            function maxLengthCheck(object){
                if (object.value.length > object.maxLength){
                  object.value = object.value.slice(0, object.maxLength);
                }    
              }
            	
            
            
            </script>
</style>      
      <div id="enroll-container">
         <form action="${path }/member/memberEnrollEnd.do" method="post" >
            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" required> 
            <input type="password" class="form-control" placeholder="비밀번호" name="memberPw" id="memberPw2" required>
            <input type="password" class="form-control" placeholder="비밀번호확인"name="memberPw2" id="memberPw2" required>
            <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" required>
             <input type="text" class="form-control" placeholder="닉네임" name="nickName" id="nickName" required>
            <input type="number" class="form-control" placeholder="생년월일(예:910729)" name="memberBirth" id="memberBirth" maxlength="6" oninput="maxLengthCheck(this)">
            <input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="memberEmail" required>
            <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="memberPhone" id="memberPhone" maxlength="11" required>
            <input type="text" class="form-control" placeholder="주소" name="memberAddress" id="memberAddress">
            <select class="form-control" name="gender" required>
               <option value="" disabled selected>성별</option>
               <option value="M">남</option>
               <option value="F">여</option>
            </select>
         
         
            <br />
            <input type="submit" class="btn btn-outline-secondary" value="가입" >&nbsp;
            <input type="reset" class="btn btn-outline-secondary" value="취소">
         </form>
      </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>